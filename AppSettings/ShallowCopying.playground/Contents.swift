import UIKit


class Point {
    var x: Int
    var y: Int
    var shape: Shape
    
    init(x: Int, y: Int, shape: Shape){
        self.x = x
        self.y = y
        self.shape = shape
    }
}

class Shape {
    var type: String
    var size: Int
    
    init(type: String, size: Int) {
        self.type = type
        self.size = size
    }
}

extension Shape: CustomStringConvertible {
    var description: String {
        return "Shape (\(type), \(size))"
    }
}

extension Point: CustomStringConvertible {
    var description: String {
        return "Point (\(x), \(y), \(shape)"
    }
}

extension Point: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return Point(x: self.x, y: self.y, shape: self.shape)
    }
}

var p1 = Point(x: 0, y: 0, shape: Shape(type: "circle", size: 33))
var p2 = p1.copy() as! Point

p2.x = 42
p2.y = 3
p2.shape.type = "cross"
p2.shape.size = 44


print("p1: \(p1)\np2: \(p2)")



