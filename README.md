#  Wp Dev Environment
I created this beacause I wanted to skip the boring setup of a proper environment to develop wordpress themes and plugins.

It has PHP My Admin access and automated database backups.

This `docker-compose.yml` file includes four images:

- `mariadb`
- `phpmyadmin/phpmyadmin`
- `bitnami/wordpress:latest`
- `databak/mysql-backup`

## Before you start

What you need to get up and running:
 - Any linux distro
 - Docker
 - A nginx proxy. See: https://github.com/jwilder/nginx-proxy

>Note: This was made for Linux so if you are on Windows or macOs you'll have to tweak one thing or another

## How-to

1. First of all, clone this repo in your project folder: 

    ```
    $ git clone https://github.com/gustavo-a/wp-dev-environment.git /path/to/your/project
    ```

2. Then you need to set up a `.env` file with your project name. This will be your local domain.

    ```
    PROJECT_NAME=yourprojectname
    ```

3. Make the necessary changes to the `docker-compose.yml` file.

4. Execute `make init` on your terminal to start the setup.
This command will start your container, delete the `.git` folder and fix some permissions.

## I've done it! Now what?

You can access your wordpress site at `yourprojectname.local`.

You can access PHP My Admin at `phpmyadmin.yourprojectname.local`.

You can edit your php settings in the `config/php/php.ini` file.

You can edit your apache settings in the `config/apache/httpd.conf` file.

## Shortcuts

I've also added some shortcuts to the `Makefile`

- `make bash` run bash terminal inside the container
- `make stop` stops the container
- `make start` starts the container
- `make remove` removes the container along with its volumes and delete the backups
