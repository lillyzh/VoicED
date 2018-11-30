//
//  MainPageController.swift
//  VoicED
//
//  Created by Lilly Zhou on 11/29/18.
//  Copyright © 2018 Lilly Zhou. All rights reserved.
//

import UIKit


var list = [String?]()

class MainPageController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var myViewTable: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        myViewTable.reloadData()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return list.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "📞" + " " + list[indexPath.row]!
        if (indexPath.row % 2 == 0) { cell.backgroundColor = #colorLiteral(red: 0.2579882741, green: 0.7565394044, blue: 0.9776960015, alpha: 1)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            list.remove(at: indexPath.row)
            myViewTable.reloadData()
        }
    }
    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    var chosenLanguage: String?
    
    @IBOutlet weak var listOfWrongWords: UIButton!
    
    @IBOutlet weak var setting: UIButton!
    
    var scheduleCall: String?
    var goalForCall: String?
    
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
