//
//  ViewController.swift
//  Project 2
//
//  Created by Blinera Ibrahimi on 18.5.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var round = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
       
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1

        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion(action: nil)
    }
    
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        let uppercasedCountry = countries[correctAnswer].uppercased()
        title = "Round: \(round)/10 - Tap on: \(uppercasedCountry)'s flag"
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
//        countries[sender.tag].capitalized
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            round += 1
        } else {
            title = "Wrong. That's the flag of \(countries[sender.tag].capitalized)"
            score -= 1
            round += 1
        }

        if round < 11 {
            let alertController = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(alertController, animated: true)
        } else if round == 11 || correctAnswer == 11 {
            let winAlertController = UIAlertController(title: "Congratulations!!", message: "You answerd all correct. Your score is \(score)/10.", preferredStyle: .alert)
            winAlertController.addAction(UIAlertAction(title: "Start new game!", style: .default, handler: startNewGame))
            present(winAlertController, animated: true)
        } else {
            let finalAlertController = UIAlertController(title: "Game over!", message: "Your score is \(score).", preferredStyle: .alert)
            finalAlertController.addAction(UIAlertAction(title: "Start new game!", style: .default, handler: startNewGame))
            present(finalAlertController, animated: true)
        }
        
    }
  
    func startNewGame(action: UIAlertAction){
        score = 0
        round = 1
        askQuestion(action: nil)
    }
    
}

