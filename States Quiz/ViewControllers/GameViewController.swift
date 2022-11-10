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
        return collection
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setUpTitle()
        setUpMap()
    }
    
    private func setUpTitle() {
        
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
    
    private func setUpMap() {
        
        view.addSubview(mapView)
        
        mapView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.4)
            make.width.equalToSuperview()
            make.top.equalTo(gameTitle.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        mapView.image = UIImage(named: "test")
    }
    

}
