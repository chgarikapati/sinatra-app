# Sinatra Sequel Assignment
### Chetan Garikapati

## Environment Setup
* Clone the repo
* run bundler to install dependencies
* setup databse credentials in the **app/initialization/setup_db_connection.rb**

> bundler install


## Executing the Application

The application can be run with **shotgun** and configuration changes needs to be made in **config.ru**

* Move to application root
* issue the following command in the root after dependencies are installed with bundler

> shotgun

## Testing the application

* The application will be running on localhost on port 9393.
* The following are the list of supported operations

#### Authors:
1. Create Authors - POST - /authors/create
2. Show the list of Authors - GET - /authors
3. Edit a single Author - PATCH - /authors/:id
4. Show the single author - GET - /authors/:id
5. Delete the author - DELETE - /authors/:id

#### Author and Books:
1. Create a book for author - POST /authors/:id/books
2. Show all books for author - GET /authors/:id/books
3. Show a single book details for author - GET /authors/:id/books/:id
4. Delete a book for author - DELETE /authors/:id/books/:id

### Test Url's and Payloads

**GET Methods**
1. localhost:9393/authors
2. localhost:9393/authors/1
3. localhost:9393/authors/1/books/1
4. localhost:9393/authors/1/books

**POST Methods**
1. localhost:9393/authors/create 
   <br/>
   {
   "name": "tester",
   "age": 26
   }
   
2. localhost:9393/authors/1/books
   <br/>
   {
   "name": "chetan-4",
   "rating": 4
   }
   
**PATCH Methods**
1. localhost:9393/authors/1
   <br/>
   {
   "name": "tester",
   "age": 99
   }
   
**DELETE Methods**
1. localhost:9393/authors/11
2. localhost:9393/authors/1/books/15
