#!/bin/bash

<<task
Deploy a Django app
and handle the code for errors
task


code_clone(){
	echo "Cloning the django app"
	git clone https://github.com/LondheShubham153/django-notes-app.git
}

install_requirements(){
	echo "Installing dependencies"
	sudo apt-get install docker.io nginx -y docker-compose
}

required_restarts(){
	sudo chown $USER /var/run/docker.sock
#	sudo systemctl enable docker
#	sudo systemctl enable nginx
#	sudo systemctl restart docker
}

deploy(){
	docker build -t notes-app .
	#docker run -d -p 8000:8000 notes-app:latest
docker-compose up -d
}

echo "************ DEPLOYMENT STARTED *************"

code_clone || { echo "The code directory already exists"; cd django-notes-app; }

install_requirements || { echo "Installation Failed..."; exit 1; }

required_restarts || { echo "System fault"; exit 1; }

deploy || {
	echo "Deployment failed"
       	#sendmail
	exit 1
 }

echo "************ DEPLOYMENT DONE *************"
