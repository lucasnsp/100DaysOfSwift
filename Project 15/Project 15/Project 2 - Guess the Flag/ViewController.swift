//
//  ViewController.swift
//  Project 2 - Guess the Flag
//
//  Created by Lucas Neves dos santos pompeu on 22/04/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    
    var highestScore = -11
    var highestScoreKey = "HighestScore"
    
    
    var correctAnswer = 0
    var currentQuestion = 0
    var maxQuestion = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showScore))
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        button2.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        button3.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        let userDefaults = UserDefaults.standard
        highestScore = userDefaults.object(forKey: highestScoreKey) as? Int ?? -11
        
        askQuestion()
        
        
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        currentQuestion += 1
        
        if currentQuestion > maxQuestion {
            showResult()
            return
        }
        
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        
        updateTitle()
            
    }
 
    func showResult() {
        var message = "Questions asked: \(maxQuestion)\nFinal score: \(score)"
        
        let ac = UIAlertController(title: "End of the game", message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Restart game", style: .default, handler: askQuestion))
        
        var mustSaveHighestScore = false
        if score > highestScore {
            message += "\n\nNEWHIGHSCORE!\nPrevious high score\(highestScore)"
            highestScore = score
            mustSaveHighestScore = true
        }
        
        
        score = 0
        correctAnswer = 0
        currentQuestion = 0
        
        present(ac, animated: true)
        
        if mustSaveHighestScore {
            performSelector(inBackground: #selector(saveHighestScore), with: nil)
        }
        
    }
    
    @objc func saveHighestScore() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(highestScore, forKey: highestScoreKey)
    }
    
    func updateTitle() {
        title = "\(countries[correctAnswer].uppercased()) - \(currentQuestion)/\(maxQuestion)"
    }
    
    @IBAction func buttonTouched(_ sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            sender.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            sender.transform = .identity
        })
        
        
        var title: String
        var message: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            
            
            message = """
            That's correct, Congratulations ✅
            Score: \(score)
            """
        } else {
            title = "Wrong"
            score -= 1
            
            
            message = """
                Wrong! ❌
                You picked: \(countries[sender.tag].uppercased())
                The correct answer was \(countries[correctAnswer].uppercased())
                And was at the position #\(correctAnswer + 1)
                Score: \(score)
                """
            
            
            
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
        
        
    }
    
    
    @objc func showScore() {
        let vc = UIAlertController(title: "Time to check the Score", message: "\nCurrent Score: \(score)", preferredStyle: .alert)
        vc.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
        
        present(vc, animated: true)
        
        
    }
    

    
}

