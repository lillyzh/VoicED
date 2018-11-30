//
//  PhoneCallController.swift
//  VoicED
//
//  Created by Lilly Zhou on 11/30/18.
//  Copyright © 2018 Lilly Zhou. All rights reserved.
//

import UIKit

class PhoneCallController: UIViewController {

    @IBOutlet var CancelButton: UIView!
    @IBOutlet weak var phoneCallButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        let circle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0))
        
        circle.center = self.view.center
        circle.layer.cornerRadius = 200
        circle.backgroundColor = #colorLiteral(red: 0.6124544652, green: 0.8250093215, blue: 0.9686274529, alpha: 1)
        circle.clipsToBounds = true
        
        let darkBlur = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurView = UIVisualEffectView(effect: darkBlur)
        
        blurView.frame = circle.bounds
        circle.addSubview(blurView)
        self.view.addSubview(circle)
        self.view.bringSubviewToFront(phoneCallButton)
        
        CancelButton.layer.cornerRadius = 5.0
        CancelButton.layer.borderWidth = 1.0
        
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
