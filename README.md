## WeManage™️

Welcome, developer, to WeWork™️! Thanks to a massive hack, we've had to build our building management app from the ground up! Execution of this project falls to you and your team, which, as of now, consists of only you! (for legal and marketing purposes, as you still belong to a team, it is imperative that you use the pronoun "We" when referring to your work on this project in place of the pronoun "I", e.g. "We worked on this project for days!").

Here at WeWork™️, we have many buildings, and at every building, we have many companies. Of course, a company may have offices at any number of our buildings scattered across the globe! For security reasons, it is important that every company track their employees. This way, we know which employees have access to which buildings!

To this end, the domain you will be building should look like the following:

Building -< Office >- Company -< Employee

### Schema

The schema should be as follows:

Building:

- name
- country
- address
- rent_per_floor
- number_of_floors

Office:

- building
- company
- floor

Company:

- name

Employee:

- name
- title
- company

**For clarity, an office takes up an entire floor!**

### Deliverables

The product team has deemed the following features as crucial:

#### Building:

- Users should be able to see a single building's details 
	[-] On this page, a user should be able to see all of the companies that have offices in the building
	[-] On this page, a user should be able to see how much total rent that building is making based on all the companies that have rented offices in that building
[-] Users should be able to see a list of all buildings, as well as a list of all available floors for each building.
	- **_Hint_** this should be a list of the floor numbers that are available: 1, 3, 6, 8 etc. You may want to save this detail for later
[-] Users should be able to update a building's details

#### Company:

[-] Users should be able to create a new company and choose any number of buildings to open an office in, as well as the floors that the company would like to purchase
	- We have provided you with helper functions in the Building model to assist you in figuring out which offices are currently open, as well as the form itself. Spend some time looking over the code, but your main responsibility will be to handle the form's submission. 
[-] Users should be able to see a show page for an individual company
 [-] On this page, a user should be able to see a list of all of its offices, as well as the building in which the office is located 
 [-] On this page, a user should be able to see how much total rent it is paying
 [-] On this page, a user should be able to see a list of all employees 
 [-] On this page, a user should be able to add an employee to the company 
 [-] On this page, a user should be able to remove an employee from the company 
 

#### Validations:

- Don't mess up our database! Make sure that every value is filled in! If a user fails to enter details, please ensure that your remind them of this failure!
- Please ensure that a user's name is longer than 5 characters!
[-] Please ensure that an office's floor is an integer!

#### Bonus Deliverables:

HR has deemed it legal for us to say that a BONUS will be available if you can accomplish any of the following:

- Users should be able to see the an office show page with the following: 
	[-] The building it is in 
	[-] The company that is using it 
	[-] The employees that are working in it
[-] Users should be able to see the number of employees in a building on the building's show page

**WARNING**

- Bonuses must be earned! These are tough and may involve adding another association between an office and an employee! Really think about this one; in this updated model, we are suggesting that an employee can only have access to a single office!

<p class='util--hide'>View <a href='https://learn.co/lessons/rails-challenge-practice'>Rails Practice Challenge</a> on Learn.co and start learning to code for free.</p>
