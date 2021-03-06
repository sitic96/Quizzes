//
//  WelcomeBackViewController.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/17/21.
//

import UIKit
import Localize_Swift

class WelcomeBackViewController: UIViewController {

    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var welcomeLabel: UILabel!

    var viewModel: WelcomeBackViewModelProtocol!
    var router: WelcomeBackRouterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
        welcomeLabel.text = String(format: viewModel.welcomeMessageLocalizeKey.localized(),
                                   viewModel.userName)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { [weak self] _ in
            self?.router.goToLoadingScreen()
        }
    }

    private func setupStyle() {
        logoImageView.image = StyleManager.WelcomeScreen.logoImageWithText
        welcomeLabel.font = StyleManager.General.Fonts.titleFont
    }
}
