# Use the official MySQL image
FROM mysql:latest

# Set environment variables for MySQL root password, database, and user
ENV MYSQL_ROOT_PASSWORD=my-secret-pw
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=userpassword

# Copy the init.sql file to the Docker entrypoint init directory
COPY init.sql /docker-entrypoint-initdb.d/

# Expose MySQL port
EXPOSE 3306

