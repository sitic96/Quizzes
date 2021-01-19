//
//  QuizesViewController.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/17/21.
//

import UIKit
import Localize_Swift

class QuizesViewController: UIViewController {
    @IBOutlet private weak var ballImageView: UIImageView!
    @IBOutlet private weak var ballsNumberLabel: UILabel!
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var selectThemeLabel: UILabel!
    @IBOutlet private weak var themesCollectionView: UICollectionView!

    var viewModel: QuizesViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
        setupView()
        localize()
    }

    private func setupStyle() {
        ballsNumberLabel.textColor = StyleManager.General.Colors.Text.mainColor
        ballsNumberLabel.font = StyleManager.General.Fonts.mainFont

        selectThemeLabel.textColor = StyleManager.General.Colors.Text.mainColor
        selectThemeLabel.font = StyleManager.General.Fonts.titleFont
    }

    private func setupView() {
        ballsNumberLabel.text = "\(viewModel.pointsNumber)"
    }

    private func localize() {
        selectThemeLabel.text = LocalizeKeys.Main.Quizes.selectThemeTitle.localized()
    }
}
