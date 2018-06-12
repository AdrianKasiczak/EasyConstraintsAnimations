//
//  ViewController.swift
//  SimpleConstraintsAnimations
//
//  Created by Adrian Kasiczak on 12/06/2018.
//  Copyright © 2018 Adrian Kasiczak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Simple Animations"
        label.font = UIFont(name: "Futura", size: 34)
        label.numberOfLines = 0
       return label
    }()
    
    private let bodyLabel: UILabel = {
        let label = UILabel()
        label.text = "Cool and simple to use constraints animations. Whole view is just a two labels included into one StackView. Everything is working just because of x and y translation."
        label.numberOfLines = 0
        return label
    }()
    
    private func setupStackViews() {
        let StackViews = UIStackView(arrangedSubviews: [titleLabel, bodyLabel])
        StackViews.axis = .vertical
        StackViews.spacing = 8
        StackViews.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(StackViews)
        
        StackViews.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        
        NSLayoutConstraint.activate([
            StackViews.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            StackViews.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
    }
    
    private func setupAnimations() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAction)))
    }
    
    @objc fileprivate func handleTapAction() {
        
        //Title Animation
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                
                self.titleLabel.alpha = 0
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
            })
        }
        
        //Body Animation
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                
                self.bodyLabel.alpha = 0
                self.bodyLabel.transform = self.bodyLabel.transform.translatedBy(x: 0, y: -200)
            })
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupStackViews()
        setupAnimations()
        
    }


}

