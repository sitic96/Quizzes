//
//  QuestionKolodaView.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/28/21.
//

import UIKit

class QuestionKolodaView: UIView {
    @IBOutlet private weak var topContentView: TopContentView!
    @IBOutlet private weak var bottomContentView: BottomContentView!

    func setup(for question: Question) {
        switch question.topContent {
        case .text(let content):
            let style = TopContentTextStyle(font: StyleManager.General.Fonts.titleFont,
                                            textColor: StyleManager.General.Colors.Text.mainColor)
            topContentView.setup(for: .text(style: style, text: content.data))
        case .image(let content):
            topContentView.setup(for: .image(imageURLString: content.data))
        }

        switch question.bottomContent {
        case .dropBox(let options):
            break
        case .options(let options):
            let style = BottomContentTextStyle(font: StyleManager.General.Fonts.subHeaderFont,
                                               textColor: StyleManager.General.Colors.Text.mainColor)
            bottomContentView.setup(type: .options(style: style), options: options)
        }
    }
}
