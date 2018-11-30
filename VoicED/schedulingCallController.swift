//
//  schedulingCallController.swift
//  VoicED
//
//  Created by Lilly Zhou on 11/30/18.
//  Copyright © 2018 Lilly Zhou. All rights reserved.
//

import UIKit

class schedulingCallController: UIViewController {
    

    @IBOutlet weak var pickerDate: UIDatePicker!
    @IBOutlet weak var goalTextField: UITextField!
    
    var scheduledDateTime: String?
    var goal: String?
    
    @IBOutlet var ConfirmButton: UIView!
    @IBOutlet weak var topic: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ConfirmButton.layer.cornerRadius = 5.0
        ConfirmButton.layer.borderWidth = 1.0
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy hh:mm a"
        scheduledDateTime = formatter.string(from: pickerDate.date)
    }
    
    @IBAction func didTapOnDatePicker(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy hh:mm a"
        scheduledDateTime = formatter.string(from: pickerDate.date)
    }
    
    @IBAction func didTapOnGoalTF(_ sender: Any) {
        goal = goalTextField.text
    }
    
    @IBAction func didTapOnConfirm(_ sender: Any) {
        
        
        let alert = UIAlertController(title: " ", message: "Call has been successfully scheduled", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        
        // change to desired number of seconds (in this case 3 seconds)
        let when = DispatchTime.now() + 3
        DispatchQueue.main.asyncAfter(deadline: when){
            // your code with delay
            alert.dismiss(animated: true, completion: nil)
        }
            list.append(scheduledDateTime)
        print (list[0] as Any)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let vc = segue.destination as? MainPageController
        {
            vc.scheduleCall = scheduledDateTime
            vc.goalForCall = goal
        }
    }
}
