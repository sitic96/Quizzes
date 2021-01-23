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
    @IBOutlet private weak var ballImageView: UIImageView!
    @IBOutlet private weak var ballsNumberLabel: UILabel!
    @IBOutlet private weak var themesCollectionView: UICollectionView!

    var viewModel: QuizesViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
        setupView()
    }

    private func setupStyle() {
        view.backgroundColor = StyleManager.MainScreen.backgroundColor

        appTitleLabel.textColor = StyleManager.General.Colors.mainColor
        appTitleLabel.font = StyleManager.General.Fonts.titleFont

        ballsNumberLabel.textColor = StyleManager.General.Colors.Text.mainColor
        ballsNumberLabel.font = StyleManager.General.Fonts.titleFont
    }

    private func setupView() {
        appTitleLabel.text = viewModel.appTitle.localized()
        ballImageView.image = #imageLiteral(resourceName: "pointsImage.png")
        ballsNumberLabel.text = "\(viewModel.pointsNumber)"
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
                                  title: LocalizeKeys.Main.Quizes.selectThemeTitle.localized())
        reusableView.setupStyle(selectQuizFont: StyleManager.General.Fonts.titleFont,
                                selectQuizTextColor: StyleManager.General.Colors.Text.mainColor)
        return reusableView
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        viewModel.quizes.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
                .dequeueReusableCell(withReuseIdentifier: QuizCollectionViewCell.identifier,
                                     for: indexPath) as? QuizCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setupContent(image: #imageLiteral(resourceName: "pointsImage"), name: viewModel.quizes[indexPath.item].title)
        cell.setupStyle(titleLabelFont: StyleManager.General.Fonts.subtitleFont,
                        titleLabelTextColor: StyleManager.General.Colors.Text.whiteColor)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - Const.quizzesCellSpacing) / 2
        return CGSize(width: width, height: width * 0.8)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Const.quizzesCellSpacing
    }
}

fileprivate extension Const {
    static let quizzesCellSpacing: CGFloat = 15.0
}
