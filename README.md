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
