//
//  Target.swift
//  Shooting Gallery
//
//  Created by Lucas Neves dos santos pompeu on 26/06/23.
//

import SpriteKit

class Target: SKNode {
        var target: SKSpriteNode!
        var points: Int!
        
        func setup() {
            
            target = SKSpriteNode(imageNamed: "smallTarget")
            let scaleSize = Int.random(in: 0...3)
            
            switch scaleSize {
            case 0:
                points = 15
                target.setScale(0.4)
            case 1:
                points = 10
                target.setScale(0.6)
            case 2:
                points = 5
                target.setScale(0.7)
            case 3:
                points = 3
                target.setScale(0.8)
            default:
                points = 3
                target.setScale(0.8)
            }
            
            target.name = "target"
            target.position.y += 116
            addChild(target)
        }

        func hit() {
            removeAllActions()
            target.name = nil

            let animationTime = 0.2
            target.run(SKAction.colorize(with: .black, colorBlendFactor: 1, duration: animationTime))
            run(SKAction.fadeOut(withDuration: animationTime))
            run(SKAction.moveBy(x: 0, y: -30, duration: animationTime))
            run(SKAction.scaleX(by: 0.8, y: 0.7, duration: animationTime))
    }
}
