//
//  CoreContent.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/18/21.
//

import Foundation
import CoreData

@objc(CoreContent)
class CoreContent: NSManagedObject {
    static var entityName = "CoreContent"

    public required convenience init(from content: Content, into context: NSManagedObjectContext) throws {
        guard let entityDescriptor = NSEntityDescription.entity(forEntityName: CoreContent.entityName, in: context) else {
            throw CoreDataError.cantInitEnity(CoreContent.entityName)
        }
        self.init(entity: entityDescriptor, insertInto: context)
        self.id = Int32(content.id)
        self.data = content.content
    }

    func toContent() -> Content {
        Content(id: Int(self.id), content: self.data ?? "")
    }
}
