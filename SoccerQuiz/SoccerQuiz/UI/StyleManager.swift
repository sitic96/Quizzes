//
//  StyleManager.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/17/21.
//

import UIKit

struct StyleManager {
    struct General {
        struct Colors {
            static let mainColor = #colorLiteral(red: 0.9058823529, green: 0.3921568627, blue: 0.3176470588, alpha: 1)
            static let gradientStartColor = #colorLiteral(red: 0.8901960784, green: 0.462745098, blue: 0.3411764706, alpha: 1)
            static let gradientFinishColor = #colorLiteral(red: 0.8588235294, green: 0.4, blue: 0.3411764706, alpha: 1)

            struct Text {
                static let placeholderColor = #colorLiteral(red: 0.8352941176, green: 0.8470588235, blue: 0.8823529412, alpha: 1)
                static let mainColor = #colorLiteral(red: 0.05882352941, green: 0.06666666667, blue: 0.1058823529, alpha: 1)
                static let whiteColor = UIColor.white
            }
        }

        struct Fonts {
            static let titleFont = UIFont(name: "MontserratAlternates-Regular",
                                          size: 24.0)!
            static let placeholderFont = UIFont(name: "MontserratAlternates-Thin",
                                                size: 12.0)!
            static let mainFont = UIFont(name: "MontserratAlternates-Light",
                                         size: 16.0)!
        }
    }
}
