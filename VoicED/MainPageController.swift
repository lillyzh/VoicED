//
//  MainPageController.swift
//  VoicED
//
//  Created by Lilly Zhou on 11/29/18.
//  Copyright © 2018 Lilly Zhou. All rights reserved.
//

import UIKit

class MainPageController: UIViewController {


    @IBOutlet weak var welcomeLabel: UILabel!
    var chosenLanguage: String?
    
    @IBOutlet weak var listOfWrongWords: UIButton!
    
    @IBOutlet weak var setting: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listOfWrongWords.layer.cornerRadius = 20.0
        listOfWrongWords.layer.borderWidth = 1.0
        
        setting.layer.cornerRadius = 20.0
        setting.layer.borderWidth = 1.0
        
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController!.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        
        if chosenLanguage == "中文" {
            welcomeLabel.text = "欢迎"
        }
        if chosenLanguage == "Español"{
            welcomeLabel.text = "Bienvenido"
        }
        if chosenLanguage == "Français"{
            welcomeLabel.text = "Bienvenue"
        }
        if chosenLanguage == "English"{
            welcomeLabel.text = "Welcome"
        }
    }
}
