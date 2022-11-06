# ------------------------------------------------------
# App Deploy
# ------------------------------------------------------
FROM node:16-alpine AS deploy
WORKDIR /usr/src/webpack-playground
ENV PATH /usr/src/webpack-playground/node_modules/.bin:$PATH
COPY package*.json ./
RUN npm install --production
COPY . .
RUN npm run build --loglevel verbose

# ------------------------------------------------------
# Production Deploy
# ------------------------------------------------------
FROM nginx:alpine AS prod
COPY --from=deploy /usr/src/webpack-playground/dist /usr/share/nginx/html
RUN rm -rf /etc/nginx/conf.d
COPY /nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]