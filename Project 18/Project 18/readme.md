Project 18 

Thomas Fuchs once said, “the best error message is the one that never shows up.” Of course, getting to that point is easier said than done – even in just your progress in this course so far you’ve almost certainly hit 50 or more bugs in your code, and had to figure out the problem then resolve it.

In this small but important technique project we’re going to look at a few different ways of helping you identify problems in your code. Even though this is an important skill, I waited until now to show it to you because it’s important you first feel the problem acutely – you’ve hit bugs, and you’ve had to work hard to solve them. But now you’ve done that, you should be able to appreciate these debugging tips all the more!

Today you have five short topics to work through, and you’ll learn about assert(), breakpoints, view debugging, and more.

Challenges: 

Temporarily try adding an exception breakpoint to project 1, then changing the call to instantiateViewController() so that it uses the storyboard identifier “Bad” – this will fail, but your exception breakpoint should catch it.
In project 1, add a call to assert() in the viewDidLoad() method of DetailViewController.swift, checking that selectedImage always has a value.
Go back to project 5, and try adding a conditional breakpoint to the start of the submit() method that pauses only if the user submits a word with six or more letters.
