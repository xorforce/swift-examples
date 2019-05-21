//
//  CustomView.swift
//  05-Delegates
//
//  Created by Bhagat  Singh on 21/05/19.
//  Copyright © 2019 Bhagat Singh. All rights reserved.
//

import UIKit

//A public protocol which declares the functions for it
public protocol CustomViewDelegate: class {
    func callbackButtonTapped()
}

class CustomView: UIView  {
    
    @IBOutlet weak var callbackButton: UIButton!
    
    //A property of protocol type which the parent will
    //conform to
    
    //note that the delegate is a weak property so that
    //it doesn't stay in memory
    public weak var delegate: CustomViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //a helper to setup the button and add the selector to it
    fileprivate func setupViews() {
        callbackButton.setTitle("Tap Me!", for: .normal)
        callbackButton.setTitleColor(.white, for: .normal)
        callbackButton.layer.cornerRadius = 8
        callbackButton.layer.borderWidth = 0.5
        callbackButton.layer.borderColor = UIColor.white.cgColor
        
        callbackButton.addTarget(self, action: #selector(callbackButtonTapHandler), for: .touchUpInside)
        
    }
    
    @objc private func callbackButtonTapHandler() {
        //here, the delegate's callbackButtonTapped, i.e,
        //the parent's callbackButtonTapped is called.
        delegate?.callbackButtonTapped()
    }
}
