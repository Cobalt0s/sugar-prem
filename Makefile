SVC_TAG=ampersand-sugar

build:
	docker build -t $(SVC_TAG) .

local: build
	docker run -p 8000:80 $(SVC_TAG)

apache:
	docker run -d --name my-apache2 -p 3000:80 httpd