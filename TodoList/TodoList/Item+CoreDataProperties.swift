//
//  Item+CoreDataProperties.swift
//  TodoList
//
//  Created by Serényi  Zsófia on 2018. 08. 21..
//  Copyright © 2018. Serényi  Zsófia. All rights reserved.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        let request = NSFetchRequest<Item>(entityName: "Item")
        request.sortDescriptors = [NSSortDescriptor(key: "text", ascending: true)]
        return request
    }

    @NSManaged public var text: String
    @NSManaged public var isCompleted: Bool

}
