//
//  CoreQuiz.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/18/21.
//

import Foundation
import CoreData

@objc class CoreQuiz: NSManagedObject {
    private static let entityName = "CoreQuiz"

    init(from quiz: Quiz, into context: NSManagedObjectContext) throws {
        guard let entityDescriptor = NSEntityDescription.entity(forEntityName: CoreQuiz.entityName,
                                                                in: context) else {
            throw CoreDataError.cantInitEnity(CoreQuiz.entityName)
        }
        super.init(entity: entityDescriptor, insertInto: context)
        self.id = Int16(quiz.id)
    }
}
