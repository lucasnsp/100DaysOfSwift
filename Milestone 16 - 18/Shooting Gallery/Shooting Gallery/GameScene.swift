//
//  GameScene.swift
//  Shooting Gallery
//
//  Created by Lucas Neves dos santos pompeu on 26/06/23.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var bow: SKSpriteNode!
    var timerLabel: SKLabelNode!
    var shotTextures = [SKTexture(imageNamed: "arrow")]
    var scoreLabel: SKLabelNode!
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    var timer = 60 {
        didSet {
            timerLabel.text = "\(timer)"
        }
    }
    
    var countdownTimer: Timer?
    var createTargetsTimer: Timer?
    var targetSpeed = 4.0
    var targetDelay = 0.8
    var targetsCreated = 0
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        bow = SKSpriteNode(imageNamed: "bow")
        bow.position = CGPoint(x: 512, y: 40)
        bow.size = CGSize(width: 150, height: 150)
        addChild(bow)
        
        scoreLabel = SKLabelNode(fontNamed: "ChalkDuster")
        scoreLabel.position = CGPoint(x: 10, y: 728)
        scoreLabel.horizontalAlignmentMode = .left
        addChild(scoreLabel)
        
        timerLabel = SKLabelNode(fontNamed: "ChalkDuster")
        timerLabel.position = CGPoint(x: 1000, y: 728)
        timerLabel.horizontalAlignmentMode = .right
        addChild(timerLabel)
        
        physicsWorld.gravity = .zero
        
        score = 0
        
    }
    
    @objc func createTarget() {
        let target = Target()
                target.setup()

                let level = Int.random(in: 0...2)
                var movingRight = true
                
                switch level {
                case 0:
                    target.zPosition = 50
                    target.position.y = 370
                case 1:
                    target.zPosition = 100.5
                    target.position.y = 280

                    movingRight = false
                default:
                    
                    target.zPosition = 101.5
                    target.position.y = 220
                }

                let move: SKAction

                if movingRight {
                    target.position.x = 0
                    move = SKAction.moveTo(x: 800, duration: 4.0)
                } else {
                    target.position.x = 800
                    target.xScale = -target.xScale
                    move = SKAction.moveTo(x: 0, duration: 4.0)
                }

                let sequence = SKAction.sequence([move, SKAction.removeFromParent()])
                target.run(sequence)
                addChild(target)

                
            }
    
}
