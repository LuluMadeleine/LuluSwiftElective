//
//  ViewController.swift
//  Swift_Project01_Quiz
//
//  Created by Lucifox on 18/04/16.
//  Copyright © 2016 Lisa Hofstädter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var categories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Kategorie1
        
        var questionsCategory1 = [Question]()
        
            //Frage1
        
            let question1C1 = Question(text: "Wieso hast du so große Zähne?", answer1: "Wegen hässlich.", answer2: "Schlechter Zahnarzt", answer3: "Hab sie einem Wolf geklaut.", answer4: "Damit ich dich besser fressen kann.", rightAnswer: 4)
                questionsCategory1.append(question1C1)
        
            //Frage2
        
            let question2C1 = Question(text: "Wer hat an der Uhr gedreht?", answer1: "Deine Mutter", answer2: "Jan Böhmermann", answer3: "Der rosarote Panther", answer4: "Angela Merkel", rightAnswer: 3)
                questionsCategory1.append(question2C1)
        
        let category1 = Category(title: "Entertainment", questions: questionsCategory1)
        categories.append(category1)
        
        //Kategorie2
        
        var questionsCategory2 = [Question]()
        
            //Frage1
        
            let question1C2 = Question(text: "Was kannst du eigentlich?", answer1: "Nix", answer2: "Alles", answer3: "Einiges", answer4: "Reden", rightAnswer: 3)
                questionsCategory2.append(question1C2)
        
            //Frage2
        
            let question2C2 = Question(text: "Was ist der Sinn des Lebens?", answer1: "42", answer2: "Hugh Jackman", answer3: "Paella", answer4: "Malibu", rightAnswer: 1)
                questionsCategory2.append(question2C2)
        
        let category2 = Category(title: "Fragen des Lebens", questions: questionsCategory2)
        categories.append(category2)
        
        //Kategorie3
        
        var questionsCategory3 = [Question]()
        
            //Frage1
        
            let question1C3 = Question(text: "Wie funktioniert ein if-else-statement?", answer1: "So oder so!", answer2: "Gar nicht", answer3: "Falls {du das vergessen hast}", answer4: "Damit ich dich besser fressen kann.", rightAnswer: 4)
                questionsCategory3.append(question1C3)
        
            //Frage2
        
            let question2C3 = Question(text: "#?", answer1: "#imdiot", answer2: "#dritterHashtag", answer3: "#flirtenKannIch", answer4: "#jhj", rightAnswer: 1)
                questionsCategory3.append(question2C3)

        let category3 = Category(title: "Media", questions: questionsCategory3)
        categories.append(category3)
        
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
            let index = Int(arc4random()) % categories.count
            controller.questions = categories[index].questions
            //controller.numberOfQuestions = categories[0].questions.count
        }
    }
}

