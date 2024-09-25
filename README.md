# News Aggregator Laravel Project Installation Guide

This guide will walk you through the steps to install a Laravel project on your local development environment.

## Prerequisites

Before you begin, make sure you have the following software installed:

- [PHP](https://www.php.net/manual/en/install.php) (version 8.2 or higher recommended)
- [Composer](https://getcomposer.org/download/)

## Step 1: Clone the Repository

Open your terminal and navigate to your project directory.

## Step 2: Install Dependencies

Navigate to the project directory in your terminal:

```sh
cd news
```
3. Install PHP dependencies using Composer:
```sh
composer install
```



## Step 3: Configure Environment

5. Create a copy of .env.example and name it .env:
```sh
cp .env.example .env
```
6. Generate an application key:
```sh
php artisan key:generate
```
7. Open .env and set your database configuration:
```makefile
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=your_database_name
DB_USERNAME=your_database_user
DB_PASSWORD=your_database_password
```
Replace the placeholders with your database details.
And please create database first before entering here.

## Step 4: Run Migrations and Seed
To import database structure and so to run this app, you can run migrations and seed data:
```shell
php artisan config:clear
php artisan migrate:install
php artisan migrate --seed
```
##Step 5: Start the Development Server
Start the Laravel development server:

```shell
php artisan serve
```
##Step 6: Run Sync News Command
To Sync the news from the aggregators :

```shell
php artisan sync
```

Your project will be available at http://localhost:8000 .

