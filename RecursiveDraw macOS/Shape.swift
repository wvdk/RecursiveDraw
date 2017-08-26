//
//  Shape.swift
//  RecursiveDraw macOS
//
//  Created by Wesley Van der Klomp on 8/26/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Foundation


/********************************************
 Coordinate system:
 (x: 0, y: 10)           (x: 10, y: 10)
 |||||||||||||
 |||||||||||||
 |||||||||||||
 |||||||||||||
 |||||||||||||
 (x: 0, y: 0)            (x: 10, y: 0)
 ********************************************/

struct Shape {
    
    let size: CGSize
    
    /// Relative to parent
    var position: CGPoint
    
    /// An array containing normal Shapes or recursive Shapes
    var children: [ShapeName] = []
    
    // On hold:
    //    var childTransforms: [ShapeTransform] = []
    
    
}
