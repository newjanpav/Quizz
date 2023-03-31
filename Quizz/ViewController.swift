//
//  ViewController.swift
//  Quizz
//
//  Created by Pavel Shymanski on 29.03.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choise1: UIButton!
    @IBOutlet weak var choise2: UIButton!
    @IBOutlet weak var choise3: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizzBrain = QuizzBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
   

    @IBAction func tapButtonAnswer(_ sender: UIButton) {
        
        guard let tappedAnswer = sender.currentTitle else{return}
        let answer = quizzBrain.checkAnswer(currentAnswer: tappedAnswer)
        
        if answer {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizzBrain.getNextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        
        choise1.backgroundColor = UIColor.clear
        choise2.backgroundColor = UIColor.clear
        choise3.backgroundColor = UIColor.clear
        choise1.layer.cornerRadius = 15
        choise2.layer.cornerRadius = 15
        choise3.layer.cornerRadius = 15
        choise1.layer.borderWidth = 1
        choise2.layer.borderWidth = 1
        choise3.layer.borderWidth = 1
        
        let numberOfquestion = quizzBrain.currentQuestion
        questionLabel.text = quizzBrain.quizz[numberOfquestion].question
        progressBar.progress = quizzBrain.showProgress()
        
        scoreLabel.text = "Score: \(quizzBrain.score)"
        choise1.setTitle(quizzBrain.quizz[numberOfquestion].answer[0], for: .normal)
        choise2.setTitle(quizzBrain.quizz[numberOfquestion].answer[1], for: .normal)
        choise3.setTitle(quizzBrain.quizz[numberOfquestion].answer[2], for: .normal)

    }
}


