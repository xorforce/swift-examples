//
//  ViewController.swift
//  03-AutolayoutAnchors
//
//  Created by Bhagat  Singh on 15/05/19.
//  Copyright © 2019 Bhagat Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let padding: CGFloat = 12
    let heightConstant: CGFloat = 80
    
    //Creating views
    let redView: UIView = {
        let redView = UIView()
        redView.backgroundColor = .red
        //don't forget to do turn this flag off
        redView.translatesAutoresizingMaskIntoConstraints = false
        return redView
    }()
    
    let greenView: UIView = {
        let greenView = UIView()
        greenView.backgroundColor = .green
        //don't forget to do turn this flag off
        greenView.translatesAutoresizingMaskIntoConstraints = false
        return greenView
    }()
    
    let blueView: UIView = {
        let blueView = UIView()
        blueView.backgroundColor = .blue
        //don't forget to do turn this flag off
        blueView.translatesAutoresizingMaskIntoConstraints = false
        return blueView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //adding to view's subviews
        view.addSubview(redView)
        addRedViewConstraints()
        
        view.addSubview(greenView)
        addGreenViewConstraints()
        
        view.addSubview(blueView)
        addBlueViewConstraints()
    }
    
    func addRedViewConstraints() {
        //don't forget to activate constraints
        redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 4 * padding).isActive = true
        redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding).isActive = true
        //negative padding in trailing and bottom because it has to
        //inset negative inside
        redView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding).isActive = true
        redView.heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
        redView.layoutIfNeeded()
    }
    
    func addGreenViewConstraints() {
        //don't forget to activate constraints
        
        //constraining to bottom anchor because we want greenView
        //below redView
        greenView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: padding).isActive = true
        
        //constraining greenView's leading to redView's leading
        greenView.leadingAnchor.constraint(equalTo: redView.leadingAnchor).isActive = true
        
        //setting view's width propotional to redView's width
        greenView.widthAnchor.constraint(equalToConstant: redView.frame.width * 0.4).isActive = true
        
        greenView.heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
    }
    
    func addBlueViewConstraints() {
        //don't forget to activate constraints
        blueView.topAnchor.constraint(equalTo: greenView.topAnchor).isActive = true
        
        //setting blueView's leading to greenView's trailing, because we
        //want it after greenView
        blueView.leadingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: padding).isActive = true
        
        blueView.trailingAnchor.constraint(equalTo: redView.trailingAnchor).isActive = true
        
        blueView.heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
    }
}

