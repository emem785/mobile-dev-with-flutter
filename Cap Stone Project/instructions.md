# Cap Stone Project

## Introduction 
For this project you will be configuring an application to use authentication. The authentication proccess will return a token for you and this token will be used to access data from an api


### The endpoints you will be using are as follows :-
### Login
https://foody-back-univel.herokuapp.com/auth 


This will be a Post request and the response returned will look like this :-

```json

{
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjc2NTkyOTMsImlhdCI6MTYyNzY1ODk5MywibmJmIjoxNjI3NjU4OTkzLCJpZGVudGl0eSI6Mn0.PM1pmmStgpc4oBJ7-djHYc0Y_jbzhTF-varDne4EPWw"
}

```

Your payload being sent to the server will look like this :-

```json

{
    "username":"david",
    "password": "david@univelcity"
}

```

### Getting Food data
https://foody-back-univel.herokuapp.com/auth 

This will be a get request and will require you to add the token into your application request header. 

The response will look like this 


```json

{
    "username":"david",
    "password": "david@univelcity"
}

```