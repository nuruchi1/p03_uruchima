//
//  GameScene.swift
//  project3-basicGame
//
//  Created by Nathaly Uruchima on 9/23/19.
//  Copyright © 2019 Nathaly Uruchima. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var ball:SKSpriteNode!
    var paddle:SKSpriteNode!
    var scoreLabel:SKLabelNode!
    var score:Int = 0{
        didSet{
            scoreLabel.text = "Score:\(score)"
        }
    }
        
        
        
    
    
    override func didMove(to view: SKView) {
        ball = self.childNode(withName: "Ball") as! SKSpriteNode
        paddle = self.childNode(withName: "Paddle") as! SKSpriteNode
        scoreLabel = self.childNode(withName: "Score") as! SKLabelNode
        ball.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 50))
        
        
        
        let border = SKPhysicsBody(edgeLoopFrom: (view.scene?.frame)!)  //create boarder
        border.friction = 0;    //friction is zero so boarder doesn slow ball down
        self.physicsBody = border
        
        
        self.physicsWorld.contactDelegate = self  //allows us to use contact delegate within self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let touchLocation = touch.location(in:self)
            paddle.position.x = touchLocation.x //we are moving (teleport)the paddle to whereever we touch in the x axis
            
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
                   let touchLocation = touch.location(in:self)
                   paddle.position.x = touchLocation.x //we are moving (animation)the paddle to whereever we touch in the x axis
               }
    }
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        //Winning logic
        if (score == 20){
            scoreLabel.text = "You Won!"
            self.view?.isPaused = true;
        }
        
        if(ball.position.y < paddle.position.y){
            scoreLabel.text = "You Lost!"
            self.view?.isPaused = true
            
            
        }
    }

    func didBegin(_ contact: SKPhysicsContact) {
        /*
         bodyAName and bodyBName are returning the contacts between objects
         */
        let bodyAName = contact.bodyA.node?.name
        let bodyBName = contact.bodyB.node?.name
        
        if bodyAName == "Ball" && bodyBName == "Brick" || bodyAName == "Brick" && bodyBName == "Ball" {
            if bodyAName == "Brick"{
                
                contact.bodyA.node?.removeFromParent()
                score+=1
            }
            else if bodyBName == "Brick"{
                contact.bodyB.node?.removeFromParent()
                score+=1
                
            }
            
            
        }
    }
    
    

}
