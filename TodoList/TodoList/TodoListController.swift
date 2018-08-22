//
//  TodoListController.swift
//  TodoList
//
//  Created by Serényi  Zsófia on 2018. 08. 21..
//  Copyright © 2018. Serényi  Zsófia. All rights reserved.
//

import UIKit
import CoreData

class TodoListController: UITableViewController {
    
    let managedObjectContext = CoreDataStack().managedObjectContext
    lazy var dataSource: DataSourse = {
        return DataSourse(tableView: self.tableView, context: self.managedObjectContext)
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
    }

    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newItem" {
            let navigationController = segue.destination as! UINavigationController
            let addTaskController = navigationController.topViewController as! AddTaskController
            
            addTaskController.managedObjectContext = self.managedObjectContext
        } else if segue.identifier == "showDetail" {
            guard let detailVC = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else { return }
            let item = dataSource.object(at: indexPath)
            detailVC.item = item
            detailVC.context = self.managedObjectContext
        }
        
        
    }
}


