### Assignment
At a minimum, your API should do the following:
- Allow look-ups by user email
- Return information about user accounts and billing history
- Allow for relevant updates to accounts and billing information

We’ll be evaluating:
- How you return information to the API user
- What inputs are required for each endpoint to return information to the API user
- Additional endpoints you build beyond GET requests for the information provided 
    -  What information would you want to see on a customer dashboard? Should that be an endpoint or multiple endpoints? 
    -  What aggregate customer information would be helpful?

### To Run
```
rake db:create
rake db:migrate
rake db:seed
rails s
```

You can see the application at [http://localhost:3000/api/v1/users/](http://localhost:3000/api/v1/users/)

### The Data Structure
This API has a postgres database that contains three tables: `users`, `accounts`, and `bills`. A user can have many accounts, but an account can only belong to one user. An account can have many bills, but each bill can only belong to one account, and by association, one user. A user's accounts can be accessed with `user.accounts`, and bills with `user.bills`.

### The API
The API is built on Rails using Grape.

#### Users
The primary endpoint is `/users`, which returns all users, their associated accounts, and the associated bills. This endpoint would be used to populate a user's dashboard. A user can be looked up by email using params: `users?email=<email>`. The endpoint can also return a list of all active or inactive users with the status parameter: `/users?status=<status>`.

One customer can be accessed with `/users/<id>`, which returns user data and all associated accounts and bills. Other options:
    - `/users/<id>/accounts`: all of the user's accounts and bills
    - `/users/<id>/payment_due`: any bills with the status: "unpaid"
    - `/users/<id>/payment?bill_id=<id>`: updates status of bill as "paid"
    - `/users/<id>/status?status=<status>`: updates status of user as indicated in the parameter

Future features: add authentication, create a new user, add ability to update all user fields, more testing

#### Accounts
The `/accounts` endpoint is for admins and/or internal use, for tracking across customers, account types, and utilities. Users can access all residential or commercial accounts with `/accounts?account_type=<type>` or all accounts associated with a specific utility with `/accounts?utility=<utility>`.

Future features: add authentication, add ability to perform calculations on aggregates, more testing.
