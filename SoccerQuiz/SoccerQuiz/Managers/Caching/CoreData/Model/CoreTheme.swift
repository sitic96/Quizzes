//
//  CoreTheme.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/18/21.
//

import Foundation
import CoreData

@objc class CoreTheme: NSManagedObject {
    private static let entityName = "CoreTheme"

    init(from theme: Theme, context: NSManagedObjectContext) throws {
        guard let entityDescriptor =
                NSEntityDescription.entity(forEntityName: CoreTheme.entityName,
                                           in: context) else {
            throw CoreDataError.cantInitEnity(CoreTheme.entityName)
        }
        super.init(entity: entityDescriptor, insertInto: context)
        self.id = Int16(theme.id)
        self.isAvailable = theme.isAvailable
        self.name = theme.name
    }
}
