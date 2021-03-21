//
//  CoreQuiz.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/18/21.
//

import Foundation
import CoreData

@objc(CoreQuiz)
class CoreQuiz: NSManagedObject {
    static let entityName = "CoreQuiz"

    public required convenience init(from quiz: Quiz, into context: NSManagedObjectContext) throws {
        guard let entityDescriptor = NSEntityDescription.entity(forEntityName: CoreQuiz.entityName,
                                                                in: context) else {
            throw CoreDataError.cantInitEnity(CoreQuiz.entityName)
        }
        self.init(entity: entityDescriptor, insertInto: context)
        self.id = Int32(quiz.id)
        self.title = quiz.title
        self.imageURL = quiz.imageURLString
        self.subtitle = quiz.description
        self.availabilityStatus = quiz.availabilityStatus.rawValue
        self.questions = try NSSet(array: quiz.questions
                                .map { try CoreQuizQuestion(from: $0, quiz: quiz,
                                                            into: context) })
    }

    func toQuiz() -> Quiz? {
        guard let title = self.title,
              let desc = self.subtitle,
              let imageURLString = self.imageURL,
              let status = AvailabilityStatus(rawValue: self.availabilityStatus ?? ""),
              let questions = (self.questions?
                                .compactMap { ($0 as? CoreQuizQuestion)?.toQuizQuestion() }) else {
            return nil
        }
        return Quiz(id: Int(self.id),
                    title: title,
                    description: desc,
                    imageURLString: imageURLString,
                    availabilityStatus: status,
                    questions: questions)
    }
}
