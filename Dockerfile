FROM node:16-alpine
ENV NODE_ENV=development
WORKDIR /usr/src/webpack-playground
ENV PATH /usr/src/webpack-playground/node_modules/.bin:$PATH
COPY package.json package.json
COPY package-lock.json package-lock.json
RUN npm install
COPY . .
EXPOSE 8080
RUN chown -R node /usr/src/webpack-playground
USER node
RUN npm start