# YardFixer

Welcome to [YardFixer](https://task-poster1.herokuapp.com/login)
Solve your gardening problems the easy way

Post a yard maintenance job. Other users can sort and search for jobs that meet their criteria. If they like what they see they can post a comment. Decided who you are going to work with? Assign the job to them and then you can both gain access to each other's contact details to get that yard looking great again!

---------------------------------------------------------------

## Built with

* Ruby on Rails v4.2
* PostgreSQL with Active Record ORM
* bcrpyt (password encryption)
* Google Geocoding API 
* Cloudinary (cloud image storage and optimisation)
* Bootstrap
* CSS


---------------------------------------------------------------
## Introduction

This was my second solo project for the General Assembly Software Engineering Immersive bootcamp, completed in 1 week from this [brief.](https://gist.github.com/wofockham/42880541c94121516109) 

I learnt how plan and execute a larger full-site project using Model-view-controller, integrate Ruby gems and APIs to interface with third-party services, deploy and maintain a project on a cloud hosting service (Heroku) and manage test and production databases.

The biggest challenges were getting the Geocoding functionality to work and stylng the many pages to look good on different screen sizes / devices.

---------------------------------------------------------------

## Approach

I started by wireframing the required database tables and their relationships. Then I sketched out the pages needed and how the user would move around the site for the lifecycle of a job post. 

After setting up my models and database structure, I worked on the core site functionality (Sign Up, Sign In, Job Post, Job Edit and Delete, Comments) with minimal styling. Finally I enabled the assignment of jobs from one user to another.

I then implemented Cloudinary image storage and Google Geolocation APIs before styling up using a mixture of Bootstrap elements and custom CSS styles.

Lastly, I completed bug testing and UI testing on different devices and made some changes to handle edge cases of bad user input. I also implemented banner user alert messages.

This is by far the largest project that I have completed to date. It was great experience in planning my time effectively to ensure I had a Minimum Viable Product half-way through the week. I could then spend the rest of the week implementing extra 'nice-to-have' features and styling. Styling took longer than I anticipated. This was partly due to learning Bootstrap for the first time, and also wanting to add extra CSS styles to get the pages looking exactly how I intended.

---------------------------------------------------------------

## Features / User Guide

*  Users can Sign in from the home page, or click through to the sign up page to set up a new account. 
*  When Signing Up for a new account a password of at least 6 characters must be used. (Only first name, email and password are required to make the sign up experience pain free)
*  The new user can then access posted jobs on the site but are unable to see 'posts near me' or post a new job to the site until they update their User Profile with address details.
*  When address is supplied (suburb is an optional field), location data is received from Google API and added to that User's database record. 
*  The User will then be able to search for nearby jobs and see the distance from their address to any job on the site. This supplied address will be used for all posted jobs. It can be changed by clicking on Edit Profile.
* A new job can then be posted. One or multiple images can be uploaded. If no images are uploaded a placeholder will be used for that job post.
*  The house/unit number will not be visible on the job post. The street address will become a link to google maps if the Google API was able to validate the address data.
* Other users can post a new comment on the post and ask questions/negotiate price etc. Comments can be edited or deleted by their owner.
* The job owner can pick a commenter and assign the job to them. This is done from the Show Job page and clicking the 'Assign to..' button next to the comment.
* The job will then by restricted from edits but both the Job Poster and the Assignee will be able to open the job and their respective contact details will be visible.
* The Assignee will see the job on their My Assigned Jobs page.
* The Job Poster can then delete the job once completed.


---------------------------------------------------------------

## Links

Visit the site [here](https://task-poster1.herokuapp.com/login)

---------------------------------------------------------------


