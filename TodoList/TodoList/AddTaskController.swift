//
//  AddTaskController.swift
//  TodoList
//
//  Created by Serényi  Zsófia on 2018. 08. 21..
//  Copyright © 2018. Serényi  Zsófia. All rights reserved.
//

import UIKit
import CoreData

class AddTaskController: UIViewController {
    
    var managedObjectContext: NSManagedObjectContext!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func save(_ sender: Any) {
        guard let text = textField.text, !text.isEmpty else { return }
        let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: managedObjectContext) as! Item
        item.text = text
        managedObjectContext.saveChanges()
        
        dismiss(animated: true, completion: nil)
    }
    
}
