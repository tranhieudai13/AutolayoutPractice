//
//  ViewController.swift
//  AutoLayoutPractice
//
//  Created by Dai Tran on 11/13/17.
//  Copyright © 2017 Dai Tran. All rights reserved.
//

import UIKit

extension UIColor {
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}

class ViewController: UIViewController {

    let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        let attributeText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        attributeText.append(NSMutableAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)]))
        
        textView.attributedText = attributeText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    let prevButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.mainPink, for: .normal)
        return button
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = UIColor.mainPink
        pageControl.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        pageControl.currentPage = 0
        pageControl.numberOfPages = 3
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupLayout()
        setupBottomControl()
    }
    
    func setupLayout() {
        let topImageContainerView = UIView()
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(topImageContainerView)
        topImageContainerView.addSubview(bearImageView)
        
        view.addSubview(descriptionTextView)

        if #available(iOS 11, *) {
            NSLayoutConstraint.activate([
                topImageContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                topImageContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                topImageContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                topImageContainerView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)
                ])
            
            NSLayoutConstraint.activate([
                bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.safeAreaLayoutGuide.centerXAnchor),
                bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.safeAreaLayoutGuide.centerYAnchor),
                bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)
                ])
            
            NSLayoutConstraint.activate([
                descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.safeAreaLayoutGuide.bottomAnchor),
                descriptionTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
                descriptionTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
                descriptionTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
                ])
        } else {
            NSLayoutConstraint.activate([
                topImageContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
                ])
            
            NSLayoutConstraint.activate([
                bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
                bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
                bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5)
                ])
            
            NSLayoutConstraint.activate([
                descriptionTextView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
                descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])
        }
    }
    
    func setupBottomControl() {
        let bottomStackControl = UIStackView(arrangedSubviews: [prevButton, pageControl, nextButton])
        bottomStackControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bottomStackControl)
        
        if #available(iOS 11, *) {
            bottomStackControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            bottomStackControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            bottomStackControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            bottomStackControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        } else {
            bottomStackControl.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            bottomStackControl.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            bottomStackControl.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            bottomStackControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
        
        
        bottomStackControl.distribution = .fillEqually
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

