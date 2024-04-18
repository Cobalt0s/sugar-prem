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

.PHONY: prepare-tables
prepare-tables:
	script=$$(docker exec sugar-prem-mysql-1 /bin/bash -c "mysql -u root -proot -D sugarcrm -e '$$(cat ./files/prepare.sql)'"); $$script


install-prepare: permissions copy prepare-tables
	echo "==> Ready to install"

unzip:
	unzip -o SugarEnt-14.0.0.zip > /dev/null; mv SugarEnt-Full-14.0.0/ ./sugar-ent

install: unzip install-prepare
