//
//  QuizzesCollectionReusableView.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/21/21.
//

import UIKit

class QuizzesCollectionReusableView: UICollectionReusableView {
    class var identifier: String {
        "QuizzesCollectionReusableView"
    }
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var selectQuizLabel: UILabel!

    func setupContent(logoImage: UIImage, title: String) {
        logoImageView.image = logoImage
        selectQuizLabel.text = title
    }

    func setupStyle(selectQuizFont: UIFont,
                            selectQuizTextColor: UIColor) {
        selectQuizLabel.font = selectQuizFont
        selectQuizLabel.textColor = selectQuizTextColor
    }
}
