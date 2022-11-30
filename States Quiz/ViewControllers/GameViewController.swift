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
    
    private let mapView = UIImageView()
    
    private let statuesStack = UIStackView()
    private var statues = [UIImageView]()
    private let statue1 = UIImageView()
    private let statue2 = UIImageView()
    private let statue3 = UIImageView()
    private let statue4 = UIImageView()
    
    private let model = QuizModel()
    private var currentQuestionIndex = 0
    private var mistakeCounter = 0
    
    private var selectedCellPaths = Set<IndexPath>()
    
    private let answersCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(AnswerCollectionViewCell.self, forCellWithReuseIdentifier: "answerCell")
        return collection
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.title = "\(currentQuestionIndex+1) of \(model.quiz.count)"
        
        answersCollection.delegate = self
        answersCollection.dataSource = self
        
        // configure views
        setUpHearts()
        configureMap()
        configureCollection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.largeTitleDisplayMode = .never
    }
    
    
    // MARK: - Configure views and set constraints
    
    private func setUpHearts() {
        
        view.addSubview(statuesStack)
        statuesStack.axis = .horizontal
        statuesStack.distribution = .equalSpacing
        
        for statue in [statue1, statue2, statue3, statue4] {
            
            statuesStack.addArrangedSubview(statue)
            statues.append(statue)
            statue.image = UIImage(named: "statue")
            
            statue.snp.makeConstraints { make in
                make.width.height.equalTo(30)
            }
        }
        
        statuesStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalToSuperview().multipliedBy(0.35)
            make.height.equalTo(30)
        }
    }
    
    private func configureMap() {
        
        view.addSubview(mapView)
        
        mapView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.35)
            make.width.equalToSuperview()
            make.top.equalTo(statuesStack.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        
        updateMap()
    }
    
    private func updateMap() {
        mapView.image = UIImage(named: model.quiz[currentQuestionIndex].image)
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
                self.navigationItem.title = "\(self.currentQuestionIndex+1) of \(self.model.quiz.count)"
            }
        }
        updateMap()
    }
    
    func restartGame() {
        currentQuestionIndex = 0
        model.quiz.shuffle()
        mistakeCounter = 0
        for statue in statues {
            statue.alpha = 1
        }
        enableCellsInteraction()
        navigationItem.title = "\(currentQuestionIndex+1) of \(model.quiz.count)"
        answersCollection.reloadData()
        updateMap()
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
                
                let alert = model.createResultAlert(title: "Congratulations!", numberOfCorrectAnswers: currentQuestionIndex+1, sender: self)
                present(alert, animated: true)
            }
        }
        // if answer is wrong
        else {
            statues[mistakeCounter].alpha = 0
            mistakeCounter += 1
            
            if mistakeCounter >= 4 {

                let alert = model.createResultAlert(title: "Oops...!", numberOfCorrectAnswers: currentQuestionIndex, sender: self)
                present(alert, animated: true)
            }
            selectedCell?.backgroundColor = .systemRed
        }
    }
}
