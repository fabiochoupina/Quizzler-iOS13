//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var firstOptionButton: UIButton!
    @IBOutlet weak var secondOptionButton: UIButton!
    @IBOutlet weak var thirdOptionButton: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
         
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        //Need to fetch the answers and update the button titles using the setTitle method
        let answerChoices = quizBrain.getAnswers()
        firstOptionButton.setTitle(answerChoices[0], for: .normal)
        secondOptionButton.setTitle(answerChoices[1], for: .normal)
        thirdOptionButton.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score \(quizBrain.getScore())"
        
        firstOptionButton.backgroundColor = UIColor.clear
        secondOptionButton.backgroundColor = UIColor.clear
        thirdOptionButton.backgroundColor = UIColor.clear
    }
    
}

