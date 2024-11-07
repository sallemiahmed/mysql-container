
# MySQL Docker Container with Client for Testing

This repository contains a Docker setup for a MySQL server container that is pre-initialized with a database and sample data. The image also includes the MySQL client, allowing you to easily test and interact with the database from within the container.

## Features
- MySQL Server with a pre-configured database (`mydatabase`)
- A table `users` with sample data initialized on first run
- MySQL Client installed within the container for easy testing

## Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/mysql-docker.git
cd mysql-docker
```

### 2. Initialize Database with SQL Script

This project includes an `init.sql` file that sets up the database and table, and inserts initial data. The contents of `init.sql` will automatically be executed when the container first starts.

### 3. Build the Docker Image
Build the Docker image with the following command:

```bash
docker build -t mysql-server-client .
```

This command creates an image called `mysql-server-client` that includes both the MySQL server and client tools.

### 4. Run the Docker Container
Run the container in detached mode, exposing MySQL’s default port (3306):

```bash
docker run --name mysql-container -d -p 3306:3306 mysql-server-client
```

### 5. Verify Initialization
You can verify that the database and sample data were initialized correctly by running a query directly from within the container.

#### Example Command to Test the Setup

Use the `docker exec` command to run a MySQL query inside the container:

```bash
docker exec -it mysql-container mysql -umyuser -puserpassword -e "USE mydatabase; SHOW TABLES; SELECT * FROM users;"
```

This command connects to the MySQL instance within the container and executes:
1. `SHOW TABLES;` to display available tables.
2. `SELECT * FROM users;` to show the sample data in the `users` table.

You should see output similar to:

```plaintext
+----+-----------+-----------------+---------------------+
| id | username  | email           | created_at          |
+----+-----------+-----------------+---------------------+
| 1  | john_doe  | john@example.com| 2024-11-07 12:00:00 |
| 2  | jane_doe  | jane@example.com| 2024-11-07 12:00:00 |
+----+-----------+-----------------+---------------------+
```

## Usage Summary

- **Build Image:** `docker build -t mysql-server-client .`
- **Run Container:** `docker run --name mysql-container -d -p 3306:3306 mysql-server-client`
- **Test Data Initialization:**
  ```bash
  docker exec -it mysql-container mysql -umyuser -puserpassword -e "USE mydatabase; SHOW TABLES; SELECT * FROM users;"
  ```

## Stopping and Removing the Container
To stop and remove the container when you're done, use:

```bash
docker stop mysql-container
docker rm mysql-container
```

## Notes
- Ensure you replace `myuser` and `userpassword` with your actual user credentials as specified in the Dockerfile if modified.
- This setup is intended for development and testing. For production, consider more secure configurations and data persistence options.

---

Enjoy using this MySQL Docker container with a built-in client for easy testing and database management!
