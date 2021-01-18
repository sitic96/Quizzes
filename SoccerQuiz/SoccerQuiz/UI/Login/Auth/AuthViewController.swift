//
//  AuthViewController.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/17/21.
//

import UIKit
import Localize_Swift

class AuthViewController: UIViewController {

    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var welcomeLabel: UILabel!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var textFieldUnderlineView: UIView!
    @IBOutlet private weak var goNextButton: UIButton!

    var viewModel: AuthViewModelProtocol!
    var router: AuthRouterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        textField.addTarget(self,
                            action: #selector(textFieldDidChange(_:)),
                            for: .editingChanged)
        goNextButton.isEnabled = false
        goNextButton.alpha = Const.nextButtonDisabledAlpha
        setupStyle()
        localize()
        bindViewModel()
        hideKeyboardWhenTappedAround()
    }

    private func bindViewModel() {
        viewModel.didSetNewName = { [weak self] in
            self?.router.goNext()
        }
    }

    private func setupStyle() {
        welcomeLabel.font = StyleManager.General.Fonts.titleFont
        welcomeLabel.textColor = StyleManager.General.Colors.Text.mainColor

        textFieldUnderlineView.backgroundColor = StyleManager.General.Colors.mainColor
        textField.font = StyleManager.General.Fonts.mainFont

        goNextButton.backgroundColor = StyleManager.General.Colors.mainColor
        goNextButton.setTitleColor(StyleManager.General.Colors.Text.whiteColor,
                                   for: .normal)
        goNextButton.titleLabel?.font = StyleManager.General.Fonts.mainFont
        goNextButton.layer.cornerRadius = Const.nextButtonCornerRadius
    }

    private func localize() {
        welcomeLabel.text = LocalizeKeys.Auth.welcomeMessage.localized()
        textField.placeholder = LocalizeKeys.Auth.namePlaceholder.localized()
        goNextButton.setTitle(LocalizeKeys.Auth.next.localized(),
                              for: .normal)
    }

    @objc private func textFieldDidChange(_ textField: UITextField) {
        goNextButton.isEnabled = !(textField.text?.isEmpty ?? true)
        goNextButton.alpha = !(textField.text?.isEmpty ?? true) ?
            Const.nextButtonEnabledAlpha : Const.nextButtonDisabledAlpha
    }

    @IBAction func didSelectNext(_ sender: Any) {
        viewModel.didSelectNext(with: textField.text)
    }
}

extension AuthViewController: UITextFieldDelegate {

}

fileprivate extension Const {
    static let nextButtonCornerRadius: CGFloat = 20.0
    static let nextButtonDisabledAlpha: CGFloat = 0.5
    static let nextButtonEnabledAlpha: CGFloat = 1.0
}
