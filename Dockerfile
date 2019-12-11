FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm tun builder

# all we copy is a content of build folder
# we do not have to copy all dependencies which can have hundrets of MB
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

