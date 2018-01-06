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
        let toDo = ToDo()
        
        if let titleText = titleTextField.text {
            toDo.name = titleText
            toDo.important = importantSwitch.isOn
            
            previousVC.toDos.append(toDo)
            previousVC.tableView.reloadData()
            
            navigationController?.popViewController(animated: true)
            
        } else {
            // insufficent data to create a new todo
            
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
