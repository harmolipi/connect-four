# Connect Four
Created as part of [The Odin Project](https://www.theodinproject.com) curriculum.

View on [Github](https://github.com/harmolipi/connect-four)

### Functionality

This is the [Connect Four](https://theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/testing-your-ruby-code) project, which simply lets you play a round of Connect Four with another person.

### Thoughts

It was definitely very different approaching this one through test-driven development, and it probably took me longer than it would have if I had just written the code directly... but it was a great practice in using rspec, and I came out much more confident in my code at the end. As I adjusted and refactored here and there, running the tests gave me the confidence that I didn't break anything. Additionally, my code came out looking much cleaner and more organized than past projects tended to.

I'd like to continue practicing like this, because I definitely do see TDD as a good strategy to keep on using in the future - especially when tackling more complex projects.

### Next steps

I realized that by making some of my methods private, they're untestable. I won't do it now, but it looks like that means I should only test the public-facing methods, and let them access the private ones (rather than stubbing).

Also, I'm sure there are much better ways to check for win conditions, since that feels like it's the most inelegant part of my code. Eventually I could come back and look for cleaner ways to do it.

God bless.

-Niko Birbilis