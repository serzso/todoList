//
//  DataSource.swift
//  TodoList
//
//  Created by Serényi  Zsófia on 2018. 08. 21..
//  Copyright © 2018. Serényi  Zsófia. All rights reserved.
//

import UIKit
import CoreData

class DataSourse: NSObject, UITableViewDataSource {
    private let tableView: UITableView
    private let context: NSManagedObjectContext
    
    lazy var fetchedResultsController: TodoFetchedResultsController = {
        return TodoFetchedResultsController(managedObjectContext: self.context, tableView: self.tableView)
    }()
    
    init(tableView: UITableView, context: NSManagedObjectContext) {
        self.tableView = tableView
        self.context = context
    }
    
    func object(at indexPath: IndexPath) -> Item {
        return fetchedResultsController.object(at: indexPath)
    }
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = fetchedResultsController.sections?[section] else { return 0 }
        return section.numberOfObjects
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        
        return configureCell(cell, at: indexPath)
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let item = fetchedResultsController.object(at: indexPath)
        context.delete(item)
        context.saveChanges()
    }
    
    private func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) -> UITableViewCell {
        let item = fetchedResultsController.object(at: indexPath)
        cell.textLabel?.text = item.text
        
        return cell
    }
    
}
