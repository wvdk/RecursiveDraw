//
//  SpriteKitRenderer.swift
//  RecursiveDraw macOS
//
//  Created by Wesley Van der Klomp on 8/26/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Foundation
import SpriteKit

/// Turns a Shape data structure into an SKNodes hirerarchy
struct SpriteKitRenderer: Renderer {
    
    var shapesInventory: ShapeInventory
    
    typealias Render = RenderedShapeNode
    
    func render(shapeNamed: ShapeName, depth: Int = 0) -> Render {
        guard let shape = shapesInventory[shapeNamed] else {
            let node = RenderedShapeNode()
            
            node.addChild(SKLabelNode(text: "Shape not found in shapes inventory."))
            
            return node
        }
        
        let shapeX = shape.position.x
        let shapeY = shape.position.y
        let rect = CGRect(x: shapeX, y: shapeY, width: shape.size.width, height: shape.size.height)
        let shapeNode = RenderedShapeNode(rect: rect)
        
        shapeNode.fillColor = .blue
        shapeNode.isUserInteractionEnabled = true
        shapeNode.name = shapeNamed
        
        if depth < 500 {
            for childShapeName in shape.children {
                let childNode = render(shapeNamed: childShapeName, depth: depth + 1)
                
                childNode.position = CGPoint(x: shapeY, y: shapeX)
                
                shapeNode.addChild(childNode)
            }
        }
        
        return shapeNode
    }
    
}
