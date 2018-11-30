//
//  ViewController.swift
//  VoicED
//
//  Created by Lilly Zhou on 11/29/18.
//  Copyright © 2018 Lilly Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var backgroundColor: UIColor!
    
    @IBOutlet weak var LetsGetStarted: UIButton!
    @IBOutlet weak var VoicEDLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2579882741, green: 0.7565394044, blue: 0.9776960015, alpha: 1)
        backgroundColor = view.backgroundColor
        
        let circle = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 400.0, height: 400.0))
        
        circle.center = self.view.center
        circle.layer.cornerRadius = 200
        circle.backgroundColor = #colorLiteral(red: 0.6124544652, green: 0.8250093215, blue: 0.9686274529, alpha: 1)
        circle.clipsToBounds = true
        
        
        let darkBlur = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurView = UIVisualEffectView(effect: darkBlur)
        
        blurView.frame = circle.bounds
        
        circle.addSubview(blurView)
        self.view.addSubview(circle)
        self.view.bringSubviewToFront(VoicEDLabel);
        
        LetsGetStarted.layer.cornerRadius = 10.0
        LetsGetStarted.layer.borderWidth = 1.0
        self.view.bringSubviewToFront(LetsGetStarted);
       
    }


}

