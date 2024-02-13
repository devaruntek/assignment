There are two folders :-
1. ruby_backend:- This container contains all backend code that needed to run this project for backend Steps for run it on your local machine-
   **Copy env.development and make it .env.development**
   **Chgange the password of postgres as like your local system, then:-**
   bundle install
   rails db:create
   rails db:migrate
   rails db:seed

   Dependencies:-
   ruby - 3
   rails - 7
   db- postgres


2. react_frontend:- This container contains all frontend code that needed to run this project for backend Steps for run it on your local machine-
   npm run dev
   dependencies:-
   node- 18


**Default username and password for login:-**

username: "admin@yopmail.com"
password: "Test@1234"
