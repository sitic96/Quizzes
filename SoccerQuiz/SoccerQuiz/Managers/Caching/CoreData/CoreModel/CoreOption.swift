//
//  CoreOption.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/19/21.
//

import Foundation
import CoreData

@objc(CoreOption)
class CoreOption: NSManagedObject {
    static let entityName = "CoreOption"

    public required convenience init(from option: Option, into context: NSManagedObjectContext) throws {
        guard let entityDesc = NSEntityDescription.entity(forEntityName: CoreOption.entityName, in: context) else {
            throw CoreDataError.cantInitEnity(CoreOption.entityName)
        }
        self.init(entity: entityDesc, insertInto: context)
        self.id = Int32(option.id)
        self.title = option.title
        self.type = option.type.rawValue
    }

    func toOption() -> Option? {
        guard let type = OptionType(rawValue: self.type ?? ""),
              let title = self.title else {
            return nil
        }
        return Option(id: Int(self.id),
                      type: type,
                      title: title)
    }
}
