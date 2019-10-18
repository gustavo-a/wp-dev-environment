include .env

bash:
	docker exec -it --user daemon $(PROJECT_NAME)_wp bash

start:
	docker-compose up -d

stop:
	docker-compose stop

remove:
	@echo "Removing containers..."
	docker-compose rm -s -f -v
	sudo rm -rfv ./backups/*
	sudo touch ./backups/.gitkeep
	sudo rm -rf ./wp

init:
	@echo " ========= 💥 Let's Code! =========="

	@echo "Building wordpress image!"
	make start

	@echo "Adding local address to /etc/hosts"
	sudo ./hosts.sh

	@echo "Deleting .git folder"
	sudo rm -rf ./.git

	sudo chmod -R 777 ./backups
