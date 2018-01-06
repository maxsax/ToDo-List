//
//  AddToDoViewController.swift
//  ToDo List
//
//  Created by Michael on 2018-01-05.
//  Copyright © 2018 Differential Consulting. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    // reference to previous screen's view controller
    var previousVC = TodoTableViewController()
    
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func addTap(_ sender: Any) {
        
        // gives access to the persistent container in the AppDelegate.swift
        // context is needed to initialize coreData objects (called Managed Object Context)
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let toDo = ToDoCoreData(entity: ToDoCoreData.entity(), insertInto: context)
        
            if let titleText = titleTextField.text {
                toDo.name = titleText
                toDo.important = importantSwitch.isOn
            }
            
            try? context.save()
            previousVC.tableView.reloadData()
            navigationController?.popViewController(animated: true)
            
        }
        
    }
    
    
}
