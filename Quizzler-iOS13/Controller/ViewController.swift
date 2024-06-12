//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, QuizBrainDelegete {
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var quizProgress: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    let quiz: QuizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        quiz.delegate = self
        prepareToBegin()
    }

    @IBAction func answerButtons(_ sender: UIButton) {
        if let titleText = sender.titleLabel?.text {
            quiz.checkAnswer(titleText)
        }
        
        if quiz.answerIs == true {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) {
            sender.backgroundColor = UIColor.clear
        }

    }
    
    func updateDisplay(_ qText:String, _ testScore:Int, _ cProgress:Float) {
        questionText.text = qText
        quizProgress.progress = cProgress
        scoreLabel.text = String(testScore)
    }
    
    func prepareToBegin(){
        questionText.text = quiz.questions[0].q
        quizProgress.progress = 0
    }
    
}

