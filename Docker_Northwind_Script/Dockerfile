# select base image
FROM mcr.microsoft.com/mssql/server:2019-latest

# label it - add optional details
LABEL MAINTAINER=DAT

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=abcDEF123#
ENV MSSQL_PID=Developer
ENV MSSQL_TCP_PORT=1433

WORKDIR /src

COPY northwind.sql ./northwind.sql

RUN (/opt/mssql/bin/sqlservr --accept-eula & ) | grep -q "Service Broker manager has started" &&  /opt/mssql-tools/bin/sqlcmd -S127.0.0.1 -Usa -PabcDEF123# -i northwind.sql

# expose the required port - port 1433
EXPOSE 1433

# launch the app
# CMD ["nginx", "-g", "daemon off;"]
# CMD will run the command in this case to 
# launch the image when we create a container