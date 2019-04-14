//
//  ViewController.swift
//  Gradients
//
//  Created by Bhagat  Singh on 15/04/19.
//  Copyright © 2019 Bhagat Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let gradientColor1: UIColor = UIColor(red: 252/255, green: 70/255, blue: 107/255, alpha: 1.0)
    let gradientColor2: UIColor = UIColor(red: 63/255, green: 94/255, blue: 251/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradient()
    }

    fileprivate func setupGradient() {
        
        //initialize the gradient layer
        let gradientLayer = CAGradientLayer()
        
        //add an array of cgColors
        gradientLayer.colors = [gradientColor1, gradientColor2].map({ $0.cgColor })
        
        //setup the gradient points in NSNumber type
        //locations is basically the starting location for each color
        gradientLayer.locations = [0, 0.6].map({ NSNumber.init(value: $0) })
        
        //setup the start and the end point for the gradient
        //the top left corner is (0,0) in x-y space and bottom right corner is (1,1)
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 1)
        
        //add a frame to the layer
        gradientLayer.frame = view.frame
        
        //add sublayer
        //inserting at 0 inserts the gradient layer at the bottom.
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        
        //For awesome gradient hues, visit uigradients.com
    }

}

