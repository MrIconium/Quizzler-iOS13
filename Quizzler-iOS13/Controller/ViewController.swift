//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var quizProgress: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    let quiz: QuizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        prepareToBegin()
    }

    @IBAction func answerButtons(_ sender: UIButton) {
        
        if let titleText = sender.titleLabel?.text {
            quiz.checkAnswer(titleText)
            
            if quiz.currentQuestion >= quiz.questions.count {
                quizProgress.progress = 0
                quiz.currentQuestion = 0
                quiz.score = 0
                scoreLabel.text = "0"
                prepareToBegin()
            } else {
                updateQuestion()
            }  
        }
    }
    
    func prepareToBegin(){
        questionText.text = quiz.questions[0].q
        quizProgress.progress = 0
    }
    
    func updateQuestion(){
        questionText.text = quiz.questions[quiz.currentQuestion].q
        quizProgress.progress = Float(quiz.currentQuestion) / Float(quiz.questions.count)
        scoreLabel.text = String(quiz.score)
    }
    
}

