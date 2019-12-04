//
//  IntroSwipingViewController.swift
//  Czaple
//
//  Created by Filip Trzaska on 05/04/2019.
//  Copyright © 2019 Filip Trzaska. All rights reserved.
//

import UIKit

class IntroSwipingViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let introPages = [
        IntroPage(imageName: "baner", introText: "Zapraszamy na kamienno-piaskową przygodę do Najpiękniejszej Wsi Dolnośląskiej 2015 roku", introBody: "Przygotowaliśmy ofertę pobytową, dzięki której poznacie skarby naszej miejscowości – piaskowce i kamienie oraz przeżyjecie przygody rodem z epoki kamienia łupanego."),
        IntroPage(imageName: "GRUPY_SZKOLNE_1", introText: "Piaskowy zawrót głowy", introBody: "Warsztaty artystyczne z wykorzystaniem lokalnych zasobów naturalnych – piasku i kamienia, do wyboru 1 z 5 warsztatów"),
        IntroPage(imageName: "GRUPY_SZKOLNE_2", introText: "Gry terenowe", introBody: "Edukacja w formie aktywnej zabawy (dla dzieci powyżej 8 lat)")
    ]
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("POPRZEDNI", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.gray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        
        return button
    }()
    
    @objc func handlePrev() {
        let prevIndex = max(pageControl.currentPage - 1, 0)
        pageControl.currentPage = prevIndex
        
        collectionView.scrollToItem(at: IndexPath(item: prevIndex, section: 0), at: .left, animated: true)
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NASTĘPNY", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.brown, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        
        return button
    }()
    
    @objc func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, introPages.count - 1)
        pageControl.currentPage = nextIndex
        if nextIndex == introPages.count - 1 {
            collectionView.scrollToItem(at: IndexPath(item: nextIndex, section: 0), at: .right, animated: true)
            nextButton.setTitle("START", for: .normal)
            nextButton.addTarget(self, action: #selector(handleSkip), for: .touchUpInside)
        } else {
            collectionView.scrollToItem(at: IndexPath(item: nextIndex, section: 0), at: .right, animated: true)
        }
    }
    
    @objc func handleSkip() {
        let mainView = MainView()
        let navigationController = UINavigationController(rootViewController: mainView)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = introPages.count
        pageControl.currentPageIndicatorTintColor = .brown
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpBottomNavigation()
        
        collectionView.backgroundColor = .white
        collectionView.register(IntroCell.self, forCellWithReuseIdentifier: "introCell")
        collectionView.isPagingEnabled = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return introPages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "introCell", for: indexPath) as! IntroCell
        
        let introPage = introPages[indexPath.item]
        cell.introPage = introPage
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let currentPage = Int(targetContentOffset.pointee.x/view.frame.width)
        
        pageControl.currentPage = currentPage
    }
    
    private func setUpBottomNavigation() {
        let bottomContainerStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomContainerStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomContainerStackView.distribution = .fillEqually
        view.addSubview(bottomContainerStackView)
        
        NSLayoutConstraint.activate([
            bottomContainerStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomContainerStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            bottomContainerStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            bottomContainerStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
        
    }
}
