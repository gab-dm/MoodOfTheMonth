The Mood of The Month App
=====================

The goal of this mini-project is to refresh your **Java / JEE** skills in a 4 day rush team-effort.  
This project requires both **Backend** (Java/JEE), **SQL**, **Ops** & dynamic-web **Frontend** skills (JSP, HTML, CSS, JavaScript).  
The 4-day project has to be released in **production** on a dedicated server, and **demonstrated** by the team in a full-house presentation.

![Admin Interface](/../master/screen.jpg?raw=true "Admin Panel Interface")
![User Interface](/../master/screen2.png?raw=true "User Panel Interface")

# TRELLO
https://trello.com/invite/b/UoF0fDCc/ATTIa2ac9b1df24717234c1145693585c7d4C6617A0C/motm

# Pool Conditions
You will develop your project as a **team**, with minimum Agile management (we recommend the Kanban method).  
**One** git repository will be given to the team and shall be used properly. The workflow details are left to the team's appreciation.

Every day, the team will be able to attend a retrospective at the time of their choice, in presence of a coach, to discuss the following matters:
 * The challenges encountered the day before
 * The current tasks, the remaining tasks
 * The global workflow efficiency

In terms of team work, you are free to try anything you want.  
You could try out eXtreme Programming concepts such as Pair Programming, Code Reviews, Test-Driven Development, etc... and take the time to plan important parts of your project in common. However, the only thing your "customer" is asking for, is for your "Proof Of Concept" to work... Code Quality wont be as important as it usually is. Make your choices :)

In terms of delivery, these are the requirements:
   * Clean code
   * Use of the whole JEE stack is allowed (JSP, Servlet, JSTL, JSF?, JPA, JTA, EJB, ...)
   * Use of Hibernate ORM is allowed
   * Use of Spring is not allowed
   * Use of Maven is not allowed

# The Project    
The project consists of a JEE webapp.  
Your goal is to create both a client and an administration panel for an employee "mood of the month" app.
Every last friday of the month, at around 10 AM for example, the MOTM (Mood Of The Month) app will send an email to each employee with a link.
When following the link, the employee will be able to give their mood (a 1 to 5 scale) for the current month, and eventually put an additional comment anonymously.

In particular, the following items will be implemented:  

**Admin panel:**
  * Create a new employee: name, email, birthdate, uuid
  * Create the MOTM template content: Title, message template, page template.
  * See MOTM stats


**Client panel:**
  * Answer the MOTM
  * Edit a previous answer

An **employee** can be edited. It has both a name, an email and a birthdate. Each user also has a unique identifier (uuid).
A **MOTM** contains a title, a message template, and a page template.

You don't need to implement security like login or user account at the moment.
We provided you with the front pages, even though you might still have to edit them in some way.
To edit emails sending settings, you will need to use Ajax.

## Setup environment

### SQL Database
First, install a local **PostgreSQL** server & a SQL administration tool (Adminer or the Intellij Datasource tool).

### Your IDE
For this exercise, we recommend that you use IntelliJ.  
Install the latest **Wildfly** application server. Search & read the docs to know how to do :)

### Git repository
A new repository will be provided, with owner rights.  
Everyone must be able to push code on the repository. The important fact here is to **create your orwn team workflow**.

## Project Architecture
Take your time and brainstorm in group to create a clean architecture for the project.
We advise to use the default ORM (Hibernate) which goes with Wildfly for data persistence in your project, through JPA.
Create the main architecture for your web app.  
We recommend you use Singleton EJBs to handle your business logic and IoC.

## Integration
Download the provided web architecture in the **resources** directory.
Integrate it in your project.

## Release & Demo
 * For your release, we will provide you with a public server instance. You will need to release your code in production before the demonstration, along with the source code. We will ask for the IP address before the demo starts :)
 * Your demo must be following a client perspective. You are making the demonstration for the project they have paid you to deliver. Your customer audience will consist in both technical and non-technical people. 
 * Your challenge is to make them think "we have chosen the right people to handle our project! We would be happy to carry-on with them"


### Provided content
We provided you with some content to help you bootstrap your work.
  - HTML architecture
  - Bootstrap
  - Jquery
  - Font Awesome
  - CKEditor

Pages:
  - edit_motm.html
  - add_member.html
  - dashboard.html
  - index.html
  - motm.html
  - newsletter.template.html

An email template is provided to you to send cross-browser compatible mails. You'll need to bind data to the template and send the whole page by mail. *Caution:* in mails, links must be absolute.

# Bonus
All is done on day 3?
Here are a few features we as a customer would have loved to have available.
 * Add a fullscreen dashboard with the evolution of the global company mood for the past **n** months
 * Printable report
 * CSV export
 * Add multiple "questions"
 * Send automatic report to all members each month (and add Feedback template in MOTM)
 * Send notification emails (reminders)
 * Implement front validation with jQuery
 * Implement backend tests
