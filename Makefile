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
