import CoreGraphics

extension CGRect {
    public var minXMinY: CGPoint {
        return CGPoint(x: minX, y: minY)
    }
    public var minXmaxY: CGPoint {
        return CGPoint(x: minX, y: maxY)
    }
    public var maxXmaxY: CGPoint {
        return CGPoint(x: maxX, y: maxY)
    }
    public var maxXminY: CGPoint {
        return CGPoint(x: maxX, y: minY)
    }

    public var midXminY: CGPoint {
        return CGPoint(x: midX, y: minY)
    }
    public var midXmaxY: CGPoint {
        return CGPoint(x: midX, y: maxY)
    }
    public var minXmidY: CGPoint {
        return CGPoint(x: minX, y: midY)
    }
    public var maxXmidY: CGPoint {
        return CGPoint(x: maxX, y: midY)
    }
}
