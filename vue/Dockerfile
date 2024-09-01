FROM node:20

WORKDIR /app

COPY ./vue .
RUN npm install

CMD ["npm", "run", "serve", "--", "--port", "3000"]
