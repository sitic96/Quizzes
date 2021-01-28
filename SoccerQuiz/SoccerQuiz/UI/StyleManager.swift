//
//  StyleManager.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/17/21.
//

import UIKit

struct StyleManager {
    private static let backgroundColor = #colorLiteral(red: 0.937254902, green: 0.9529411765, blue: 0.968627451, alpha: 1)
    struct General {
        struct Colors {
            static let mainColor = #colorLiteral(red: 0.9058823529, green: 0.3921568627, blue: 0.3176470588, alpha: 1)
            static let gradientStartColor = #colorLiteral(red: 0.8901960784, green: 0.462745098, blue: 0.3411764706, alpha: 1)
            static let gradientFinishColor = #colorLiteral(red: 0.8588235294, green: 0.4, blue: 0.3411764706, alpha: 1)

            struct Text {
                static let placeholderColor = #colorLiteral(red: 0.8352941176, green: 0.8470588235, blue: 0.8823529412, alpha: 1)
                static let darkGreyColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                static let mainColor = #colorLiteral(red: 0.05882352941, green: 0.06666666667, blue: 0.1058823529, alpha: 1)
                static let whiteColor = UIColor.white
            }
        }

        struct Fonts {
            static let titleFont = UIFont(name: "MontserratAlternates-Bold",
                                          size: 28.0)!
            static let subtitleFont = UIFont(name: "MontserratAlternates-SemiBold",
                                          size: 20.0)!
            static let placeholderFont = UIFont(name: "MontserratAlternates-Thin",
                                                size: 12.0)!
            static let mainFont = UIFont(name: "MontserratAlternates-Light",
                                         size: 18.0)!
            static let subHeaderFont = UIFont(name: "MontserratAlternates-Light",
                                              size: 16.0)!
        }
    }

    struct MainScreen {
        static let backgroundColor = StyleManager.backgroundColor
        static let finishedOverlayColor = #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 0.5)
        static let availableOverlayColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7)
        static let notAvailableOverlayColor = #colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 0.7)
    }

    struct QuizDetailsScreen {
        static let backgroundColor = StyleManager.backgroundColor
        static let answeredBorderColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
        static let notFinishedBorderColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        static let notStartedBorderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }

    struct WelcomeScreen {
        static let logoImageWithText = #imageLiteral(resourceName: "logo")
    }
}
