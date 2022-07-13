# develop stage
FROM node:18-alpine as develop-stage
WORKDIR /app
COPY package*.json ./
RUN yarn install
COPY . .