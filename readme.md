# Elastic collision simulator
This is a useless but soothing elastic collision simulator using ruby and the ruby2d library.
 
You can just watch the balls colliding, or to be more active, you can also "grab" and release a ball with your mouse and force collisions with other balls.

## Run:
Clone the repository, then in the folder, run:
```sh
$ ruby main.rb
```
In main.rb, you also specify input number of balls, positions and speed or let random numbers be generated. 

## Collision model
+ [wikipedia - Elastic collision](https://en.wikipedia.org/wiki/Elastic_collision)
+ Initial script based on a nice [tutorial from Mario Visic](https://www.youtube.com/watch?v=e3B8m4vBzB0&feature=emb_logo), [Github](https://github.com/mariovisic/ruby2d-games/tree/master/04%20-%20Collision-Detection)

## Screenshot
![screenshot](/Screenshot.png?raw=true "screenshot")

## Bugs and improvements
+ Sometimes, the collision detection and calculator are not accurate enough, such that to 2 (or more) balls can get locked into a romantic dance. Another collision with some other balls can sometimes break the dance!
+ The ball grab logic could be improved. sometimes balls get hidden behind the grabbed ball and never come out (also due to imprecise collision detection)
+ With user mouse control, if you move too fast, you "lose" the ball. 
+ Add walls and random shapes
+ Make a game out of it
