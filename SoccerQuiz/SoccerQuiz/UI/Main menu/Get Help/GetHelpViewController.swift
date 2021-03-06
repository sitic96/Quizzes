//
//  GetHelpViewController.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 2/9/21.
//

import UIKit
import Localize_Swift

class GetHelpViewController: UIViewController {
    @IBOutlet private weak var askFriendsLabel: UILabel!
    @IBOutlet private weak var socialSharingOptionsStackView: UIStackView!
    @IBOutlet private weak var otherOptionsLabel: UILabel!
    @IBOutlet private weak var pointsView: UIView!
    @IBOutlet private weak var popupView: UIView!
    
    var router: GetHelpRouterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
        setupContent()
        let storiesSharingView = SocialSharingOptionView()
        storiesSharingView.setUp(style: SocialSharingOptionStyle(titleFont: StyleManager.General.Fonts.subHeaderFont,
                                                   titleColor: StyleManager.General.Colors.Text.mainColor),
                   title: LocalizeKeys.Main.GetHelp.storiesTitle,
                   image: #imageLiteral(resourceName: "pointsImage"))
        let whatsappSharingView = SocialSharingOptionView()
        whatsappSharingView.setUp(style: SocialSharingOptionStyle(titleFont: StyleManager.General.Fonts.subHeaderFont,
                                                   titleColor: StyleManager.General.Colors.Text.mainColor),
                   title: LocalizeKeys.Main.GetHelp.whatsappTitle,
                   image: #imageLiteral(resourceName: "logo_ball"))
        socialSharingOptionsStackView.addArrangedSubview(storiesSharingView)
        socialSharingOptionsStackView.addArrangedSubview(whatsappSharingView)
    }
    
    private func setupStyle() {
        view.backgroundColor = StyleManager.GetHelpScreen.backgroundColor
        popupView.layer.cornerRadius = Const.getHelpViewCornerRadius
        
        askFriendsLabel.font = StyleManager.General.Fonts.subtitleFont
        askFriendsLabel.textColor = StyleManager.General.Colors.Text.mainColor
        
        otherOptionsLabel.font = StyleManager.General.Fonts.subtitleFont
        otherOptionsLabel.textColor = StyleManager.General.Colors.Text.mainColor
    }
    
    private func setupContent() {
        askFriendsLabel.text = LocalizeKeys.Main.GetHelp.askFriendsTitle.localized()
        otherOptionsLabel.text = LocalizeKeys.Main.GetHelp.otherOptionsTitle.localized()
    }
    
    @IBAction private func didSwipDown(_ sender: UITapGestureRecognizer) {
        router.close()
    }
    
    @IBAction private func didTapOnBackgroundView(_ sender: UITapGestureRecognizer) {
        router.close()
    }
}

extension GetHelpViewController: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                                  shouldReceive touch: UITouch) -> Bool {
        return touch.view == self.view
    }
}

fileprivate extension Const {
    static let getHelpViewCornerRadius: CGFloat = 15.0
}
