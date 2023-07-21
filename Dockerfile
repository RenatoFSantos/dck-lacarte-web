# Estagio 1 - Responsável por gerar o build da nossa aplicação
FROM node:16.15.1-alpine as angular
WORKDIR /lacarte-web
COPY package*.json .
RUN npm install --silent
COPY . .
RUN npm run build

# Estagio 2 - Responsável por expor nossa aplicação
FROM nginx:1.23.3-alpine
WORKDIR /etc/nginx
VOLUME /var/cache/nginx
COPY --from=angular lacarte-web/dist/lacarte-web /usr/share/nginx/html
COPY ./config/nginx.conf /etc/nginx/conf.d/default.conf


# FROM node:16.15.1-alpine as angular
# WORKDIR /lacarte-web
# COPY . .
# RUN npm i npm@latest -g
# RUN npm install --only=production --silent
# RUN npm run build

# TESTE
# FROM node:16.15.1-alpine
# WORKDIR /lacarte-web
# COPY package*.json .
# COPY tsconfig*.json .
# COPY --from=angular lacarte-web/dist/lacarte-web /lacarte-web
# EXPOSE 4200
# CMD [ "npm", "start" ]







#EXPOSE 4200
#CMD ["npm", "run", "start"]

#FROM nginx:1.23.3-alpine
#WORKDIR /etc/nginx
#VOLUME /var/cache/nginx
#COPY --from=angular lacarte-web/dist/lacarte-web /usr/share/nginx/html
#COPY ./config/nginx.conf /etc/nginx/conf.d/default.conf



