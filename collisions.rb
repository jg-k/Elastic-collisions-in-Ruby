require 'ruby2d'
require './collisions_calc'
require 'matrix'

set title: "Ball chaos"
set background: 'white'
set width:1200
set height:800


class Box
  attr_accessor :x, :y, :x_velocity, :y_velocity, :mass, :colliding, :radius, :size, :circle, :in_reach, :grabbed
  attr_reader :radius, :size

  def initialize(args)
    # say something if args in hadh not recognized

    # ,x_velocity = (-5..5).to_a.sample,y_velocity = (-5..5).to_a.sample
    # @x = rand(Window.width)
    # puts args
    @x = args[:x] || rand(Window.width)
    @y = args[:y] || rand(Window.height)
    @x_velocity = args[:x_velocity] || (-2..2).to_a.sample
    @y_velocity = args[:y_velocity] || (-2..2).to_a.sample
    @mass = args[:m] || (4..10).to_a.sample
    @mass_ref = @mass
    @color = Color.new('random')
    @colliding = false
    @shape = 'circle'
    @grabbed = false


  end

  def radius
    10*@mass**0.5

  end

  def size
    10*@mass**0.5
  end


  def draw
    # @square = Square.new(x: @x,y:@y,size:@size, color:@color)
    case @shape
    when 'square'
      # puts 'mysize'
      # puts self.size
      @square = Square.new(x: @x,y:@y,size: self.size,color:@color)
    when 'circle'
      @circle = Circle.new(
        x: @x, y: @y,
        radius: self.radius,
        color: @color)

      end

    end

  def move
    @x= (@x+@x_velocity) % Window.width
    @y= (@y+ @y_velocity) % Window.height
  end

  def check_for_collision
    if (@square || @circle) && colision_detected?
      other_box = colision_detected?
      x1 = Vector[@x,@y]
      v1 = Vector[@x_velocity,@y_velocity]
      if !@grabbed
        m1 = @mass
      else
        m1 = 1000
      end
      x2 = Vector[other_box.x,other_box.y]
      v2 = Vector[other_box.x_velocity,other_box.y_velocity]
      if !other_box.grabbed
        m2 = other_box.mass
      else
        m2 = 1000
      end

      out = collisions_2d(x1,v1,m1,x2,v2,m2)
      # puts "collision"
      # puts out

      @x_velocity = out[0][0]
      @y_velocity = out[0][1]
      other_box.x_velocity = out[1][0]
      other_box.y_velocity = out[1][1]
      @colliding = true
      other_box.colliding = true
      #
      # @x_velocity = - @x_velocity
      # @y_velocity = -@y_velocity
    end
  end

  def colision_detected?
    case @shape
    when 'square'

        ($boxes - Array(self)).any? do |other_box|
          if other_box.include?(@square)
            return other_box
          end
        end
    when 'circle'
      ($boxes - Array(self)).any? do |other_box|
        distance_c_c = ((@x-other_box.x)**2 + (@y-other_box.y)**2 )**0.5
        if distance_c_c < self.radius + other_box.radius
          return other_box
        end
      end

    end

  end

  def include?(other_square)
    @square.contains?(other_square.x1,other_square.y1) ||
    @square.contains?(other_square.x2,other_square.y2) ||
    @square.contains?(other_square.x3,other_square.y3) ||
    @square.contains?(other_square.x4,other_square.y4)

  end

  def in_reach?(player)

    if @circle && @circle.contains?(player.x,player.y)
      puts "in reach"
      @in_reach = true

    else
      @in_reach = false

    end

  end
  def grabbed?(player)
    if player.left_pressed && @in_reach
      @grabbed = true

      puts "grabbed"

    else
      @grabbed = false

    end

  end



end
class Player
  attr_accessor :x,:y,:delta_x, :delta_y, :left_pressed
  def initialize
    @x = -5
    @y = -5

  end

  def release_ball
    $boxes.any? do |box|
      if box.grabbed
        puts "box released"
        box.in_reach = false
      end
    end
  end

end
