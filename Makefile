PROD = docker-compose.prod.yml
DEV = docker-compose.yml

ENV = $(PROD)

DC = docker compose -f $(ENV)

.PHONY: setup
setup: pull build restart
	@echo "Projekt został pomyślnie zaktualizowany i uruchomiony"

.PHONY: up
up: $(DC) up -d
	@echo "Uruchamianie środowiska Docker..."

.PHONY: down
down: $(DC) down --remove-orphans
	@echo "Zatrzymanie kontenerów..."

.PHONY: build
build: $(DC) build
	@echo "Budowanie projektu"		

.PHONY: restart
restart: down up
	@echo "Restart projektu"
	

.PHONY: pull
pull: git pull
	@echo "Pobieranie aktualizacji"
	


