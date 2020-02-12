//
//  AttractionView.swift
//  Czaple
//
//  Created by Filip Trzaska on 06/04/2019.
//  Copyright © 2019 Filip Trzaska. All rights reserved.
//

import UIKit
import AVKit

class AttractionView: ViewController {
    
    var attraction = Attraction()
    private let boardAlert: BoardAlerting
    private let url = URL(string: "https://rowery.pielgrzymka.biz")
    var player: AVAudioPlayer?
    
    let geoButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.setTitle(NSLocalizedString("Przejdź do tablic", comment: ""), for: .normal)
        button.setTitleColor(UIColor(red:0.94, green:0.78, blue:0.6, alpha:1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        button.titleLabel?.layer.masksToBounds = false
        button.layer.borderColor = UIColor(red: 71.0/255.0, green: 48.0/255.0, blue: 29.0/255.0, alpha: 1.0).cgColor
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 28
        button.backgroundColor = UIColor(red: 184.0/255.0, green: 157.0/255.0, blue: 109.0/255.0, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(geoClicked), for: .touchUpInside)
        
        return button
    }()
    
    let bikeButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.setTitle(NSLocalizedString("Przejdź do strony", comment: ""), for: .normal)
        button.setTitleColor(UIColor(red:0.94, green:0.78, blue:0.6, alpha:1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        button.titleLabel?.layer.masksToBounds = false
        button.layer.borderColor = UIColor(red: 71.0/255.0, green: 48.0/255.0, blue: 29.0/255.0, alpha: 1.0).cgColor
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 28
        button.backgroundColor = UIColor(red: 184.0/255.0, green: 157.0/255.0, blue: 109.0/255.0, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(bikeClicked), for: .touchUpInside)
        
        return button
    }()
    
    lazy var attractionImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: attraction.name!))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        
        return imageView
    }()
    
    lazy var attractionInfoTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .white
        
        let attributedText = NSMutableAttributedString(string: attraction.name!, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 32)])
        attributedText.append(NSAttributedString(string: "\n\(attraction.title!)", attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 17)]))
        attributedText.append(NSAttributedString(string: "\n\n\(attraction.body!)", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14)]))
        
        textView.attributedText = attributedText
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .left
        
        return textView
    }()
    
    init(boardAlert: BoardAlerting) {
        self.boardAlert = boardAlert
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        setupLayout()
        navigationController?.isNavigationBarHidden = false
        
        title = attraction.name!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        attractionCheck()
    }
    
    private func addViews() {
        let views = [ attractionImage, attractionInfoTextView, geoButton, bikeButton ]
        for view in views {
            self.view.addSubview(view)
        }
    }
    
    func attractionCheck() {
        switch attraction.name {
        case AttractionManager.Ścieżka:
            geoButton.isHidden = false
            bikeButton.isHidden = true
        case AttractionManager.Rowery:
            bikeButton.isHidden = false
            geoButton.isHidden = true
        default:
            geoButton.isHidden = true
            bikeButton.isHidden = true
        }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            attractionImage.heightAnchor.constraint(equalToConstant: 250),
            attractionImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            attractionImage.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            attractionImage.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            attractionInfoTextView.topAnchor.constraint(equalTo: attractionImage.bottomAnchor, constant: 10),
            attractionInfoTextView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16),
            attractionInfoTextView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16),
            attractionInfoTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            
            geoButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            geoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            geoButton.widthAnchor.constraint(equalToConstant: view.frame.width - 80),
            geoButton.heightAnchor.constraint(equalToConstant: 56),
            
            bikeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            bikeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bikeButton.widthAnchor.constraint(equalToConstant: view.frame.width - 80),
            bikeButton.heightAnchor.constraint(equalToConstant: 56)
            
            ])
    }
    
    @objc func geoClicked() {
        let title = geoButton.title(for: .normal)
        switch title {
        case NSLocalizedString("Zatrzymaj", comment: ""):
            player?.stop()
            geoButton.setTitle(NSLocalizedString("Przejdź do tablic", comment: ""), for: .normal)
        default:
            boardAlert.boardAlertAction(controller: self)
            geoButton.setTitle(NSLocalizedString("Zatrzymaj", comment: ""), for: .normal)
        }
    }
    
    @objc func bikeClicked() {
        if let url = url {
            UIApplication.shared.open(url)
        }
    }
}
