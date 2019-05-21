//
//  ViewController.swift
//  06-TapGesture
//
//  Created by Bhagat  Singh on 21/05/19.
//  Copyright © 2019 Bhagat Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tappableView: UIView!
    
    let colors = [UIColor.red, .blue, .green, .gray, .purple]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //helper to setup a tappable view
        setupTappableView()
    }

    fileprivate func setupTappableView() {
        tappableView.layer.cornerRadius = 8
        
        //adding the tapgesture to the view
        //Note that we could've used @IBAction and directly
        //configured that
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        tappableView.addGestureRecognizer(tapGesture)
    }
    
    //Tap handler
    @objc func handleTapGesture() {
        let randomColor = colors.randomElement()
        tappableView.backgroundColor = randomColor
    }

}

