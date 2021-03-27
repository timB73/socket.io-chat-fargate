# Build stage 1 - start with an image that has Node.js & NPM
FROM mhart/alpine-node:14 AS build
WORKDIR /srv
COPY package*.json .
RUN npm install
COPY . .

# minimal Node.js image, no NPM
FROM mhart/alpine-node:base-9
COPY --from=build /srv .
EXPOSE 3000
CMD ["node", "index.js"]
