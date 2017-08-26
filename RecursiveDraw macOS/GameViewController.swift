//
//  GameViewController.swift
//  RecursiveDraw macOS
//
//  Created by Wesley Van der Klomp on 8/25/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Cocoa
import SpriteKit

class GameViewController: NSViewController {

    var shapesInventory: ShapeInventory = [:]
    var rootShape: ShapeName?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        let scene = GameScene.newGameScene()
        // Present the scene
        let skView = self.view as! SKView
//        skView.presentScene(scene)
//
//        skView.ignoresSiblingOrder = true
//
//        skView.showsFPS = true
//        skView.showsNodeCount = true
//
//
//
        let size = CGSize(width: 100, height: 100)
        let shapePosition = CGPoint(x: 75, y: 90)
        
        shapesInventory["square"] = Shape(size: size, position: shapePosition, children: ["square"])
        
        let renderer = SpriteKitRenderer(shapesInventory: shapesInventory)
        let rendered = renderer.render(shapeNamed: "square")
        
        
            let scene = GameScene(size: skView.frame.size)
            
            scene.scaleMode = .aspectFit
            
            scene.addChild(rendered)
            
            skView.presentScene(scene)
            
            skView.ignoresSiblingOrder = true
            skView.showsFPS = true
            skView.showsNodeCount = true
        
    }

}

