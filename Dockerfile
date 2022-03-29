# select base image
FROM nginx:latest

# label it - add optional details
LABEL MAINTAINER=DAT

# copy the data from localhost to container
COPY index.html /usr/share/nginx/html
# copy index.html to /usr/share/nginx/html/

# expose the required port - port 80
EXPOSE 80

# launch the app
CMD ["nginx", "-g", "daemon off;"]
# CMD will run the command in this case to 
# launch the image when we create a container