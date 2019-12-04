//
//  MainView.swift
//  Czaple
//
//  Created by Filip Trzaska on 05/04/2019.
//  Copyright © 2019 Filip Trzaska. All rights reserved.
//

import UIKit
import MapKit

class MainView: UIViewController {

    let attractions = AttractionManager.instance.getAttractions()
    var locationManager = CLLocationManager()
    
    let fundingText: UILabel = {
        let label = UILabel()
        let text = "APLIKACJA WSPÓŁFINANSOWANA ZE ŚRODKÓW Z BUDŻETU WOJEWÓDZTWA DOLNOŚLĄSKIEGO"
        label.text = text
        label.font = UIFont.systemFont(ofSize: 13)
        label.textAlignment = .center
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        return label
    }()
    
    let czapleTitle: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "title"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let czapleLogo: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "czaple_logo"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        return imageView
    }()
    
    let pielgrzymkaLogo: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "pielgrzymka_logo"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white

        return imageView
    }()
    
    let dolnySlaskLogo: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "dolny_slask"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white

        return imageView
    }()
    
    let attractionButton: UIButton = {
        let button = UIButton()
        button.setTitle("ATRAKCJE", for: .normal)
        button.setTitleColor(UIColor(red:0.94, green:0.78, blue:0.6, alpha:1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .black)
        button.setTitleShadowColor(UIColor(red: 71.0/255.0, green: 48.0/255.0, blue: 29.0/255.0, alpha: 1.0), for: .normal)
        button.titleLabel?.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.titleLabel?.layer.shadowOpacity = 0.5
        button.titleLabel?.layer.masksToBounds = false
        button.layer.borderColor = UIColor(red: 71.0/255.0, green: 48.0/255.0, blue: 29.0/255.0, alpha: 1.0).cgColor
        button.layer.borderWidth = 4
//        button.layer.cornerRadius = 56
        button.backgroundColor = UIColor(red: 184.0/255.0, green: 157.0/255.0, blue: 109.0/255.0, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(attractionsClicked), for: .touchUpInside)
        
        return button
    }()
    
    let czapleButton: UIButton = {
        let button = UIButton()
        button.setTitle("O CZAPLACH", for: .normal)
        button.setTitleColor(UIColor(red:0.94, green:0.78, blue:0.6, alpha:1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .black)
        button.setTitleShadowColor(UIColor(red: 71.0/255.0, green: 48.0/255.0, blue: 29.0/255.0, alpha: 1.0), for: .normal)
        button.titleLabel?.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.titleLabel?.layer.shadowOpacity = 0.5
        button.titleLabel?.layer.masksToBounds = false
        button.layer.borderColor = UIColor(red: 71.0/255.0, green: 48.0/255.0, blue: 29.0/255.0, alpha: 1.0).cgColor
        button.layer.borderWidth = 4
//        button.layer.cornerRadius = 56
        button.backgroundColor = UIColor(red: 184.0/255.0, green: 157.0/255.0, blue: 109.0/255.0, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(czapleClicked), for: .touchUpInside)
        
        return button
    }()
    
    let mapButton: UIButton = {
        let button = UIButton()
        button.setTitle("MAPA CZAPLI", for: .normal)
        button.setTitleColor(UIColor(red:0.94, green:0.78, blue:0.6, alpha:1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .black)
        button.setTitleShadowColor(UIColor(red: 71.0/255.0, green: 48.0/255.0, blue: 29.0/255.0, alpha: 1.0), for: .normal)
        button.titleLabel?.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.titleLabel?.layer.shadowOpacity = 0.5
        button.titleLabel?.layer.masksToBounds = false
        button.layer.borderColor = UIColor(red: 71.0/255.0, green: 48.0/255.0, blue: 29.0/255.0, alpha: 1.0).cgColor
        button.layer.borderWidth = 4
//        button.layer.cornerRadius = 56
        button.backgroundColor = UIColor(red: 184.0/255.0, green: 157.0/255.0, blue: 109.0/255.0, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(mapClicked), for: .touchUpInside)
        return button
    }()
    
    @objc func mapClicked(sender: UIButton) {
        let mapVC = CzapleMapView()
        self.navigationController?.pushViewController(mapVC, animated: true)
    }
    
    @objc func attractionsClicked() {
        let attractionList = AttractionList()
        self.navigationController?.pushViewController(attractionList, animated: true)
    }
    
    @objc func czapleClicked() {
        let questVC = AttractionView()
        questVC.attraction = attractions[0]
        
        self.navigationController?.pushViewController(questVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBg(view: view)
        
        self.navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "nav"), for: .default)
        
        self.title = "Ekran główny"
        
        setupViews()
        
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        locationManager.requestWhenInUseAuthorization()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setupViews() {
        let logos = [ dolnySlaskLogo, pielgrzymkaLogo, czapleLogo, czapleTitle, fundingText ]
        let views = [ czapleButton, attractionButton, mapButton ]
        
        for view in views {
            self.view.addSubview(view)
            view.layer.cornerRadius = self.view.frame.height * 0.15 / 2
        }
        
        for logo in logos {
            self.view.addSubview(logo)
        }
    }
    
    func setBg(view: UIView){
        UIGraphicsBeginImageContext(view.frame.size);
        var image = UIImage(named: "bg")
        image?.draw(in: view.bounds)
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext()
        view.backgroundColor = UIColor(patternImage: image!)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            czapleTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            czapleTitle.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            czapleTitle.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            czapleLogo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            czapleLogo.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            czapleLogo.heightAnchor.constraint(equalToConstant: view.frame.width * 0.15),
            czapleLogo.widthAnchor.constraint(equalToConstant: view.frame.width * 0.2),
            
            pielgrzymkaLogo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            pielgrzymkaLogo.leftAnchor.constraint(equalTo: czapleLogo.rightAnchor),
            pielgrzymkaLogo.heightAnchor.constraint(equalToConstant: view.frame.width * 0.15),
            pielgrzymkaLogo.widthAnchor.constraint(equalToConstant: view.frame.width * 0.4),
            
            fundingText.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            fundingText.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            fundingText.heightAnchor.constraint(equalToConstant: 60),
            fundingText.widthAnchor.constraint(equalToConstant: view.frame.width),
            
            dolnySlaskLogo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            dolnySlaskLogo.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            dolnySlaskLogo.heightAnchor.constraint(equalToConstant: view.frame.width * 0.15),
            dolnySlaskLogo.widthAnchor.constraint(equalToConstant: view.frame.width * 0.4),
            
            czapleButton.topAnchor.constraint(equalTo: czapleTitle.bottomAnchor, constant: view.frame.height / 25),
            czapleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            czapleButton.widthAnchor.constraint(equalToConstant: view.frame.width - 48),
            czapleButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.15),
            
            attractionButton.topAnchor.constraint(equalTo: czapleButton.bottomAnchor, constant: view.frame.height / 25),
            attractionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            attractionButton.widthAnchor.constraint(equalToConstant: view.frame.width - 48),
            attractionButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.15),
            
            mapButton.topAnchor.constraint(equalTo: attractionButton.bottomAnchor, constant: view.frame.height / 25),
            mapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mapButton.widthAnchor.constraint(equalToConstant: view.frame.width - 48),
            mapButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.15)
            
            ])
    }
}

