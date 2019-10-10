//
//  GameScene.swift
//  project3-basicGame
//
//  Created by Nathaly Uruchima on 9/23/19.
//  Copyright © 2019 Nathaly Uruchima. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball = ["whiteSphere"]
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "whiteSphere")
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.alpha = 0.2
        background.zPosition = -1
        
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
