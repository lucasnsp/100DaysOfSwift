Challenge
Your challenge this time is not to build a project from scratch. Instead, I want you to implement three Swift language extensions using what you learned in project 24. I’ve ordered them easy to hard, so you should work your way from first to last if you want to make your life easy!

Here are the extensions I’d like you to implement:

Extend UIView so that it has a bounceOut(duration:) method that uses animation to scale its size down to 0.0001 over a specified number of seconds.
Extend Int with a times() method that runs a closure as many times as the number is high. For example, 5.times { print("Hello!") } will print “Hello” five times.
Extend Array so that it has a mutating remove(item:) method. If the item exists more than once, it should remove only the first instance it finds. Tip: you will need to add the Comparable constraint to make this work!.
