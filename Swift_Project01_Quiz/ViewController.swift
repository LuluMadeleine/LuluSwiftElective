//
//  ViewController.swift
//  Swift_Project01_Quiz
//
//  Created by Lucifox on 18/04/16.
//  Copyright © 2016 Lisa Hofstädter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var questions = [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let question1 = Question(text: "Wer hat an der Uhr gedreht?", answer1: "Deine Mutter", answer2: "Jan Böhmermann", answer3: "Der rosarote Panther", answer4: "Angela Merkel", rightAnswer: 3)
        questions.append(question1)
        
        let question2 = Question(text: "Was ist der Sinn des Lebens?", answer1: "42", answer2: "Hugh Jackman", answer3: "Paella", answer4: "Malibu", rightAnswer: 1)
        questions.append(question2)
        
        let question3 = Question(text: "#?", answer1: "#imdiot", answer2: "#dritterHashtag", answer3: "#flirtenKannIch", answer4: "#jhj", rightAnswer: 1)
        questions.append(question3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startButtonHandler(sender: AnyObject) {
        print("Button tapped!")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let controller = segue.destinationViewController as? QuestionViewController {
            controller.questions = questions
        }
    }
}

