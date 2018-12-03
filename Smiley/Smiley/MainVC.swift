//
//  MainVC.swift
//  Smiley
//
//  Created by Nirmal  on 25/12/17.
//  Copyright © 2017 Nirmal . All rights reserved.
//

import UIKit

class MainVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()

      tableView.delegate = self
      tableView.dataSource = self
      grabData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        grabData()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.name != nil{
            cell.textLabel?.text = "😀\(String(describing: task.name!))☺️"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      
        let guest = UIApplication.shared.delegate as! AppDelegate
        let context = guest.persistentContainer.viewContext
        
        if editingStyle == .delete{
            
            let task = tasks[indexPath.row]
            print(task)
            context.delete(task)
            guest.saveContext()
            grabData()
            tableView.reloadData()
            
        }
        
    }
    
    func grabData() {
        
        let guest = UIApplication.shared.delegate as! AppDelegate
        
        let context = guest.persistentContainer.viewContext
        do
        {
            tasks = try context.fetch(Task.fetchRequest())
        } catch{
            print("Error")
            
            
            
        }
    }
    
}
    
    
    
    
    


