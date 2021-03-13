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
    @IBOutlet private weak var popupView: UIView!

    var viewModel: GetHelpViewModelProtocol!
    var router: GetHelpRouterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
        setupContent()
        bindViewModel()

        viewModel.availableChanels.forEach {
            var chanelName = ""
            switch $0 {
            case .stories:
                chanelName = LocalizeKeys.Main.GetHelp.storiesTitle.localized()
            case .whatsapp:
                chanelName = LocalizeKeys.Main.GetHelp.whatsappTitle.localized()
            case .systemView:
                chanelName = LocalizeKeys.Main.GetHelp.otherOptionsTitle.localized()
            }
            let chanelSharingControl = SocialSharingOptionControl()
            chanelSharingControl
                .setUp(style:
                        SocialSharingOptionStyle(titleFont: StyleManager.General.Fonts.subHeaderFont,
                                                 titleColor: StyleManager.General.Colors.Text.mainColor),
                       chanel: $0,
                       title: chanelName,
                       image: #imageLiteral(resourceName: "pointsImage"))
            chanelSharingControl.addTarget(self, action: #selector(didTapOnSharingAction(_:)), for: .touchUpInside)
            socialSharingOptionsStackView.addArrangedSubview(chanelSharingControl)
        }
    }

    private func bindViewModel() {
        viewModel.didSelectSystemShare = { [weak self] in
            self?.openSystemShare()
        }
    }
    
    private func setupStyle() {
        view.backgroundColor = StyleManager.GetHelpScreen.backgroundColor
        popupView.layer.cornerRadius = Const.getHelpViewCornerRadius
        
        askFriendsLabel.font = StyleManager.General.Fonts.subtitleFont
        askFriendsLabel.textColor = StyleManager.General.Colors.Text.mainColor
    }

    var documentInteractionController: UIDocumentInteractionController!

    @objc private func didTapOnSharingAction(_ sender: SocialSharingOptionControl) {
        viewModel.didSelectHelpChanel(sender.socialSharingChanel)
    }
    
    private func setupContent() {
        askFriendsLabel.text = LocalizeKeys.Main.GetHelp.askFriendsTitle.localized()
    }

    private func openSystemShare() {
        let activityController = UIActivityViewController(
            activityItems: ["viewModel.question"],
            applicationActivities: nil)
        activityController.completionWithItemsHandler = {(activityType,
                                                          completed,
                                                          returnedItems,
                                                          activityError) -> Void in
            if let activity = activityType, completed {
                //TODO: report analytics
            }
        }
        self.present(activityController, animated: true)
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
