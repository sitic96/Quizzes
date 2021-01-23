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
              availabilityStatus: .finished),
         Quiz(id: 1, title: "[FINISHED] First quiz",
              description: "I'm your first quiz",
              imageURLString: "",
              availabilityStatus: .finished),
         Quiz(id: 2, title: "First quiz with long name",
              description: "I'm your first quiz and my name is real long",
              imageURLString: "",
              availabilityStatus: .available),
         Quiz(id: 3, title: "First quiz",
              description: "I'm your first quiz",
              imageURLString: "",
              availabilityStatus: .available),
         Quiz(id: 4, title: "First quiz",
              description: "I'm your first quiz",
              imageURLString: "",
              availabilityStatus: .available),
         Quiz(id: 5, title: "First quiz",
              description: "I'm your first quiz",
              imageURLString: "",
              availabilityStatus: .started),
         Quiz(id: 6, title: "First quiz",
              description: "I'm your first quiz",
              imageURLString: "",
              availabilityStatus: .started),
         Quiz(id: 7, title: "First quiz",
              description: "I'm your first quiz",
              imageURLString: "",
              availabilityStatus: .notAvailable),
         Quiz(id: 8, title: "First quiz",
              description: "I'm your first quiz",
              imageURLString: "",
              availabilityStatus: .notAvailable),
         Quiz(id: 9, title: "First quiz",
              description: "I'm your first quiz",
              imageURLString: "",
              availabilityStatus: .notAvailable),
         Quiz(id: 10, title: "First quiz",
              description: "I'm your first quiz",
              imageURLString: "",
              availabilityStatus: .notAvailable)
        ]
    }
}
