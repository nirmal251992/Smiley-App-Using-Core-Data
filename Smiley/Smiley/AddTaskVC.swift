//
//  AddTaskVC.swift
//  Smiley
//
//  Created by Nirmal  on 25/12/17.
//  Copyright © 2017 Nirmal . All rights reserved.
//

import UIKit

class AddTaskVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var needSmiley: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hi This is Nirmal")

        // Do any additional setup after loading the view.
    }

  
    
    @IBAction func saveTapped(_ sender: Any) {
        
        let guest = UIApplication.shared.delegate as! AppDelegate
        
        let context = guest.persistentContainer.viewContext
        
        let task = Task(context: context)
        
        if (textField.text?.isEmpty)!{
            let alert = UIAlertController(title: "Please Add task", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        else {
            
            if let name = textField.text{
                
                task.name = name
            }
            
            
        }
        
         task.smiley = needSmiley.isOn
        
        guest.saveContext()
        
        navigationController?.popViewController(animated: true)
        
        
    }
    
    
}
