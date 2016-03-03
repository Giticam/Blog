== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.


Here is what you need to do:
Setup empty Rails project (make sure it's version 4.2 or more)
Make sure that the project uses postgres database
Create controller "home" that handles home and static pages
Create a page "About" which has information about the tool (anything for now).
Add your photo and information in the about page (link to external photo of you for now)
Create a navigation bar that applies to all pages. The navigation bar must include links to "home" and "about" pages
Put all of your code on GitHub (or BitBucket)
Submit the Github link.
===========
Build four of your main models: post, comment, category and contact (don't worry about associations yet, will add those later).

Here are a summary of suggested fields and validations (feel free to add to those)
Post: title(required & unique), body
Comment: body (required & unique per blog post)
Category: title(required)
Contact: email, name, subject and message
=================
Build CRUD for the posts in your blog with:
Ability to list all the posts in the app
Ability to view a page with a form to create a new post
Ability to click "submit" on the form and create the post
It shouldn't allow creating posts without a title
On the listing page there should be a link to visit the post display page
That page should have "edit" and "delete" links
Clicking the edit link should go to a page similar to the one for creating new post, except that it should say "editing post" and should be pre-populated with post info
Clicking "delete" should prompt the user "Are you sure you want to delete this post" and if the user clicks "yes" it should delete the post from database and take user back to listing page.
================
Implement full CRUD operations for Comment resource in the Blog. Very similar to the Post resource.

==============
Implement the ability to search for a project by a search field that matches with either the title or body of the blog.
================
Implement pagination for listing blog posts.

Here are the features that should be implemented:
Pagination should only show if there is more than 10 records in database
Next button that takes you to the next page
Previous button that takes to the previous page
If you are on the first page the previous button should be disabled
If you are on the last page the next button should be disabled.
Do this in two ways:
1- Without using a gem, build it from scratch.
2- Using a gem.
==============
Write tests for your `Post` model in your Blog project.  Add tests for the following:
- Validation of the presence of Post's title
- Validation of the minimum length of Post's title (7 characters)
- Validation of the presence of Post's body
- Test drive a method `body_snippet` method that returns a maximum of a 100 characters with "..." of the body if it's more than a 100 characters long.
====================
Write tests for the Blog Posts controller actions: new / create / show / index
Stretch 1: Also write tests for the edit / update / destroy actions
Stretch 2: Do the above in TDD style
===================
Practice Git Pull Requests by doing the following:
1- In your Blog project create a new branch.
2- Add a simple feature to your project. It can be as simple as changing the colour of text.
3- Push your branch to Github.
4- Make a pull request from your new branch to the master branch.
5- Ask a friend or TA to review your Pull Request.
6- Merge your Pull Request on Github.
7- Pull the latest master to your computer and verify that the code you added on the new branch is there.
===================
Add categories to your Blog tool, make sure that you seed file creates at least 10 categories. Implement the ability to select one category from a drop down when creating a blog post.
====================
Build an ERD diagram for you Blog tool for what you know about it so far. Feel free to add more features if you want. Keep in mind that the ERD may change later as you learn more about adding other features.
===================
Add standard user authentication for your Blog. Make sure your user has first name, last name and email.
Associate records with the user model as per your ERD.
====================
Add standard user authentication for your Blog. Make sure your user has first name, last name and email.
Associate records with the user model as per your ERD.
====================
Implement the ability to edit the user's first name, last name and email for your blog project. Make it so when the user clicks on his/her name they go to a page where they can edit their information.
=====================
Implement the ability to change the password for your users on the Blog tool. The page must contain three fields: current password, new password and new password confirmation. The user must enter a correct current password and matching new password and new password confirmation. Make sure that the new password is different from the current password.
======================
Implement the ability to edit the user's first name, last name and email for your blog project. Make it so when the user clicks on his/her name they go to a page where they can edit their information.
=====================
Implement the ability to change the password for your users on the Blog tool. The page must contain three fields: current password, new password and new password confirmation. The user must enter a correct current password and matching new password and new password confirmation. Make sure that the new password is different from the current password.
======================
Enforce the following permissions in your Blog application:
- Only signed in users can create blog posts or comments
- Only the creator of blog posts can edit or delete them
- Only the creator of comments or the creator of blogs can delete comments
- Have an admin user that can do anything
========================
Implement a forgot password feature for your Blog application that works as follows:
- In the sign-in page have a link called "forgot password? click here"
- The link above should take the user to a page where they can enter their email
- After entering their email and hitting `submit` the user should technically get an email with a link. Don't worry about sending an email now as we haven't heard that yet but make sure you have a link with a token to reset the password.
- When the user visits the page with that link it should show three fields: new password and new password confirmation
- To change the password the user must enter matching password
- The user is redirected to the sign-in page to sign in with new credentials
==========================
Implement the ability to lock an account if there have been 10 failed sign in attempts to your Blog tool. After that they must use the `forgot password` feature to reset the password.
=============================
Upgrade the specs you've written for your Blog project to take into consideration user authentication by doing the following:
- Preventing non-signed in users from creating, updating or deleting posts
- Associating posts with logged in users
- Preventing logged in users from updating or deleting posts they did not create
============================
Setup mailing with your Blog.

Add a mailer that emails the user who created the blog post when someone comments on their post.
=============================
Do the following for your Blog:
Setup Delayed Job
Move all the mailers to the background
[Stretch 1] Setup an ActiveJob class task that does the following:
Make a summary (list) of all newly created comments that that day for posts
Send an email with the summary to posts owners
Build a Rake task to queue the job
[Stretch 2] Setup an ActiveJob class that does the following:
Make a list of the 10 most commented on blog posts during the last month
Send an email to the admin with the list of blog posts with links to them
Build a Rake task to queue the job
Note: you don't have to set up automatic invoking to the rake task as part of this assignment, just run it manually and make sure it works. If you're curious on how this can be set up in production you can take a look at the following:
https://en.wikipedia.org/wiki/Cron
https://github.com/javan/whenever
=====================
AJAXify favouriting and unfavouriting blog posts for your blog tool so that page doesn't reload when the use favourite or unfavourite a post.
========================
Make creating comments for posts use AJAX so that the page doesn't reload.
Make deleting a comment use AJAX
Stretch: Enable comment editing / Updating with AJAX
===========================
Built a client for your Blog project that has the following attributes:
- Must be plain HTML, CSS and Javascript (with jQuery)
- Must use AJAX to make requests
- When you first open up the main page, it should list all blog posts (just titles)
- When you click on a blog post the page should display the title and description of the blog post with a listing of all the comments, there should be a back button that lists all the blog posts

[Stretch goal 1]: Enable commenting on the post display page
[Stretch goal 2]: Add pagination to the posts listing page. There should "Next" and "Previous" buttons to paginate between pages.

=================
Add the following Capybara tests to your Blog app:
Test that the home page has an `h1` with a title (you can decide on the title's text yourself)
Test the sign up and login systems in your application (Sign up / Sign In / Sign Out)
Test creating a blog post
Test commeting on a blog post
Stretches:
Test editing, updating and deleting posts by the owner
Test attempting to delete someone else's post
======================
