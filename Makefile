SVC_TAG=ampersand-sugar

build:
	docker build -t $(SVC_TAG) .

local: build
	docker run -p 8000:80 $(SVC_TAG)

apache-raw:
	docker run -d --name my-apache2 -p 3000:80 httpd

permissions:
	sudo chmod -R 777 sugar-ent/

copy:
	cp ./files/info.php ./sugar-ent/info.php && \
	cp ./files/config.php ./sugar-ent/config.php

# Wait for few seconds for docker compose to start mysql
.PHONY: prepare-tables
prepare-tables:
	script=$$(sleep 3; docker exec sugar-prem-mysql-1 /bin/bash -c "mysql -u root -proot -D sugarcrm -e '$$(cat ./files/prepare.sql)'"); $$script

start: permissions
	docker-compose up -d

stop:
	docker-compose down

install-prepare: start copy prepare-tables
	echo "==> Ready to install"

unzip:
	unzip -o SugarEnt-14.0.0.zip > /dev/null; mv SugarEnt-Full-14.0.0/ ./sugar-ent

# We must restart docker compose to pick up volume changes
install: unzip install-prepare stop

clean: permissions
	rm -rf ./sugar-ent > /dev/null; rm -rf ./SugarEnt-14.0.0 > /dev/null

reinstall: clean install
