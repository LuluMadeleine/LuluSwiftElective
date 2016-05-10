//
//  QuestionViewController.swift
//  Swift_Project01_Quiz
//
//  Created by Lucifox on 18/04/16.
//  Copyright © 2016 Lisa Hofstädter. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    
    var questions: [Question]?
    var question: Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let questions = questions else {
            return
        }
        
        let index = Int(arc4random()) % questions.count
        question = questions[index]
        self.questions?.removeAtIndex(index)
        
        textLabel.text = question?.text
        answer1Button.setTitle(question?.answer1, forState: .Normal)
        answer2Button.setTitle(question?.answer2, forState: .Normal)
        answer3Button.setTitle(question?.answer3, forState: .Normal)
        answer4Button.setTitle(question?.answer4, forState: .Normal)
    }

        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func answer1ButtonHandler(sender: UIButton) {
        checkAnswer(1, button: sender)
    }
    
    @IBAction func answer2ButtonHandler(sender: UIButton) {
        checkAnswer(2, button: sender)
    }
    
    @IBAction func answer3ButtonHandler(sender: UIButton) {
        checkAnswer(3, button: sender)
    }
    
    @IBAction func answer4ButtonHandler(sender: UIButton) {
        checkAnswer(4, button: sender)
    }
    
    private func checkAnswer(index: Int, button: UIButton) {
        if index == question?.rightAnswer {
            print("right")
            button.backgroundColor = UIColor.greenColor()
            
            let alertController = UIAlertController(title: "Damn right!", message: "Here's your cookie.", preferredStyle: .Alert)
            let action = UIAlertAction(title: "👊🏼", style: .Default) { (_) in
                self.showNextQuestion()
            }
            alertController.addAction(action)
            presentViewController(alertController, animated: true, completion: nil)
        } else {
            print("wrong")
            button.backgroundColor = UIColor.redColor()
            
            let alertController = UIAlertController(title: "Nope!", message: "No cookie for you.", preferredStyle: .Alert)
            let action = UIAlertAction(title: "🖕🏼", style: .Default) { (_) in
                self.showNextQuestion()
            }
            alertController.addAction(action)
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    private func showNextQuestion() {
        if questions?.count > 0 {
            performSegueWithIdentifier("ShowQuestion", sender: nil)
        } else {
            navigationController?.popToRootViewControllerAnimated(true)
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let controller = segue.destinationViewController as? QuestionViewController {
            controller.questions = questions
        }
    }
    
}

