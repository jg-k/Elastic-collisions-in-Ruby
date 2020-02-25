## Elastic collision simulator
This is a simple elastic collision simulator using ruby and the ruby2d library

To get a feel for it, you can "grab" and release a ball with your mouse and force collisions with other balls.

# Run:
Clone the repository
Then in the folder, run:
```sh
$ ruby main.rb
```

# Collision model
+ [wikipedia](https://en.wikipedia.org/wiki/Elastic_collision)

## screenshot
![screenshot](/screenshot.png?raw=true "screenshot")

# bugs and improvements
+ Sometimes, the collision detection and calculator are not accurate enough, such that to 2 (or more) balls can get locked into a romantic dance. Another collision can sometimes break the dance!
+ The ball grab logic could be improved. sometimes balls get hidden behind the grabbed ball and never come out (also due to imprecise collision detection)
