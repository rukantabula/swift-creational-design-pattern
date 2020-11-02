import UIKit

import UIKit

class Point {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int){
        self.x = x
        self.y = y
    }
}

extension Point: CustomStringConvertible {
    var description: String {
        return "Pint (\(x), \(y))"
    }
}

extension Point: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return Point(x: self.x, y: self.y)
    }
}

var p1 = Point(x: 0, y: 0)
var p2 = p1.copy() as! Point

p2.x = 42
p2.y = 3


print("p1: \(p1)\np2: \(p2)")


