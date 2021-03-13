//
//  QuestionsViewModel.swift
//  SoccerQuiz
//
//  Created by Sitora Guliamova on 1/28/21.
//

import Foundation

protocol QuestionsViewModelProtocol {
    var quizName: String { get }
    var questions: [Question] { get }
    var questionsWithStatus: [QuizQuestion] { get }
    var currentQuestionIndex: Int { get }
    var currentQuestion: Question { get }

    var didSelectAnswer: (() -> Void)? { get set }
    var didChangeSelectedQuestion: ((_ changedQuestionsIndexes: [Int]) -> Void )? { get set }

    func didSelectAnswer(at index: Int)
    func didSwipe(from index: Int)
}

class QuestionsViewModel {
    private let quiz: Quiz
    private var selectedQuestionIndex: Int {
        didSet {
            didChangeSelectedQuestion?([oldValue, selectedQuestionIndex])
        }
    }

    var didSelectAnswer: (() -> Void)?
    var didChangeSelectedQuestion: ((_ changedQuestionsIndexes: [Int]) -> Void )?

    init(quiz: Quiz, selectedQuestionIndex: Int) {
        self.quiz = quiz
        self.selectedQuestionIndex = selectedQuestionIndex
    }
}

extension QuestionsViewModel: QuestionsViewModelProtocol {
    var quizName: String {
        quiz.title
    }

    var questions: [Question] {
        quiz.questions.map { $0.question }
    }

    var questionsWithStatus: [QuizQuestion] {
        quiz.questions
    }

    var currentQuestionIndex: Int {
        selectedQuestionIndex
    }

    var currentQuestion: Question {
        quiz.questions[selectedQuestionIndex].question
    }

    func didSelectAnswer(at index: Int) {
        didSelectAnswer?()
        selectedQuestionIndex = selectedQuestionIndex + 1
    }

    func didSwipe(from index: Int) {
        selectedQuestionIndex = index + 1
    }
}
