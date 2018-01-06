//
//  ToDoViewController.swift
//  ToDo List
//
//  Created by Michael on 2018-01-05.
//  Copyright © 2018 Differential Consulting. All rights reserved.
//

import UIKit

class CompleteToDoViewController: UIViewController {

    var previousVC = TodoTableViewController()
    var selectedToDo = ToDo()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = selectedToDo.name
    }

    @IBAction func completeTapped(_ sender: Any) {
        var index = 0
        
        for toDo in previousVC.toDos {
            if toDo.name == selectedToDo.name && toDo.important == selectedToDo.important {
                previousVC.toDos.remove(at: index)
            }
            index += 1
        }
        
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
        
    }
    
    
}
