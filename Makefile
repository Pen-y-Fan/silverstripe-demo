# Usage:
# make up - starts the docker-compose in the same directory in demon (background)
# make down - stops the docker-compose
# make shell - opens a bash terminal in the running Silverstripe container as a standard user
# make shell-root -  opens a bash in Silverstripe container as root user
# make shell-web -  opens a bash in Silverstripe container as www-data user
# make up-f - start the docker-compose in foreground (useful for error messages)

# To check your user ID run echo $(id -u)
UID = 1000

down:
	docker-compose down --remove-orphans
shell:
	docker-compose exec -u ${UID}:${UID} silverstripe bash
shell-run:
	docker-compose run -u ${UID}:${UID} silverstripe bash
shell-root:
	docker-compose exec silverstripe bash
shell-web:
	docker-compose exec -u 33:33 silverstripe bash
up:
	docker-compose up --build --remove-orphans -d
up-f:
	docker-compose up --build --remove-orphans
.PHONY : tests
tests:
	docker-compose exec silverstripe vendor/bin/phpunit
	docker-compose exec silverstripe chown -R ${UID}:${UID} ./
	docker-compose exec silverstripe chown -R 33:33 ./public/
lint:
	docker-compose exec -u ${UID}:${UID} silverstripe vendor/bin/phpcs app/src app/tests
lint-clean:
	docker-compose exec -u ${UID}:${UID} silverstripe vendor/bin/phpcbf app/src app/tests
flush:
	docker-compose exec silverstripe vendor/bin/phpunit app/tests '' flush=1
	docker-compose exec silverstripe chown -R ${UID}:${UID} ./
	docker-compose exec silverstripe chown -R 33:33 ./public/

chown:
	docker-compose exec silverstripe chown -R ${UID}:${UID} ./
	docker-compose exec silverstripe chown -R 33:33 ./public/
