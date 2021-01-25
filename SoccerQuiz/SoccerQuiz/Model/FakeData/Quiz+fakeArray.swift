//
//  Quiz+fakeArray.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/21/21.
//

import Foundation

extension Quiz {
    static func fakeArray() -> [Quiz] {
        [Quiz(id: 0, title: "[FINISHED] First quiz",
              description: "I'm your first quiz",
              imageURLString: "",
              availabilityStatus: .finished,
              questiona: Question.fakeArray()),
         Quiz(id: 1, title: "[FINISHED] First quiz",
              description: "I'm your first quiz",
              imageURLString: "",
              availabilityStatus: .finished,
              questiona: Question.fakeArray()),
         Quiz(id: 2, title: "First quiz with long name",
              description: "I'm your first quiz and my name is real long",
              imageURLString: "",
              availabilityStatus: .available,
              questiona: Question.fakeArray()),
         Quiz(id: 3, title: "First quiz",
              description: "I'm your first quiz",
              imageURLString: "",
              availabilityStatus: .available,
              questiona: Question.fakeArray()),
         Quiz(id: 4, title: "First quiz",
              description: "I'm your first quiz",
              imageURLString: "",
              availabilityStatus: .available,
              questiona: Question.fakeArray()),
         Quiz(id: 5, title: "First quiz",
              description: "I'm your first quiz",
              imageURLString: "",
              availabilityStatus: .started,
              questiona: Question.fakeArray()),
         Quiz(id: 6, title: "First quiz",
              description: "I'm your first quiz",
              imageURLString: "",
              availabilityStatus: .started,
              questiona: Question.fakeArray()),
         Quiz(id: 7, title: "First quiz",
              description: "I'm your first quiz",
              imageURLString: "",
              availabilityStatus: .notAvailable,
              questiona: Question.fakeArray()),
         Quiz(id: 8, title: "First quiz",
              description: "I'm your first quiz",
              imageURLString: "",
              availabilityStatus: .notAvailable,
              questiona: Question.fakeArray()),
         Quiz(id: 9, title: "First quiz",
              description: "I'm your first quiz",
              imageURLString: "",
              availabilityStatus: .notAvailable,
              questiona: Question.fakeArray()),
         Quiz(id: 10, title: "First quiz",
              description: "I'm your first quiz",
              imageURLString: "",
              availabilityStatus: .notAvailable,
              questiona: Question.fakeArray())
        ]
    }
}
