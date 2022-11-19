//
//  GameViewController.swift
//  States Quiz
//
//  Created by Kurbatov Artem on 10.11.2022.
//

import UIKit
import SnapKit

class GameViewController: UIViewController {
    
    #warning("Add activity view controller after the game ends to share user's result")
    #warning("Dark/light modes color conflict")
    #warning("Add image animations")
    
    private var gameTitle = UILabel()
    private var mapView = UIImageView()
    
    private var model = ContentModel()
    private var currentQuestionIndex = 0
    private var lifeCount = 4
    
    private var selectedCellPaths = Set<IndexPath>()
    
    private var answersCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(AnswerCollectionViewCell.self, forCellWithReuseIdentifier: "answerCell")
        return collection
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        answersCollection.delegate = self
        answersCollection.dataSource = self
        
        // configure views
        configureTitle()
        configureMap()
        configureCollection()
    }
    
    
    // MARK: - Configure views and set constraints
    
    private func configureTitle() {
        
        view.addSubview(gameTitle)
        
        gameTitle.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.centerX.equalToSuperview()
        }
        
        gameTitle.textAlignment = .center
        gameTitle.numberOfLines = 0
        //gameTitle.text = "Game"
        gameTitle.text = "life count \(lifeCount)"
    }
    
    private func configureMap() {
        
        view.addSubview(mapView)
        
        mapView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.4)
            make.width.equalToSuperview()
            make.top.equalTo(gameTitle.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        mapView.image = UIImage(named: "test")
    }
    
    private func configureCollection() {
        
        view.addSubview(answersCollection)
        
        answersCollection.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.bottom.equalToSuperview().offset(-20)
            make.height.equalToSuperview().multipliedBy(0.35)
        }
    }
    
    // MARK: - Game state management
    
    private func displayNextQuestion() {
        currentQuestionIndex += 1
        model.quiz[currentQuestionIndex].answers.shuffle()
        
        // disappear and appear animation
        UIView.animate(withDuration: 0.4, delay: 0.2) {
            self.answersCollection.alpha = 0
        } completion: { _ in
            self.answersCollection.reloadData()
            UIView.animate(withDuration: 0.6, delay: 0) {
                self.answersCollection.alpha = 1
            }
        }
    }
    
    func restartGame() {
        currentQuestionIndex = 0
        model.quiz.shuffle()
        lifeCount = 4
        gameTitle.text = "life count \(lifeCount)"
        enableCellsInteraction()
        answersCollection.reloadData()
    }
    
    private func enableCellsInteraction() {
        for path in selectedCellPaths {
            answersCollection.cellForItem(at: path)?.isUserInteractionEnabled = true
        }
    }
}


extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Cell configuration
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = answersCollection.dequeueReusableCell(withReuseIdentifier: "answerCell", for: indexPath) as? AnswerCollectionViewCell {
            cell.backgroundColor = .systemBackground
            cell.configureCell(text: model.quiz[currentQuestionIndex].answers[indexPath.row])
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    // MARK: - Cell size configuration
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width * 0.45
        let height = collectionView.frame.height * 0.25
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
    // MARK: - Next question navigation
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCell = collectionView.cellForItem(at: indexPath)
        
        // disable cell to prevent user from selecting one cell multiple times
        selectedCell?.isUserInteractionEnabled = false
        selectedCellPaths.insert(indexPath)
        
        // if answer is correct
        if model.quiz[currentQuestionIndex].answers[indexPath.row] == model.quiz[currentQuestionIndex].correctAnswer {
            
            selectedCell?.backgroundColor = .systemGreen
            // if it wasn't the last question
            if model.hasNext(currentIndex: currentQuestionIndex) {
                
                displayNextQuestion()
                enableCellsInteraction()
            }
            // if it was the last question present result alert
            else {
                //let alert = model.createResultAlert(title: "Congratulations!", numberOfCorrectAnswers: currentQuestionIndex+1, sender: self)
                let alert = AlertViewController(resultText: "Congratulations!", numCorrect: currentQuestionIndex+1, sender: self)
                alert.modalPresentationStyle = .overFullScreen
                present(alert, animated: true)
            }
        }
        // if answer is wrong
        else {
            lifeCount -= 1
            gameTitle.text = "life count \(lifeCount)"
            
            if lifeCount < 1 {
                
               // let alert = model.createResultAlert(title: "Oops...", numberOfCorrectAnswers: currentQuestionIndex, sender: self)
                let alert = AlertViewController(resultText: "Oops...", numCorrect: currentQuestionIndex, sender: self)
                alert.modalPresentationStyle = .overFullScreen
                present(alert, animated: true)
            }
            selectedCell?.backgroundColor = .systemRed
        }
    }
}
