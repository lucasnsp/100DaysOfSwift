Project 22 

Challenge
One of the best ways to learn is to write your own code as often as possible, so here are three ways you should try your new knowledge to make sure you fully understand what’s going on:

Write code that shows a UIAlertController when your beacon is first detected. Make sure you set a Boolean to say the alert has been shown, so it doesn’t keep appearing.
Go through two or three other iBeacons in the Detect Beacon app and add their UUIDs to your app, then register all of them with iOS. Now add a second label to the app that shows new text depending on which beacon was located.
Add a circle to your view, then use animation to scale it up and down depending on the distance from the beacon – try 0.001 for unknown, 0.25 for far, 0.5 for near, and 1.0 for immediate. You can make the circle by adding an image, or by creating a view that’s 256 wide by 256 high then setting its layer.cornerRadius to 128 so that it’s round.
