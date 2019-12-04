//
//  IntroCell.swift
//  Czaple
//
//  Created by Filip Trzaska on 05/04/2019.
//  Copyright © 2019 Filip Trzaska. All rights reserved.
//

import UIKit

class IntroCell: UICollectionViewCell {
    
    var introPage: IntroPage? {
        didSet {
            guard let unwrappedIntroPage = introPage else { return }
            
            mapImageView.image = UIImage(named: unwrappedIntroPage.imageName)
            let attributedText = NSMutableAttributedString(
                string: unwrappedIntroPage.introText,
                attributes: [
                    NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)
                ])
            
            attributedText.append(
                NSAttributedString(
                    string: "\n\n\n\(unwrappedIntroPage.introBody)",
                    attributes: [
                        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
                        NSAttributedString.Key.foregroundColor: UIColor.gray
                    ]))
            introTextView.attributedText = attributedText
            introTextView.textAlignment = .center
        }
    }
    
    private let mapImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "baner"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let introTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(
            string: "Zapraszamy na kamienno-piaskową przygodę do Najpiękniejszej Wsi Dolnośląskiej 2015 roku",
            attributes: [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)
            ])
        
        attributedText.append(
            NSAttributedString(
                string: "\n\n\nPrzygotowaliśmy ofertę pobytową, dzięki której poznacie skarby naszej miejscowości – piaskowce i kamienie oraz przeżyjecie przygody rodem z epoki kamienia łupanego.",
                attributes: [
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
                    NSAttributedString.Key.foregroundColor: UIColor.gray
                ]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    private func setupLayout() {
        let topContainerView = UIView()
        addSubview(topContainerView)
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topContainerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        topContainerView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
        topContainerView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        topContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        topContainerView.addSubview(mapImageView)
        mapImageView.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor).isActive = true
        mapImageView.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        mapImageView.heightAnchor.constraint(equalTo: topContainerView.heightAnchor,multiplier: 0.8).isActive = true
        
        addSubview(introTextView)
        introTextView.topAnchor.constraint(equalTo: topContainerView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        introTextView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 24).isActive = true
        introTextView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -24).isActive = true
        introTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 20).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
