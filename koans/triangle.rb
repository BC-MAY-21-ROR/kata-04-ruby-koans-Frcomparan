# frozen_string_literal: true

# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def equilateral?(side_a, side_b, side_c)
  side_a == side_b && side_b == side_c 
end

def scalene?(side_a, side_b, side_c)
  side_a == side_b || side_a == side_c || side_b == side_c
end

def valid_triangle?(side_a, side_b, side_c)
  if side_a > side_b && side_a > side_c
    side_b + side_c > side_a
  elsif side_b > side_c
    side_a + side_c > side_b
  else 
    side_a + side_b > side_c
  end
end

def positive_sides?(side_a, side_b, side_c)
  side_a > 0 && side_b > 0 && side_c > 0
end

def triangle(side_a, side_b, side_c)
  (raise TriangleError) unless valid_triangle?(side_a, side_b, side_c) && positive_sides?(side_a, side_b, side_c)
  if equilateral?(side_a, side_b, side_c) then :equilateral
  elsif scalene?(side_a, side_b, side_c) then :isosceles
  else :scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
