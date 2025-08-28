FROM node:18

WORKDIR /app

# copy parent folder content
COPY . .

# copy local entrypoint file
COPY run-tests/entrypoint.sh ./entrypoint.sh

RUN apt-get update && apt-get install -y netcat-openbsd

RUN npm install

RUN chmod +x ./entrypoint.sh

CMD ["sh", "./entrypoint.sh"]