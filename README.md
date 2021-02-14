# Silverstripe Demo

This is a demo of how to create and develop a Silverstripe website using Docker.

See the blog [Troubleshooting Docker](https://pen-y-fan.github.io/2021/02/12/Troubleshooting-Docker/) for more details.

## Installation ##

Requirements:

- [Docker](https://www.docker.com/products/docker-desktop) with [docker-compose](https://docs.docker.com/compose/install/)
- [git](https://git-scm.com/downloads) (or use [Docker alpine/git](https://hub.docker.com/r/alpine/git))

Optional:

- [make](https://www.cyberciti.biz/faq/debian-linux-install-gnu-gcc-compiler/)

```sh
git clone git@github.com:Pen-y-Fan/silverstripe-demo
cd silverstripe-demo
```

Using make:

```sh
make up
make shell
# inside the container:
composer update
exit
# back in the host terminal:
make chown
```

Without Make installed:

```sh
docker-compose run silverstripe bash
# inside the container:
composer update
exit
docker-compose up --build --remove-orphans -d server
# back in the host terminal:
docker-compose exec silverstripe chown -R $(id -u):$(id -g) ./
docker-compose exec silverstripe chown -R 33:33 ./public/
```

Navigate to <localhost:8081>, the site will build.

- <localhost:8081> will be the basic site
- <localhost:8081/admin> will give CMS access, for the username / password use **admin** / **password**  

## Overview

Base project folder for a SilverStripe ([http://silverstripe.org](http://silverstripe.org)) installation. Required modules are installed via [http://github.com/silverstripe/recipe-cms](http://github.com/silverstripe/recipe-cms). For information on how to change the dependencies in a recipe, please have a look at [https://github.com/silverstripe/recipe-plugin](https://github.com/silverstripe/recipe-plugin). In addition, installer includes [theme/simple](https://github.com/silverstripe-themes/silverstripe-simple) as a default theme.

## Getting started with Silverstripe

See [Getting Started](https://docs.silverstripe.org/en/4/getting_started/) for more information.

## Bugtracker ##

Bugs are tracked on github.com ([framework issues](https://github.com/silverstripe/silverstripe-framework/issues),
[cms issues](https://github.com/silverstripe/silverstripe-cms/issues)).
Please read our [issue reporting guidelines](https://docs.silverstripe.org/en/4/contributing/issues_and_bugs/).

## Development and Contribution ##

If you would like to make changes to the SilverStripe core codebase, we have an extensive [guide to contributing code](https://docs.silverstripe.org/en/4/contributing/code/).

## Links ##

 * [Changelogs](https://docs.silverstripe.org/en/4/changelogs/)
 * [Bugtracker: Framework](https://github.com/silverstripe/silverstripe-framework/issues)
 * [Bugtracker: CMS](https://github.com/silverstripe/silverstripe-cms/issues)
 * [Bugtracker: Installer](https://github.com/silverstripe/silverstripe-installer/issues)
 * [Forums](http://silverstripe.org/forums)
 * [Developer Mailinglist](https://groups.google.com/forum/#!forum/silverstripe-dev)
 * [License](./LICENSE)
