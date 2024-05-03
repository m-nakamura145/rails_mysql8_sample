## -*- mode: makefile-gmake; -*-

init: ## Initialize environment
	docker-compose up --build --no-start
	$(MAKE) bundle
	$(MAKE) dbinit

start: _docker_compose   ## docker-compose start
stop: _docker_compose    ## docker-compose stop
restart: _docker_compose ## docker-compose restart

_docker_compose:
	@docker-compose $(MAKECMDGOALS)

bash: ## Run bash in api container
	@docker-compose exec api bash

bundle: ## Run bundle install
	docker-compose run --rm api bundle config set clean true
	docker-compose run --rm api bundle install --jobs=4

dbinit: ## Initialize database
	docker-compose run --rm api bundle exec rails db:drop db:setup

migrate: ## Run db:migrate
	@docker-compose run --rm api bundle exec rails db:migrate
