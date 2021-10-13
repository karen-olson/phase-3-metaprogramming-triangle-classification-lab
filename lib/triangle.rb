require 'pry'

class Triangle
  attr_reader
  
  def initialize(side_one, side_two, side_three)
    @triangle = [side_one, side_two, side_three]
  end

  def sides_greater_than_zero?
    @triangle.all? {|side| side > 0}
  end

  def side_lengths_ok?
    a, b, c = @triangle
    a + b > c && a + c > b && b + c > a
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && side_lengths_ok?
  end

  def kind
    validate_triangle
    case @triangle.tally.length
    when 1
      :equilateral
    when 2
      :isosceles
    when 3
      :scalene
    end
  end

  class TriangleError < StandardError
    # triangle error
  end
end

# isosceles = Triangle.new(2, 2, 5)
# equliateral = Triangle.new(2, 2, 2)
# scalene = Triangle.new(2, 3, 6)
# missing_side = Triangle.new(0, 2, 3)
# too_short = Triangle.new(2, 2, 4)

# puts "isosceles #{isosceles.kind}"
# puts "equliateral #{equliateral.kind}"
# puts "scalene #{scalene.kind}"
# puts "missing side #{missing_side.kind}"
# puts "too short #{too_short.kind}"