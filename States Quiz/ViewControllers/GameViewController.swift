//
//  GameViewController.swift
//  States Quiz
//
//  Created by Kurbatov Artem on 10.11.2022.
//

import UIKit
import SnapKit

class GameViewController: UIViewController {
    
    private var gameTitle = UILabel()
    private var mapView = UIImageView()
    
    private var answersCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "answerCell")
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
    
    private func configureTitle() {
        
        view.addSubview(gameTitle)
       
        gameTitle.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.centerX.equalToSuperview()
        }
        
        gameTitle.textAlignment = .center
        gameTitle.numberOfLines = 0
        gameTitle.text = "Game"
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
    

}

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = answersCollection.dequeueReusableCell(withReuseIdentifier: "answerCell", for: indexPath)
        cell.backgroundColor = .cyan
        #warning("configure cells")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width * 0.45
        let height = collectionView.frame.height * 0.20
        
        return CGSize(width: width, height: height)
    }
}