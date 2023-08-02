//
//  GameViewController.swift
//  Project 29
//
//  Created by Lucas Neves dos santos pompeu on 31/07/23.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    var currentGame: GameScene?
    
    @IBOutlet weak var angleSlider: UISlider!
    @IBOutlet weak var angleLabel: UILabel!
    
    @IBOutlet weak var velocitySlider: UISlider!
    @IBOutlet weak var velocityLabel: UILabel!
    
    @IBOutlet weak var launchButton: UIButton!
    @IBOutlet weak var playerNumber: UILabel!
    @IBOutlet weak var player1ScoreLabel: UILabel!
    @IBOutlet weak var player2ScoreLabel: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    
    
    var player1Score: Int = 0 {
            didSet {
                player1ScoreLabel.text = "Score: \(player1Score)"
            }
        }
        var player2Score: Int = 0 {
            didSet {
                player2ScoreLabel.text = "Score: \(player2Score)"
            }
        }
        
        var gameStopped = false {
            didSet {
                newGameButton.isHidden = !gameStopped
            }
        }
    
    @IBOutlet weak var player1Wind: UILabel!
    @IBOutlet weak var player2Wind: UILabel!
    var wind: Wind!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        gameStopped = false
        player1Score = 0
        player2Score = 0

                
        wind = Wind.getRandomWind()
        player1Wind.attributedText = wind.getText()
        player1Wind.isHidden = false
        player2Wind.isHidden = true
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .fill
                
                // Present the scene
                view.presentScene(scene)
                
                currentGame = scene as? GameScene
                currentGame?.viewController = self
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
        angleChanged(self)
        velocityChanged(self)
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func angleChanged(_ sender: Any) {
        angleLabel.text = "Angle: \(Int(angleSlider.value))°"
    }
    
    @IBAction func velocityChanged(_ sender: Any) {
        velocityLabel.text = "Velocity: \(Int(velocitySlider.value))°"
    }
    
    @IBAction func launch(_ sender: Any) {
        angleSlider.isHidden = true
        angleLabel.isHidden = true
        
        velocityLabel.isHidden = true
        velocitySlider.isHidden = true
        
        launchButton.isHidden = true
        
        currentGame?.launch(angle: Int(angleSlider.value), velocity: Int(velocitySlider.value))
    }
    
    func activatePlayer(number: Int) {
        wind = Wind.getRandomWind()
        
        if number == 1 {
            playerNumber.text = "<<< PLAYER ONE"
            
            player1Wind.attributedText = wind.getText()
            player1Wind.isHidden = false
            player2Wind.isHidden = true
        } else {
            playerNumber.text = "PLAYER TWO >>>"
            player2Wind.attributedText = wind.getText()
            player2Wind.isHidden = false
            player1Wind.isHidden = true
        }
        
        angleSlider.isHidden = false
        angleLabel.isHidden = false
        
        velocityLabel.isHidden = false
        velocitySlider.isHidden = false
        
        launchButton.isHidden = false
    }
    
    func gameControls(isHidden: Bool) {
        angleSlider.isHidden = isHidden
        angleLabel.isHidden = isHidden
        
        velocityLabel.isHidden = isHidden
        velocitySlider.isHidden = isHidden
        
        launchButton.isHidden = isHidden
    }
    
    func playerScored(player: Int) {
        if player == 1 {
            player1Score += 1
        } else {
            player2Score += 1
        }
        
        if player1Score == 3 {
            playerNumber.text = "PlAYER 1 WINS"
            stopGame()
        } else if player2Score == 3 {
            playerNumber.text = "PLAYER 2 WINS"
            stopGame()
        }
    }
    
    func stopGame() {
        gameControls(isHidden: true)
        gameStopped = true
    }
    
    @IBAction func newGameAction(_ sender: Any) {
        gameStopped = false
        player1Score = 0
        player2Score = 0
        currentGame?.newGame()
    }
    
}
