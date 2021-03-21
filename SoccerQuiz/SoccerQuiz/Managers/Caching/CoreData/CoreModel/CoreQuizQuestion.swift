//
//  CoreQuizQuestion.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 3/21/21.
//

import Foundation
import CoreData

@objc(CoreQuizQuestion)
class CoreQuizQuestion: NSManagedObject {
    static let entityName = "CoreQuizQuestion"

    public required convenience init(from quizQuestion: QuizQuestion,
                                     quiz: Quiz,
                                     into context: NSManagedObjectContext) throws {
        guard let entityDesc = NSEntityDescription.entity(forEntityName: CoreQuizQuestion.entityName, in: context) else {
            throw CoreDataError.cantInitEnity(CoreQuizQuestion.entityName)
        }
        self.init(entity: entityDesc, insertInto: context)
        self.question = try CoreQuestion(from: quizQuestion.question, into: context)
        self.questionId = Int32(quizQuestion.question.id)
        self.status = quizQuestion.status.rawValue
        self.quizId = Int32(quiz.id)
        //self.quiz = try CoreQuiz(from: quiz, into: context)
    }

    func toQuizQuestion() -> QuizQuestion? {
        guard let question = self.question?.toQuestion(),
              let status = QuizQuestionStatus(rawValue: self.status ?? "") else {
            return nil
        }
        return QuizQuestion(question: question,
                            status: status)
    }
}
