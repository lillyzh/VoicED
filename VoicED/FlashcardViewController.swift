//
//  FlashcardViewController.swift
//  VoicED
//
//  Created by Lilly Zhou on 11/30/18.
//  Copyright © 2018 Lilly Zhou. All rights reserved.
//

import UIKit

struct Flashcard {
    var question: String
    var first: String
    var second: String
    var third: String
}

class FlashcardViewController: UIViewController {
    
    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var buttonOption1: UIButton!
    @IBOutlet weak var buttonOption2: UIButton!
    @IBOutlet weak var buttonOption3: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!


    var flashcards = [Flashcard]()
    var currentIndex = 0
    var correctAnswerButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        card.alpha = 0.0
        card.transform = CGAffineTransform.identity.scaledBy(x: 0.75, y: 0.75)
        
        buttonOption3.alpha = 0.0
        buttonOption3.transform = CGAffineTransform.identity.scaledBy(x: 0.75, y: 0.75)
        buttonOption2.alpha = 0.0
        buttonOption2.transform = CGAffineTransform.identity.scaledBy(x: 0.75, y: 0.75)
        buttonOption1.alpha = 0.0
        buttonOption1.transform = CGAffineTransform.identity.scaledBy(x: 0.75, y: 0.75)
        
        UIView.animate(withDuration: 0.6, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.card.alpha = 1.0
            self.card.transform = CGAffineTransform.identity
            
            self.buttonOption1.alpha = 1.0
            self.buttonOption1.transform = CGAffineTransform.identity
            
            self.buttonOption2.alpha = 1.0
            self.buttonOption2.transform = CGAffineTransform.identity
            
            self.buttonOption3.alpha = 1.0
            self.buttonOption3.transform = CGAffineTransform.identity
        })
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        card.layer.cornerRadius = 20.0
        frontLabel.layer.cornerRadius = 20.0
        backLabel.layer.cornerRadius = 20.0
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        frontLabel.clipsToBounds = true
        backLabel.clipsToBounds = true
        
        buttonOption1.layer.borderWidth = 3.0
        buttonOption1.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        buttonOption1.layer.cornerRadius = 20.0
        
        buttonOption2.layer.borderWidth = 3.0
        buttonOption2.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        buttonOption2.layer.cornerRadius = 20.0
        
        buttonOption3.layer.borderWidth = 3.0
        buttonOption3.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        buttonOption3.layer.cornerRadius = 20.0
        
        readSavedFlashcards()
        
        if flashcards.count == 0 {
            let there = false;
            updateFlashcard(question: "I", answer1: "你", answer2: "我", answer3: "他", isExisting: there)
        }else{
            updateLabels()
            updateNextPrevButtons()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as!
        CreationViewController
        creationController.flashcardsController = self
        
        if (segue.identifier == "EditSegue") {
            frontLabel.isHidden = false
            creationController.initialQuestion = frontLabel.text
            creationController.initialAnswer2 = backLabel.text
            creationController.initialAnswer1 = buttonOption1.currentTitle
            creationController.initialAnswer3 = buttonOption3.currentTitle
        }
    }
    
    
    @IBAction func didTapOnFlashCard(_ sender: Any) {
        flipFlashCard()
    }

    func flipFlashCard(){
        UIView.transition(with: card, duration: 0.3, options: .transitionFlipFromRight, animations: {
            if(self.frontLabel.isHidden == true){
                self.frontLabel.isHidden = false;
            }else{
                self.frontLabel.isHidden = true
            }
        })
    }
    
    func animateCardOut(){
        UIView.animate(withDuration: 0.3, animations: {
            self.frontLabel.isHidden = false
            self.card.transform = CGAffineTransform.identity.translatedBy(x: -300.0, y: 0.0)}, completion: {finished in
                self.updateLabels()
                self.animateCardIn()
        })
    }
    
    func animateCardIn(){
        self.frontLabel.isHidden = false
        self.card.transform = CGAffineTransform.identity.translatedBy(x: 300.0, y: 0.0)
        
        UIView.animate(withDuration: 0.3) {
            self.card.transform = CGAffineTransform.identity
        }
    }
    
    func animateCardOutBackWard(){
        self.frontLabel.isHidden = false
        UIView.animate(withDuration: 0.3, animations: {
            self.card.transform = CGAffineTransform.identity.translatedBy(x: 300.0, y: 0.0)}, completion: {finished in
                self.updateLabels()
                self.animateCardInBackWard()
        })
    }
    
    func animateCardInBackWard(){
        self.frontLabel.isHidden = false
        self.card.transform = CGAffineTransform.identity.translatedBy(x: -300.0, y: 0.0)
        
        UIView.animate(withDuration: 0.3) {
            self.card.transform = CGAffineTransform.identity
        }
    }
    
    
    func updateFlashcard(question: String, answer1: String, answer2: String, answer3: String, isExisting: Bool) {
        
        let flashcard = Flashcard(question: question, first: answer1, second: answer2, third: answer3)
        
        if isExisting {
            flashcards[currentIndex] = flashcard
        }else{
            flashcards.append(flashcard)
        }
        
        frontLabel.isHidden = false
        frontLabel.text = flashcard.question
        backLabel.text = flashcard.second
        
        buttonOption1.setTitle(flashcard.first, for: .normal)
        buttonOption2.setTitle(flashcard.second, for: .normal)
        buttonOption3.setTitle(flashcard.third, for: .normal)
        
        currentIndex = flashcards.count - 1
        print("Added new flashcard")
        print("We now have \(currentIndex) flashcards")
        
        updateNextPrevButtons()
        updateLabels()
        saveALlFlashcardsToDisk()
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        currentIndex = currentIndex + 1
        updateNextPrevButtons()
        animateCardOut()
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        currentIndex = currentIndex - 1
        updateNextPrevButtons()
        animateCardOutBackWard()
    }
    
    func updateNextPrevButtons(){
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
        
        if currentIndex <= 0 {
            prevButton.isEnabled = false
        } else {
            prevButton.isEnabled = true
        }
    }
    
    func updateLabels(){
        let currentFlashcard = flashcards[currentIndex]
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.second
        
        let buttons = [buttonOption3, buttonOption2, buttonOption1].shuffled()
        let answers = [currentFlashcard.first, currentFlashcard.second, currentFlashcard.third].shuffled()
        
        for(button, answer) in zip(buttons, answers) {
            button?.setTitle(answer, for: .normal)
            if answer == currentFlashcard.second {
                correctAnswerButton = button
            }
        }
    }
    
    
    @IBAction func didTapOnOptionOne(_ sender: Any) {
        if buttonOption1 == correctAnswerButton{
            flipFlashCard()
        } else {
            frontLabel.isHidden = false
        }
    }
    
    @IBAction func didTapOnOptionTwo(_ sender: Any) {
        if buttonOption2 == correctAnswerButton{
            flipFlashCard()
        } else {
            frontLabel.isHidden = false
        }
    }
    
    @IBAction func didTapOnOptionThree(_ sender: Any) {
        if buttonOption3 == correctAnswerButton{
            flipFlashCard()
        } else {
            frontLabel.isHidden = false
        }
    }
    
    func saveALlFlashcardsToDisk(){
        let dictionaryArray = flashcards.map {(card) -> [String: String] in
            return ["question": card.question, "first": card.first, "second": card.second, "third": card.third]
        }
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        print("flashcards saved to default")
    }
    
    func readSavedFlashcards(){
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]]{
            let savedCards = dictionaryArray.map{ dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]!, first: dictionary["first"]!, second: dictionary["second"]!, third: dictionary["third"]!)
            }
            flashcards.append(contentsOf: savedCards)
        }
    }
    
    @IBAction func DidTapOnDelete(_ sender: Any) {
        
        if (flashcards.count==1){
            let alert = UIAlertController(title: "This is the only flashcard", message: "Cannot delete it", preferredStyle: .actionSheet)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancel)
            present(alert, animated: true)
        }
        
        let alert = UIAlertController(title: "Delete flashcard", message: "Are you sure you want to delete it?", preferredStyle:.actionSheet)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive){action in self.deleteCurrentFlashCard()}
        alert.addAction(deleteAction)
        present(alert, animated: true)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancel)
    }
    
    func deleteCurrentFlashCard(){
        flashcards.remove(at: currentIndex)
        if (currentIndex > flashcards.count - 1){
            currentIndex = flashcards.count - 1
        }
        updateLabels()
        updateNextPrevButtons()
        saveALlFlashcardsToDisk()
    }
}
