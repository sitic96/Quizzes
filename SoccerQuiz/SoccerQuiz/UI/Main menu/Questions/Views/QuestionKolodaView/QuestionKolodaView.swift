//
//  QuestionKolodaView.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/28/21.
//

import UIKit

class QuestionKolodaView: UIView {
    @IBOutlet private weak var overlayView: UIView!
    @IBOutlet private weak var topContentView: TopContentView!
    @IBOutlet private weak var bottomContentView: BottomContentView!

    private func setupGradient() {
        let colorTop =  StyleManager.General.Colors.gradientStartColor.cgColor
        let colorBottom = StyleManager.General.Colors.gradientFinishColor.cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint =  CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bounds

        layer.insertSublayer(gradientLayer, at: 0)
    }

    func setup(for question: Question) {
        setupGradient()
        overlayView.backgroundColor =
            StyleManager.General.Colors.mainColor
        switch question.topContent {
        case .text(let content):
            let style = TopContentTextStyle(font: StyleManager.General.Fonts.subtitleFont,
                                            textColor: StyleManager.General.Colors.Text.whiteColor)
            topContentView.setup(for: .text(style: style, text: content.data))
        case .image(let content):
            topContentView.setup(for: .image(imageURLString: content.data))
        }

        switch question.bottomContent {
        case .dropBox(let options):
            break
        case .options(let options):
            let style = BottomContentTextStyle(font: StyleManager.General.Fonts.semibolMainFont,
                                               textColor: StyleManager.General.Colors.mainColor)
            bottomContentView.setup(type: .options(style: style), options: options)
        }
    }

    func removeOverlayView() {
        overlayView.isHidden = true
    }
}
