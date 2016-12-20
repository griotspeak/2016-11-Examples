protocol Shape {

}

typealias Point = (x: Int, y: Int)

class Ellipse : Shape {
    init(majorAxis: Int, minorAxis: Int) {
    }

    convenience init(foci: (Point, Point)) {
        self.init(majorAxis: 0, minorAxis: 0)
    }
}

class Circle : Ellipse {
    init(center: Point) {
        super.init(majorAxis: 0, minorAxis: 2)
    }
}

Circle(center: (4, 5))

typealias Color = (r: Int, g: Int, b: Int)

class ColorFilledEllipse : Ellipse {
    var color: Color

    convenience init(color: Color) {
        self.color = color
        self.init(majorAxis: 4, minorAxis: 4)
    }

    override init(majorAxis: Int, minorAxis: Int) {
        self.color = (1, 2, 3)
        super.init(majorAxis: majorAxis, minorAxis: minorAxis)
    }
}

