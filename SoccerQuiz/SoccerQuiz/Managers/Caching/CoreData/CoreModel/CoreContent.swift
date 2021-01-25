//
//  CoreContent.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/18/21.
//

import Foundation
import CoreData

@objc class CoreContent: NSManagedObject {
    private static var entityName = "CoreContent"

    init(from content: Content, into context: NSManagedObjectContext) throws {
        guard let entityDescriptor = NSEntityDescription.entity(forEntityName: CoreContent.entityName, in: context) else {
            throw CoreDataError.cantInitEnity(CoreContent.entityName)
        }
        super.init(entity: entityDescriptor, insertInto: context)
        self.id = Int32(content.id)
        self.data = content.data
    }
}
