let fourSided: Set<String> = ["Rhombus", "Diamond", "Square", "Rectangle"]
let parallelograms: Set<String> = ["Square", "Rectangle", "Rhombus"]
let rectangles: Set<String> = ["Square", "Rectangle"]
let squares: Set<String> = ["Square"]
let shapes: Set<String> = fourSided.union(parallelograms).union(["Circle", "Triangle", "Octagon"])

// all rectangles have four sides
fourSided.isSuperset(of: rectangles)

// all squares are rectangles
rectangles.isSuperset(of: squares)
// not all rectangles are squares
squares.isSuperset(of: rectangles)

parallelograms.subtracting(rectangles)
