# First part --Build phase
FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

#Phase 2
FROM ngnix
COPY --from=builder /app/build /usr/share/ngnix/html