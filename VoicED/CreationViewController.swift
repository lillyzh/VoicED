//
//  CreationViewController.swift
//  VoicED
//
//  Created by Lilly Zhou on 11/30/18.
//  Copyright © 2018 Lilly Zhou. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
    
    
    
    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var answer1TextField: UITextField!
    
    @IBOutlet weak var answer2TextField: UITextField!
    
    @IBOutlet weak var answer3TextField: UITextField!
    
    
    
    var initialQuestion: String?
    var initialAnswer1: String?
    var initialAnswer2: String?
    var initialAnswer3: String?
    
    var flashcardsController: FlashcardViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionTextField.text = initialQuestion
        answer1TextField.text = initialAnswer1
        answer2TextField.text = initialAnswer2
        answer3TextField.text = initialAnswer3
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        let questionText = questionTextField.text
        
        let answer1Text = answer1TextField.text
        let answer2Text = answer2TextField.text
        let answer3Text = answer3TextField.text
        
        if (questionText == nil || answer1Text == nil || answer2Text == nil || answer3Text == nil || answer1Text!.isEmpty || questionText!.isEmpty || answer2Text!.isEmpty || answer3Text!.isEmpty) {
            
            let alert = UIAlertController(title: "Missing text", message:
                "You need to enter both a question and answers", preferredStyle:.alert)
            present(alert, animated: true)
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            
            alert.addAction(okAction)
            
        } else {
            var isExisting = false;
            if initialQuestion != nil {
                isExisting = true;
            }
            
            flashcardsController.updateFlashcard(question: questionText!, answer1: answer1Text!, answer2: answer2Text!, answer3: answer3Text!, isExisting: isExisting)
            
            dismiss(animated: true)
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
