# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Ruby Version:
For this program we are using ruby version 3.1.1
In order to check this on your computer use:
```
ruby -v
```

## System Dependencies
This application uses the following:
* Rails
* Bundle
* PostgreSQL -> sqlite3
* Yarn
* Many other gems that can be installed using:  ``` bundler install ```

## Installing Dependencies
* Install Homebrew if you don't already have it. 
  ```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```
* Now we need to install rbenv, this will be used to create a mutable ruby environment.
  ```
  brew install rbenv
  ```
* Now we want to install ruby.
  ```
  rbenv install 3.1.1
  ```
* Install bundler, this will be used to install our gems.
  ```
  gem install bundler
  bundle install
  ```
* Since this application uses yarn, we still need to install that.
  ```
  brew install yarn
  yarn
  ```
* Lets set up a database.
  ```
  bundle e rails db:setup
  ```
* Finally lets install and start PSQL.
  ```
  brew install postgresql
  brew services start postgresql
  ```

## Deploy App!
```
bundle e rails s
```
