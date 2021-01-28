//
//  QuestionCollectionViewCell.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/25/21.
//

import UIKit

class QuestionCollectionViewCell: UICollectionViewCell {
    class var identifier: String {
        "QuestionCollectionViewCell"
    }
    @IBOutlet private weak var bordersView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!

    func setupContent(title: String) {
        titleLabel.text = title
    }

    func setupStyle(borderWidth: CGFloat,
                    borderColor: UIColor,
                    titleLabelFont: UIFont,
                    titleLabelTextColor: UIColor) {
        bordersView.layer.borderWidth = borderWidth
        bordersView.layer.borderColor = borderColor.cgColor
        titleLabel.font = titleLabelFont
        titleLabel.textColor = titleLabelTextColor
    }
}
