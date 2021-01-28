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
    @IBOutlet private weak var pointsImageView: UIImageView!
    @IBOutlet private weak var pointsLabel: UILabel!


    func setupContent(logoImage: UIImage, title: String,
                      pointsLogo: UIImage, pointsNumber: String) {
        logoImageView.image = logoImage
        selectQuizLabel.text = title
        pointsImageView.image = pointsLogo
        pointsLabel.text = pointsNumber
    }

    func setupStyle(selectQuizFont: UIFont,
                    selectQuizTextColor: UIColor,
                    pointsFont: UIFont,
                    pointsTextColor: UIColor) {
        selectQuizLabel.font = selectQuizFont
        selectQuizLabel.textColor = selectQuizTextColor
        pointsLabel.font = pointsFont
        pointsLabel.textColor = pointsTextColor
    }
}
