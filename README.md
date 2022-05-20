# crud

This is my CRUD application 

#Problem

You are developing the frontend and the backend for a vehicle registration application (Mobile or WEB), based in Sri Lanka. Your only customers are Sri Lankan vehicle owners, and one field is the license plate of the vehicle that they own.

The vehicle license plate can be in many forms:

· Vintage: 13 ශ්‍රී 9999

· Old: 250-9999, 19-9999

· Modern: WP GA-9999, CAR-9999

For each input, there may be a variable amount of whitespace (for instance, 250 – 9999 and 250-9999 are both valid). Dashes may be replaced by a space.

#task1

For any plate number that is entered, write a function in the backend that determines the type (vintage, old or modern). Your function will take a String input and return one of the three options to be handled by the frontend of your choice (Mobile or WEB). For this function, assume that every input is a valid license plate.

#task2

Write a function to validate a string as a valid license plate number. Your function should take any String and return True or False depending on the license plate validity. (This exercise will require some knowledge of regular expressions).

Your answer should be accompanied by both positive (example license plates that will work) and negative (example license plates that shouldn’t be valid).

#task3

Basic CRUD (Create, read, update and delete) operations of vehicle registrations from the Frontend sent via selected API technique to the Backend and stored in the Database of your choice.

The application shall facilitate the user

· to create new vehicle registrations

· to get all created vehicle registrations

· to edit/update a created vehicle registration, and

· to delete a created vehicle registration
