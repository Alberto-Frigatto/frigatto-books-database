<h1 align="center">
    <img src="https://res.cloudinary.com/dd1gccg4f/image/upload/v1721312522/frigattobooks.png" width="200"/>
    <br/>
    <p style="font-size: 30px">Frigatto Books Database</p>
</h1>

<p align="center">
    This repository contains the MySQL database for the <b>Frigatto Books</b> project. The database is deployed using Docker container, ensuring an isolated and consistent environment for development and production.
</p>

# Table of contents

- [ERM diagram](#erm-diagram)
- [Installation](#installation)
- [License](#license)

# ERM diagram

![erm diagram](https://res.cloudinary.com/dd1gccg4f/image/upload/v1721315240/merfrigattobooks.png)

# Installation

Clone this repository

```bash
git clone https://github.com/Alberto-Frigatto/frigatto-books-database.git
```

Go to repository where you've cloned it

```bash
cd path/to/repository/frigatto-books-database
```

Build the docker image

```bash
docker build -t frigatto_books_database .
```

At last, create a container providing the following stuffs:

### Env variables

- MYSQL_ROOT_PASSWORD - Password for root user
- MYSQL_USER (optional) - Name of the user that will be created
- MYSQL_PASSWORD (optional) - Password of the user that will be created

### Volumes

- Attach a docker volume in `/var/lib/mysql` to persist data even container is deleted

### Ports

- Map the container's `3306` port to your pc's `3306` port

```bash
docker run -d --name frigatto_books_database_container \
-e MYSQL_ROOT_PASSWORD=root_password \
-v mysql-data:/var/lib/mysql \
-p 3306:3306
frigatto_books_database
```

# License

[MIT](./LICENSE.md) - Alberto Frigatto, 2024
