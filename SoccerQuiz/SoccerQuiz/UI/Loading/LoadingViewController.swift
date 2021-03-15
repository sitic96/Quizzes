//
//  LoadingViewController.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 3/15/21.
//

import UIKit
import Localize_Swift

class LoadingViewController: UIViewController {
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!

    var viewModel: LoadingViewModelProtocol!
    var router: LoadingRouterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupStyle()
        viewModel.loadPreviews()
    }

    private func bindViewModel() {
        viewModel.didFinishLoading = { [weak self] result in
            switch result {
            case .success(let previews):
                self?.router.goToMainScreen(previews: previews)
                self?.activityIndicator.stopAnimating()
            case .failure:
                self?.presentAlert(with: LocalizeKeys.Loading.errorAlertMessage.localized(),
                                   title: LocalizeKeys.Loading.errorAlertTitle.localized(),
                                   actions:
                                    [AlertAction(title: LocalizeKeys.Loading.alertTryAgainTitle.localized(),
                                                 style: UIAlertAction.Style.default,
                                                 handler: {_ in
                                                    self?.viewModel.loadPreviews()
                                                 })])
            }
        }
    }

    private func setupStyle() {
        activityIndicator.color = StyleManager.General.Colors.mainColor
    }
}
