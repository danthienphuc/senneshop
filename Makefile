docker-build-image:
    docker-compose build app
    docker-compose up -d
    docker-compose exec app ls -l
    docker-compose exec app rm -rf vendor composer.lock
    docker-compose exec app composer install

docker-build-app:
    docker-compose exec app php artisan key:generate
    docker-compose exec app php artisan migrate
    docker-compose exec app php artisan db:seed

docker-config:
    docker-compose exec app php artisan config:cache

docker-run-app:
    docker-compose exec app php artisan serve --host=localhost:8080

docker-log:
    docker-compose logs nginx

docker-pause:
    docker-compose pause

docker-unpause:
    docker-compose unpause

docker-down:
    docker-compose down

config: # config cache
    @php artisan config

run:
    php artisan serve

