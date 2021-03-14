//
//  QuizesViewController.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/17/21.
//

import UIKit
import Localize_Swift

enum ShowQuizzesViewState {
    case showAll
    case hideFinished
}

class QuizzesViewController: UIViewController {
    @IBOutlet private weak var quizzesCollectionView: UICollectionView!

    var viewModel: QuizesViewModelProtocol!
    var router: QuizzesRouterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.backBarButtonItem =
            UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        setupNavigationTileStyle(
            NavigationTitleStyle(foregroundColor: StyleManager.General.Colors.mainColor,
                                 font: StyleManager.General.Fonts.subtitleFont,
                                 tintColor: StyleManager.General.Colors.mainColor))
    }

    private func setupStyle() {
        view.backgroundColor = StyleManager.MainScreen.backgroundColor
    }

    private func setupView() {
        title = viewModel.appTitle.localized()
    }
}

// MARK: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout

extension QuizzesViewController: UICollectionViewDelegate, UICollectionViewDataSource,
                                 UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let reusableView = collectionView
                .dequeueReusableSupplementaryView(ofKind: kind,
                                                  withReuseIdentifier: QuizzesCollectionReusableView.identifier,
                                                  for: indexPath) as? QuizzesCollectionReusableView else {
            return UICollectionReusableView()
        }
        reusableView.setupContent(logoImage: #imageLiteral(resourceName: "logo_ball"),
                                  title: LocalizeKeys.Main.Quizes.selectThemeTitle.localized(),
                                  pointsLogo: #imageLiteral(resourceName: "pointsImage.png"),
                                  pointsNumber: "\(viewModel.pointsNumber)")
        reusableView.setupStyle(selectQuizFont: StyleManager.General.Fonts.titleFont,
                                selectQuizTextColor: StyleManager.General.Colors.Text.mainColor,
                                pointsFont: StyleManager.General.Fonts.titleFont,
                                pointsTextColor: StyleManager.General.Colors.Text.mainColor)
        return reusableView
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return viewModel.allQuizzes.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
                .dequeueReusableCell(withReuseIdentifier: QuizCollectionViewCell.identifier,
                                     for: indexPath) as? QuizCollectionViewCell else {
            return UICollectionViewCell()
        }
        let quiz = viewModel.allQuizzes[indexPath.item]

        var overlayColor = UIColor.clear
        var textColor = UIColor.clear

        switch quiz.availabilityStatus {
        case .available, .started:
            overlayColor = StyleManager.MainScreen.availableOverlayColor
            textColor = StyleManager.General.Colors.Text.mainColor
        case .finished:
            overlayColor = StyleManager.MainScreen.finishedOverlayColor
            textColor = StyleManager.General.Colors.Text.whiteColor
        case .notAvailable:
            overlayColor = StyleManager.MainScreen.notAvailableOverlayColor
            textColor = StyleManager.General.Colors.Text.whiteColor
        }

        cell.setupContent(image: #imageLiteral(resourceName: "pointsImage"), name: quiz.title)
        cell.setupStyle(titleLabelFont: StyleManager.General.Fonts.subtitleFont,
                        titleLabelTextColor: textColor,
                        overlayColor: overlayColor)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - Const.quizzesCellSpacing) / 2
        return CGSize(width: width, height: width * Const.cellHeightToWidthRatio)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Const.quizzesCellSpacing
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        router.goToDetails(of: viewModel.allQuizzes[indexPath.item])
    }
}

fileprivate extension Const {
    static let cellHeightToWidthRatio: CGFloat = 0.8
    static let quizzesCellSpacing: CGFloat = 15.0
}
