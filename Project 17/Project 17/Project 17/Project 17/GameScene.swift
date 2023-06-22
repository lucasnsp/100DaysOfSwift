//
//  GameScene.swift
//  Project 17
//
//  Created by Lucas Neves dos santos pompeu on 21/06/23.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var starfield: SKEmitterNode!
    var player: SKSpriteNode!
    var scoreLabel: SKLabelNode!
    var gameOverLabel: SKLabelNode?
    var newGameLabel: SKLabelNode?
    
    var possibleEnemies = ["ball", "hammer", "tv"]
    var gameTimer: Timer?
    var isGameOver = true
    var timerLoop = 0
    var timerInterval: Double = 1
    
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        starfield = SKEmitterNode(fileNamed: "starfield")!
        starfield.position = CGPoint(x: 1024, y: 384)
        starfield.advanceSimulationTime(10)
        addChild(starfield)
        starfield.zPosition = -1
        
        player = SKSpriteNode(imageNamed: "player")
        player.position = CGPoint(x: 100, y: 384)
        player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.size)
        player.physicsBody?.contactTestBitMask = 1
        
        scoreLabel = SKLabelNode(fontNamed: "GillSans-UltraBold")
        scoreLabel.position = CGPoint(x: 16, y: 16)
        scoreLabel.horizontalAlignmentMode = .left
        addChild(scoreLabel)
        
        score = 0
        
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        
        newGame()
    }
    
    func newGame() {
        guard isGameOver else { return }
        
        score = 0
        timerLoop = 0
        timerInterval = 1
        
        isGameOver = false
        
        if let gameOverLabel = gameOverLabel {
            gameOverLabel.removeFromParent()
        }
        
        if let newGameLabel = newGameLabel {
            newGameLabel.removeFromParent()
        }
        
        for node in children {
            if node.name == "Enemy" {
                node.removeFromParent()
            }
        }
        
        player.position = CGPoint(x: 100, y: 384)
        addChild(player)
        
        gameTimer = Timer.scheduledTimer(timeInterval: timerInterval, target: self, selector: #selector(createEnemy), userInfo: nil, repeats: true)
    }
    
    override func update(_ currentTime: TimeInterval) {
        for node in children {
            if node.position.x < -300 {
                node.removeFromParent()
            }
        }
        
        if !isGameOver {
            score += 1
        }
    }
    
    @objc func createEnemy() {
        timerLoop += 1
        
        guard let enemy = possibleEnemies.randomElement() else { return }
        
        let sprite = SKSpriteNode(imageNamed: enemy)
        sprite.position = CGPoint(x: 1200, y: Int.random(in: 50...736))
        sprite.name = "Enemy"
        addChild(sprite)
        
        sprite.physicsBody = SKPhysicsBody(texture: sprite.texture!, size: sprite.size)
        sprite.physicsBody?.categoryBitMask = 1
        sprite.physicsBody?.velocity = CGVector(dx: -500, dy: 0)
        sprite.physicsBody?.angularVelocity = 5
        sprite.physicsBody?.linearDamping = 0
        sprite.physicsBody?.angularDamping = 0
        
        if timerLoop >= 20 {
            timerLoop = 0
            
            if timerInterval > 0.2 {
                timerInterval -= 0.1
            }
            
            gameTimer?.invalidate()
            gameTimer = Timer.scheduledTimer(timeInterval: timerInterval, target: self, selector: #selector(createEnemy), userInfo: nil, repeats: true)
            
        }
        
    }
        
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        var location = touch.location(in: self)
        
        if location.y < 100 {
            location.y = 100
        } else if location.y > 668 {
            location.y = 668
        }
        
        player.position = location
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard !isGameOver else { return }
        
        gameOver()
    }
    
    func gameOver() {
        let explosion = SKEmitterNode(fileNamed: "explosion")!
        explosion.position = player.position
        addChild(explosion)
        
        
        player.removeFromParent()
        isGameOver = true
        
        gameTimer?.invalidate()
        
        gameOverLabel = SKLabelNode(fontNamed: "GillSans-UltraBold")
        gameOverLabel?.position = CGPoint(x: 512, y: 384)
        gameOverLabel?.zPosition = 1
        gameOverLabel?.fontSize = 56
        gameOverLabel?.fontColor = .red
        gameOverLabel?.horizontalAlignmentMode = .center
        gameOverLabel?.text = "GAME OVER"
        addChild(gameOverLabel!)
        
        
        newGameLabel = SKLabelNode(fontNamed: "GillSans-UltraBold")
        newGameLabel?.position = CGPoint(x: 512, y: 314)
        newGameLabel?.zPosition = 1
        newGameLabel?.fontSize = 32
        newGameLabel?.horizontalAlignmentMode = .center
        newGameLabel?.text = "New Game"
        newGameLabel?.name = "NewGame"
        addChild(newGameLabel!)
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        
        if !isGameOver {
            gameOver()
            return
        }
        
        let location = touch.location(in: self)
        
        let objects = nodes(at: location)
        for object in objects {
            if object.name == "NewGame" {
                newGame()
            }
        }
    }
}
