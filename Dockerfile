FROM php:alpine

COPY --from=public.ecr.aws/awsguru/aws-lambda-adapter:0.8.4 /lambda-adapter /opt/extensions/lambda-adapter

WORKDIR /app
COPY . /app

CMD [ "php", "artisan", "serve", "--host=0.0.0.0", "--port=8080" ]

