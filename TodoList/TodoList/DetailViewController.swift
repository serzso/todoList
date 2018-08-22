//
//  DetailViewController.swift
//  TodoList
//
//  Created by Serényi  Zsófia on 2018. 08. 21..
//  Copyright © 2018. Serényi  Zsófia. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {

    var item: Item?
    var context: NSManagedObjectContext!
    
    @IBOutlet weak var detailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = item {
            detailTextField.text = item.text
        }
    }
    
    
    @IBAction func save(_ sender: Any) {
        if let item = item , let newtext = detailTextField.text {
                item.text = newtext
                context.saveChanges()
                navigationController?.popViewController(animated: true)
            }
        }
    
    
    
    
    @IBAction func deleteItem(_ sender: Any) {
        if let item = item {
            context.delete(item)
            context.saveChanges()
            navigationController?.popViewController(animated: true)
        }
    }
    

}
