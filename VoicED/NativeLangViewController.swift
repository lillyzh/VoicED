//
//  NativeLangViewController.swift
//  VoicED
//
//  Created by Lilly Zhou on 11/29/18.
//  Copyright © 2018 Lilly Zhou. All rights reserved.
//

import UIKit

class NativeLangViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {


    @IBOutlet weak var langMenu: UIPickerView!
    
    var languages: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.langMenu.delegate = self
        self.langMenu.dataSource = self
        languages = ["English", "中文", "Español", "français"]
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languages.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) ->String? {
        return languages[row]
    }
}
