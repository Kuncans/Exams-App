
# Exam App

For this project, I was given a mock brief to complete within a 72hr timeframe. 

The provided Figma UI needed to be implemented using Swift UI, with the mentioned functionalities.


## Features

- Uses mock user data
- Displays exams in horizontal scrollable list
    - Take exam button shows if the current date is in the range of start/end dates of the exam
- Plus icon adds more exams to the list
- Shows attendance for classes in drop down list
    - If attendance is below 75%, a view is presented
- Data persists if the user navigates away from the new exam creation page
- Data persists when the user is creating exam questions

## Known Bugs
- Navigating to Exams tab disables NavigationLink on "Next" button
- Questions / Sections do not update as they are changed (would implement class as an ObservableObject with Published variables)
- Questions do not persist on save with the Exam model (would implement one -> many relationship in CoreData model)


## Tech Stack

**Language:** Swift

**User Interface:** SwiftUI 


## Screenshots
![App Screenshot](http://imageshack.com/a/img924/4771/1P6d3F.png)



