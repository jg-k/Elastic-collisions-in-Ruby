require './collisions'

# user defined box array. for sanity checks!
user_defined_boxes = false
if user_defined_boxes

  $boxes = Array.new(2)
  $boxes[0] = Box.new(x: 10, y:500 , x_velocity: 5, y_velocity: 0, mass:10)
  $boxes[1] = Box.new(x: 500, y: 500, x_velocity: 0, y_velocity: 0, mass:10)
else
# randomly generated
$boxes = Array.new(15){Box.new({})}
end

bob = Player.new




on :mouse_down do |event|
  # x and y coordinates of the mouse button event
  puts event.x, event.y

  # Read the button event
  case event.button
  when :left
    bob.x = event.x
    bob.y = event.y
    bob.left_pressed = true
    puts "pressed"
    # Left mouse button pressed down
  when :middle
    # Middle mouse button pressed down
  when :right
    # Right mouse button pressed down
  end
end


on :mouse_up do |event|
  # x and y coordinates of the mouse button event
  puts event.x, event.y
  # ball.grabbed = false



  # Read the button event
  case event.button
  when :left
    bob.left_pressed = false
    bob.release_ball
    # Left mouse button released
  when :middle
    # Middle mouse button released
  when :right
    # Right mouse button released
  end
end

on :mouse_move do |event|
  # Change in the x and y coordinates
  # puts event.delta_x
  # puts event.delta_y
  bob.x = event.x
  bob.y = event.y
  bob.delta_x = event.delta_x
  bob.delta_y = event.delta_y



  # Position of the mouse
  puts event.x, event.y
end

# first, check for collisions, than move boxes
update do
  clear

  $boxes.each do |box|

    if !box.colliding
      box.check_for_collision
    end
  end
  $boxes.each do |box|
    box.in_reach?(bob)
    box.grabbed?(bob)
    if box.grabbed
      box.x = bob.x
      box.y = bob.y
      box.x_velocity = bob.delta_x
      box.y_velocity = bob.delta_y

    else
      box.move
    end
    box.draw
    box.colliding = false
  end
end

show
