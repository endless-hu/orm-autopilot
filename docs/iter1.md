# Development Log: Iteration 1

Author: Zhijing Hu

## Tasks

1. Define routes and functions.
2. Write views.
3. Write models and controllers.
4. Write test cases (Scenario tests and test supports).

## Structure Overview

When a user access our app, it should be on `/orms` page, which lists all
histories code reviews with a `new` button to create a new ORM review.

When the user click the `new` button, it should be redirected to `/orms/new`
page, where the user can paste its ORM code and click `submit` to get code reviews.

When the user click the `submit` button, it should be redirected to `/orms/{id}` page, 
where it can see the feedback.

There should be a `Delete` and a `Update` button in the `orms/{id}` page. When clicking
`Delete`, the user should be redirected to `/orms`, the index page, with a flash prompting
that "the review {id} has been deleted". 

When clicking the `Update` button, the user should be redirected to `/orms/{id}/edit` 
page, where the user can modify the ORM code and get updated feedback.

**NOTE**: For the demo purpose, we don't implement actual API call to GPT to get the
code review. Instead, a fake content will be there in the database. 
*We will fill in the actual API call in the **second** iteration.*

**NOTE**: You may find that every user can access the whole review history, imposing
significant code privacy issues. We will introduce user authentications in the second or 
final iteration.

## Task Assignments

**To Everyone**: Before committing your code, remember to run `git pull` and merge other
teammates' commits. Please write something in the commit message about your
code every time you make a commit.

For anyone who writes views: you need to write corresponding `.css` files 
**in the future** to make the page beautiful. You also have to add icons,
titles, headers, footers, etc. in the future to make the website formal.
Besides, make the style consistent across the app.

### To Anika:

Fill in the code in the following files:

- [x] [`app/views/orms/new.html.erb`](../app/views/orms/new.html.erb)
- [x] [`app/views/orms/index.html.erb`](../app/views/orms/index.html.erb)

You will have to communicate with Haonan to figure out the database 
schema so that you can correctly list all ORM review histories.

Please refer to the section [Structure Overview](#structure-overview) to
get a rough idea about the components in each page. 

### To Haonan:

- [x] Create a model named `orm` using:
```bash
$ rails generate model <ModelName> <Attr1> <Attr2>...
```
- [x] Create the corresponding DB schema and provide migration instructions of test/production databases.
- [x] Fill in the `orms` controller located at 
[`app/controllers/orms_controller.rb`](../app/controllers/orms_controller.rb).
- [x] Write corresponding `rspec` tests for the model.

### To Xinjin:

Fill in the code in the following files:

- [x] [`app/views/orms/edit.html.erb`](../app/views/orms/edit.html.erb)
- [x] [`app/views/orms/show.html.erb`](../app/views/orms/show.html.erb)

You will have to communicate with Haonan to figure out the database 
schema so that you can correctly present the info of each ORM review.

Please refer to the section [Structure Overview](#structure-overview) to
get a rough idea about the components in each page. 

### To Zhijing:

- [x] Setup the project code base and testing framework.
- [x] Write relevant docs for teammates.
- [x] Write user stories in `cucumber`. Ensure testing coverage.
- [x] Deploy the app to Heroku.
