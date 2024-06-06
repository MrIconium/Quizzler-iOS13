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
                prepareToBegin()
                quiz.currentQuestion = 0
            } else {
                updateQuestion()
            }  
        }
    }
    
    func prepareToBegin(){
        if quiz.currentQuestion == 0 {
            questionText.text = quiz.questions[0].q
            quizProgress.progress = 0
        }
    }
    
    func updateQuestion(){
        questionText.text = quiz.questions[quiz.currentQuestion].q
    }
    
}

