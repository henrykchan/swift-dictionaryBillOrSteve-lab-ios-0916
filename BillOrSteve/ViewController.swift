//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Create your stored properties here
    
    
    var billAndSteveFacts: [String : [String]] = [:]
    var currentPerson: String = ""
    var currentFact:String = ""
    var correctGuesses:Int = 0
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var billLabel: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createFacts()
        showFact()
        
    
    
    
    }
    
    @IBAction func steveButtonTapped(_ sender: AnyObject) {
        
        if currentPerson == "Steve Jobs" {
            
            correctGuesses += 1
            scoreLabel.text = String(correctGuesses)
            
        }
        
        showFact()
    }
    
    @IBAction func billButtonTapped(_ sender: AnyObject) {
        
        if currentPerson == "Bill Gates" {
            
            correctGuesses += 1
            scoreLabel.text = String(correctGuesses)
            
        }
        
        showFact()
    }
    
    func showFact() {
        
        let response = getRandomFact()
        
        let name = response.0
        
        let fact = response.1
        
        currentPerson = name
        
        currentFact = fact
        
        factLabel.text = fact
    }
    
   
    
    //All Facts
    func createFacts() {
        
        let billFacts = [
            
            "He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.",
            
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            
            "He was a pescetarian, meaning he ate no meat except for fish.",
            
        ]
        
        
        let steveFacts = [
        
                "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
                
                "He scored 1590 (out of 1600) on his SATs.",
                
                "His foundation spends more on global health each year than the United Nation's World Health Organization.",
                
                "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
                
                "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss.",
        
        ]
        
        billAndSteveFacts ["Bill Gates"] = billFacts
        billAndSteveFacts ["Steve Jobs"] = steveFacts
    }
    
    func getRandomFact() -> (String, String) {
        
        let person = randomPerson()
        
        if let facts = billAndSteveFacts[person] {
            
            let factIndex = randomIndex(fromArray: facts)
            
            let fact = facts[factIndex]
            
            
            return (person, fact)
        }
        
        return ("There is no such person", "There is no available fact")
        
    }
    
    
    
    
    // Helper Functions
    func randomIndex(fromArray array: [String]) -> Int {
        return Int(arc4random_uniform(UInt32(array.count)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    
}
