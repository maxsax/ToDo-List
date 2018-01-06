//
//  TodoTableViewController.swift
//  ToDo List
//
//  Created by Michael on 2018-01-05.
//  Copyright © 2018 Differential Consulting. All rights reserved.
//

import UIKit

class TodoTableViewController: UITableViewController {

    var toDos: [ToDoCoreData] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getToDos()
    }
    
    
    
    func getToDos() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataToDos = try? context.fetch(ToDoCoreData.fetchRequest()) as? [ToDoCoreData] {
                if let theToDos = coreDataToDos {
                    toDos = theToDos
                    tableView.reloadData()
                }
            }
        }
    }

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Configure the cell
        let toDo = toDos[indexPath.row]
        
        if let name = toDo.name {
            
            if toDo.important {
                cell.textLabel?.text = "❗️\(name)"
            } else {
                cell.textLabel?.text = toDo.name
            }
        }
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
        print("viewWillAppear")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // function is called regardless of which segue is called
        
        if let addVC = segue.destination as? AddToDoViewController {
            addVC.previousVC = self
        }
        
        if let completeVC = segue.destination as? CompleteToDoViewController {
            completeVC.previousVC = self
            
            if let toDo = sender as? ToDoCoreData {
                completeVC.selectedToDo = toDo
            }
        }
    }
 
    
}
