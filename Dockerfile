FROM php:alpine

COPY --from=public.ecr.aws/awsguru/aws-lambda-adapter:0.8.4 /lambda-adapter /opt/extensions/lambda-adapter

WORKDIR /app
COPY . /app


RUN echo 'php artisan migrate --force' >> start.sh && echo 'php artisan serve --host=0.0.0.0 --port=8080' >> start.sh
RUN chmod +x start.sh

CMD [ "./start.sh" ]

