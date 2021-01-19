//
//  QuizesViewController.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/17/21.
//

import UIKit
import Localize_Swift

class QuizzesViewController: UIViewController {
    @IBOutlet private weak var appTitleLabel: UILabel!
    @IBOutlet private weak var appLogoImageView: UIImageView!
    @IBOutlet private weak var ballImageView: UIImageView!
    @IBOutlet private weak var ballsNumberLabel: UILabel!
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
        view.backgroundColor = StyleManager.MainScreen.backgroundColor

        appTitleLabel.textColor = StyleManager.General.Colors.mainColor
        appTitleLabel.font = StyleManager.General.Fonts.titleFont

        ballsNumberLabel.textColor = StyleManager.General.Colors.Text.mainColor
        ballsNumberLabel.font = StyleManager.General.Fonts.titleFont

        selectThemeLabel.textColor = StyleManager.General.Colors.Text.mainColor
        selectThemeLabel.font = StyleManager.General.Fonts.titleFont
    }

    private func setupView() {
        appTitleLabel.text = viewModel.appTitle.localized()
        appLogoImageView.image = #imageLiteral(resourceName: "logo_ball")
        ballImageView.image = #imageLiteral(resourceName: "pointsImage.png")
        ballsNumberLabel.text = "\(viewModel.pointsNumber)"
    }

    private func localize() {
        selectThemeLabel.text = LocalizeKeys.Main.Quizes.selectThemeTitle.localized()
    }
}
