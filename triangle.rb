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
def triangle(a, b, c)
  edges = [a, b, c]

  check_triangle_edges(edges)

  case edges.uniq.size
    when 1; :equilateral
    when 2; :isosceles
    when 3; :scalene
    else raise "Unreachable, expecting 1-3 unique edges, but got " + edges.uniq.size
  end
end

def check_triangle_edges(edges)
  raise TriangleError unless edges.all?(&:positive?)

  sorted = edges.sort
  raise TriangleError if sorted[0] <= sorted[2] - sorted[1]
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
