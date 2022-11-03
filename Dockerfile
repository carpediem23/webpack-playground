# ------------------------------------------------------
# App Deploy
# ------------------------------------------------------
FROM node:16-alpine AS deploy
WORKDIR /usr/src/webpack-playground
ENV PATH /usr/src/webpack-playground/node_modules/.bin:$PATH
RUN npm install
COPY . .
RUN npm start