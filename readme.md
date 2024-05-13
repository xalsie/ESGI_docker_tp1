# Projet Docker 4IW

Créer une application avec une API Symfony avec 1 endpoint qui récupère des data sur une
BDD Postgres et les afficher sur le front. 10 lignes de todo (id, titre, done)
Pour les images custom, toujours partir d'une base alpine

> Groupe de 3 maximum (sauf exception)

Notation:

1. Qualité de la soutenance (3 points)
2. Projet fonctionnel (2 points)
3. Symfony custom (3 points)
4. Adminer custom (2 points)
5. Postgres custom (variables d'environnement fonctionelles) (3 points)
6. Composer custom (2 points)
7. Question de cours (3 points)
8. Le Symfony et la BDD sur des docker-compose différents (2 points)

Rendu final:

> Fichier texte sur myges avec URL d'un GitHub qui contient tout le projet \
> Mon username GitHub: quentinhermiteau

## URL Docker Hub

-   [Composer](https://hub.docker.com/r/legrizzly/composer-custom)
-   [postgres](https://hub.docker.com/r/legrizzly/pgsql-custom)
-   [Symfony](https://hub.docker.com/r/legrizzly/symfony-custom)
-   [PHP](https://hub.docker.com/r/legrizzly/php-custom)
-   [Adminer](https://hub.docker.com/r/legrizzly/adminer-custom)

## Installation Symfony CLI

## /! ATTENTIION !\

> Le nom du projet doit être `my_project_directory` pour que la configuration de nginx fonctionne correctement sinon modifier le fichier `default.conf` dans le dossier `./docker/nginx` pour correspondre au nom du projet

```bash
docker compose -f ".\docker-compose.web.yml" exec symfony /bin/bash
composer create-project symfony/skeleton:"7.0.*" my_project_directory
cd my_project_directory
composer require webapp
```
