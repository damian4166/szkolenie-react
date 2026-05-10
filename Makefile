PROD= docker-compose.prod.yml
DEV= docker-compose.yml

ENV=$(PROD)

DC = docker compose -f $(ENV)

.PHONY: up
up:
	@echo "Uruchamianie środowiska Docker..."
	$(DC) up -d

.PHONY: down
down:
	@echo "Zatrzymanie kontenerów..."
	$(DC) down --remove-orphans

.PHONY: build
build:
	$(DC) build		

.PHONY restart
restart: down up

.PHONY: pull
pull:
	git pull

.PHONY setup
setup: pull build restart
