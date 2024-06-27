# after the step 8 we would focus on the how to create the build environment! 
# in the nginx wala phase we will just be copying the Npm wala 'build' direectory
# to a specific folder which is '/usr/share/nginx/html' where all the config. is when we 
# need to serve up the nginx for production!


FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . . 
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html 

