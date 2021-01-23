//
//  QuizCollectionViewCell.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/21/21.
//

import UIKit

class QuizCollectionViewCell: UICollectionViewCell {
    class var identifier: String {
        "QuizCollectionViewCell"
    }

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var quizNameLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        quizNameLabel.text = ""
    }

    func setupContent(image: UIImage, name: String) {
        imageView.image = image
        quizNameLabel.text = name
    }

    func setupStyle(titleLabelFont: UIFont,
                    titleLabelTextColor: UIColor) {
        quizNameLabel.font = titleLabelFont
        quizNameLabel.textColor = titleLabelTextColor
    }
}
