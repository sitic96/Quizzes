//
//  Quiz+fakeArray.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/21/21.
//

import Foundation

extension Quiz {
    static func fakeArray() -> [Quiz] {
        return [Quiz(id: 0, title: "[FINISHED] First quiz",
                     description: "I'm your first quiz",
                     imageURLString: "",
                     availabilityStatus: .finished,
                     questions: Question.fakeArray()
                        .map { QuizQuestion(question: $0,
                                            status: QuizQuestionStatus.allCases.randomElement()!) }),
                Quiz(id: 1, title: "[FINISHED] First quiz",
                     description: "I'm your first quiz",
                     imageURLString: "",
                     availabilityStatus: .finished,
                     questions: Question.fakeArray()
                        .map { QuizQuestion(question: $0,
                                            status: QuizQuestionStatus.allCases.randomElement()!) }),
                Quiz(id: 2, title: "First quiz with long name",
                     description: "I'm your first quiz and my name is real long. Really looooong name",
                     imageURLString: "",
                     availabilityStatus: .available,
                     questions: Question.fakeArray()
                        .map { QuizQuestion(question: $0,
                                            status: QuizQuestionStatus.allCases.randomElement()!) }),
                Quiz(id: 3, title: "First quiz",
                     description: "I'm your first quiz",
                     imageURLString: "",
                     availabilityStatus: .available,
                     questions: Question.fakeArray()
                        .map { QuizQuestion(question: $0,
                                            status: QuizQuestionStatus.allCases.randomElement()!) }),
                Quiz(id: 4, title: "First quiz",
                     description: "I'm your first quiz",
                     imageURLString: "",
                     availabilityStatus: .available,
                     questions: Question.fakeArray()
                        .map { QuizQuestion(question: $0,
                                            status: QuizQuestionStatus.allCases.randomElement()!) }),
                Quiz(id: 5, title: "First quiz",
                     description: "I'm your first quiz",
                     imageURLString: "",
                     availabilityStatus: .started,
                     questions: Question.fakeArray()
                        .map { QuizQuestion(question: $0,
                                            status: QuizQuestionStatus.allCases.randomElement()!) }),
                Quiz(id: 6, title: "First quiz",
                     description: "I'm your first quiz",
                     imageURLString: "",
                     availabilityStatus: .started,
                     questions: Question.fakeArray()
                        .map { QuizQuestion(question: $0,
                                            status: QuizQuestionStatus.allCases.randomElement()!) }),
                Quiz(id: 7, title: "First quiz",
                     description: "I'm your first quiz",
                     imageURLString: "",
                     availabilityStatus: .notAvailable,
                     questions: Question.fakeArray()
                        .map { QuizQuestion(question: $0,
                                            status: QuizQuestionStatus.allCases.randomElement()!) }),
                Quiz(id: 8, title: "First quiz",
                     description: "I'm your first quiz",
                     imageURLString: "",
                     availabilityStatus: .notAvailable,
                     questions: Question.fakeArray()
                        .map { QuizQuestion(question: $0,
                                            status: QuizQuestionStatus.allCases.randomElement()!) }),
                Quiz(id: 9, title: "First quiz",
                     description: "I'm your first quiz",
                     imageURLString: "",
                     availabilityStatus: .notAvailable,
                     questions: Question.fakeArray()
                        .map { QuizQuestion(question: $0,
                                            status: QuizQuestionStatus.allCases.randomElement()!) }),
                Quiz(id: 10, title: "First quiz",
                     description: "I'm your first quiz",
                     imageURLString: "",
                     availabilityStatus: .notAvailable,
                     questions: Question.fakeArray()
                        .map { QuizQuestion(question: $0,
                                            status: QuizQuestionStatus.allCases.randomElement()!) })
        ]
    }
}
