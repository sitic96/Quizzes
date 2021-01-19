//
//  CoreOption.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/19/21.
//

import Foundation
import CoreData

@objc class CoreOption: NSManagedObject {
    private static let entityName = "CoreOption"

    init(from option: Option, into context: NSManagedObjectContext) throws {
        guard let entityDesc = NSEntityDescription.entity(forEntityName: CoreOption.entityName, in: context) else {
            throw CoreDataError.cantInitEnity(CoreOption.entityName)
        }
        super.init(entity: entityDesc, insertInto: context)
        self.id = Int32(option.id)
        self.title = option.title
        self.type = option.type.rawValue
    }
}
