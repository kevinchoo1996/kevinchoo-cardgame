# kevinchoo-cardgame
My PHP & Jquery Card Game as well as Optimized SQL

# Part A
## Description
This is a PHP + jQuery web application for the assignment, containerized using Docker.
The environment includes:
- PHP 8.2 with Apache
- jQuery (included via CDN)
- tailwind.css (included via CDN)
- All code is in the `src/` folder

## How To Run

### Prerequisites
- Docker Desktop installed on your machine

### Steps
1. Clone or Download This Repository
2. Start Docker via `docker-compose up --build`
3. Open Local Browser to access Webpage via http://localhost:8080

## AI Tools Used
This project was developed with the support of ChatGPT. The AI was used to assist with specific parts of the project:
  - **Front-end UI (Tailwind CSS)**: ChatGPT helped generate and structure the HTML and Tailwind classes to speed up building the user interface.  
  - **Docker setup**: ChatGPT provided guidance and generated the `Dockerfile` and `docker-compose.yml` configuration for running PHP, HTML, and CSS files inside Docker.  
  - **PHP helper suggestions**: ChatGPT suggested functions and small code improvements to make the PHP code more readable and maintainable.  
  - **README documentation**: ChatGPT helped clean up and structure the README file to make the instructions clearer and more professional.

## App Screenshot
Here is how the app looks in the browser:
![Running PHP + jQuery app](assets/screenshot.png)

## Development Time
- **Understanding the requirements:** 45 minutes  
- **Completing the code:** 30 minutes

# Part B
## Description
Attached in this repository is an SQL file called [(B) SQL Improvement Logic Test.sql](https://github.com/kevinchoo1996/kevinchoo-cardgame/blob/main/(B)%20SQL%20Improvement%20Logic%20Test.sql).  
This file contains the updated query designed to improve performance.

## Changes Made
- Reduced the number of `LEFT JOIN`s in the query and replaced them with `EXISTS`, as most of the original `LEFT JOIN`s were only used for `WHERE ... LIKE` checks.  
- Updated the queries to search using the last 50 offsets first before joining, which reduces the number of columns processed in the joins.

## AI Tools Used
This query was developed with the assistance of **ChatGPT**. The AI helped clean up and rebuild the SQL queries to make them cleaner and easier to read.

## Development Time
- **Understanding the requirements:** 45 minutes  
- **Completing the query:** 45 minutes
