FROM node:18

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y netcat-openbsd

RUN npm install

RUN chmod +x ./generate-prisma.sh
RUN chmod +x ./entrypoint.sh

CMD ["sh", "./entrypoint.sh"]