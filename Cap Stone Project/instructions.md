# Cap Stone Project

## Introduction 
For this project you will be configuring an application to use authentication. The authentication proccess will return a token for you and this token will be used to access data from an api


### The endpoints you will be using are as follows :-
### Login
https://foody-back-univel.herokuapp.com/auth 


This will be a **Post** request and the response returned will look like this :-

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
https://foody-back-univel.herokuapp.com/

This will be a **Get** request and will require you to add the token into your application request header. 

The response will look like this 


```json

[
    {
        "category": "foods",
        "foodItems": [
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "egusi",
                "name": "Egusi",
                "price": "10000"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "okro",
                "name": "Okro",
                "price": "5000"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "banga",
                "name": "Banga",
                "price": "4300"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "ogbono",
                "name": "Ogbono",
                "price": "3500"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "abak",
                "name": "Abak",
                "price": "7500"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "gbegiri",
                "name": "Gbegiri",
                "price": "4000"
            }
        ],
        "isSelected": false,
        "svgName": "food"
    },
    {
        "category": "bread",
        "foodItems": [
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "egusi",
                "name": "Egusi",
                "price": "10000"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "okro",
                "name": "Okro",
                "price": "5000"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "banga",
                "name": "Banga",
                "price": "4300"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "ogbono",
                "name": "Ogbono",
                "price": "3500"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "abak",
                "name": "Abak",
                "price": "7500"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "gbegiri",
                "name": "Gbegiri",
                "price": "4000"
            }
        ],
        "isSelected": false,
        "svgName": "bread"
    },
    {
        "category": "snack",
        "foodItems": [
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "egusi",
                "name": "Egusi",
                "price": "10000"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "okro",
                "name": "Okro",
                "price": "5000"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "banga",
                "name": "Banga",
                "price": "4300"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "ogbono",
                "name": "Ogbono",
                "price": "3500"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "abak",
                "name": "Abak",
                "price": "7500"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "gbegiri",
                "name": "Gbegiri",
                "price": "4000"
            }
        ],
        "isSelected": false,
        "svgName": "snack"
    },
    {
        "category": "treat",
        "foodItems": [
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "egusi",
                "name": "Egusi",
                "price": "10000"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "okro",
                "name": "Okro",
                "price": "5000"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "banga",
                "name": "Banga",
                "price": "4300"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "ogbono",
                "name": "Ogbono",
                "price": "3500"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "abak",
                "name": "Abak",
                "price": "7500"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "gbegiri",
                "name": "Gbegiri",
                "price": "4000"
            }
        ],
        "isSelected": false,
        "svgName": "treat"
    },
    {
        "category": "drink",
        "foodItems": [
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "egusi",
                "name": "Egusi",
                "price": "10000"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "okro",
                "name": "Okro",
                "price": "5000"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "banga",
                "name": "Banga",
                "price": "4300"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "ogbono",
                "name": "Ogbono",
                "price": "3500"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "abak",
                "name": "Abak",
                "price": "7500"
            },
            {
                "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                "imageName": "gbegiri",
                "name": "Gbegiri",
                "price": "4000"
            }
        ],
        "isSelected": false,
        "svgName": "drink"
    }
]

```