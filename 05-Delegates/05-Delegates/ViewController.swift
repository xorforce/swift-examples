//
//  ViewController.swift
//  05-Delegates
//
//  Created by Bhagat  Singh on 18/05/19.
//  Copyright © 2019 Bhagat Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customView: CustomView!
    private let colors = [UIColor.red, .blue, .orange, .purple, .green]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //helper function to setup the custom view
        setupCustomView()
    }
    
    func setupCustomView() {
        //Assigning the customView's delegate as self
        customView.delegate = self
        
        customView.layer.cornerRadius = 8
    }
}

//Implementation of CustomView's delegate method

//It is a nice practice to implement logically related functions
//separately in an extension
extension ViewController: CustomViewDelegate {
    
    func callbackButtonTapped() {
        //generating a random number for the callback
        let randomColor = colors.randomElement()
        customView.backgroundColor = randomColor
    }
}
