//
//  QuizPreviewViewController.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 3/21/21.
//

import UIKit
import Kingfisher
import Localize_Swift

class QuizPreviewViewController: UIViewController {
    @IBOutlet private weak var quizImageView: UIImageView!
    @IBOutlet private weak var quizTitleLabel: UILabel!
    @IBOutlet private weak var quizDescriptionLabel: UILabel!
    @IBOutlet private weak var gradientView: UIView!
    @IBOutlet private weak var buyButton: UIButton!

    private var isFirstLayoutSubviews = true

    var viewModel: QuizPreviewViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        quizImageView.kf.setImage(with: URL(string: viewModel.quizPreview.imageURLString))
        quizTitleLabel.text = viewModel.quizPreview.title
        quizDescriptionLabel.text = viewModel.quizPreview.description

        if viewModel.isQuizAvailableToStart {
            buyButton.setTitle(LocalizeKeys.Main.QuizPreview.playQuizTitle.localized(),
                               for: .normal)
        } else {
            buyButton.setTitle(LocalizeKeys.Main.QuizPreview.buyQuizTitle.localized(),
                               for: .normal)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if isFirstLayoutSubviews {
            setupStyle()
            isFirstLayoutSubviews = false
        }
    }

    private func setupStyle() {
        quizTitleLabel.font = StyleManager.General.Fonts.titleFont
        quizTitleLabel.textColor = StyleManager.General.Colors.white

        quizDescriptionLabel.font = StyleManager.General.Fonts.mainFont
        quizDescriptionLabel.textColor = StyleManager.General.Colors.black

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor,
                                StyleManager.General.Colors.gradientStartColor.withAlphaComponent(0.6).cgColor,
                                StyleManager.General.Colors.gradientFinishColor.withAlphaComponent(0.9).cgColor]
        gradientLayer.locations = [0.3, 0.55, 1.0]
        gradientLayer.frame = gradientView.bounds
        gradientView.layer.insertSublayer(gradientLayer, at: 0)

        buyButton.backgroundColor = StyleManager.General.Colors.mainColor
        buyButton.setTitleColor(StyleManager.General.Colors.Text.whiteColor,
                                   for: .normal)
        buyButton.titleLabel?.font = StyleManager.General.Fonts.mainFont
        buyButton.layer.cornerRadius = Const.buyButtonCornerRadius
    }
}

fileprivate extension Const {
    static let buyButtonCornerRadius: CGFloat = 20.0
}
