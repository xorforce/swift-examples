//
//  ViewController.swift
//  02-Lottie
//
//  Created by Bhagat  Singh on 15/04/19.
//  Copyright © 2019 Bhagat Singh. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    fileprivate let padding: CGFloat = 12
    
    let cycleAnimationView = LOTAnimationView()
    var penguinAnimationView: LOTAnimationView?
    var switchAnimationView: LOTAnimatedSwitch?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createLottieView1()
        createLottiepenguinAnimationView()
        createLottieAnimatedSwitch()
    }
    
    fileprivate func createLottieView1() {
        //cycle animation view layout configuration
        activateCycleViewConstraints()
        
        //cycle animation view configuration
        cycleAnimationView.contentMode = .scaleAspectFit
        cycleAnimationView.setAnimation(named: "cycle.json")
        cycleAnimationView.loopAnimation = true
        cycleAnimationView.play()
    }

    fileprivate func createLottiepenguinAnimationView() {
        //penguin view animation configuration
        guard let url = URL(string: "https://api.myjson.com/bins/s2cz0") else { return }
        penguinAnimationView = LOTAnimationView(contentsOf: url)
        
        guard let penguinAnimationView = penguinAnimationView else { return }
        
        //penguin view layout configuration
        activatePenguinViewConstraints()
        
        //penguin view animation configuration
        penguinAnimationView.contentMode = .scaleAspectFit
        penguinAnimationView.loopAnimation = true
        penguinAnimationView.play()
    }
    
    fileprivate func createLottieAnimatedSwitch() {
        //animated switch animation configuration
        switchAnimationView = LOTAnimatedSwitch(named: "switch.json")
        
        //animated switch layout configuration
        activateSwitchViewConstraints()
        
        guard let switchAnimationView = switchAnimationView else { return }
        
        //animated switch animation configuration
        switchAnimationView.contentMode = .scaleAspectFit
        switchAnimationView.setProgressRangeForOnState(fromProgress: 0.5, toProgress: 1)
        switchAnimationView.setProgressRangeForOffState(fromProgress: 1, toProgress: 0.5)
    }
    
}

extension ViewController {
    
    fileprivate func activateCycleViewConstraints() {
        view.addSubview(cycleAnimationView)
        
        cycleAnimationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cycleAnimationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            cycleAnimationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            cycleAnimationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            cycleAnimationView.heightAnchor.constraint(equalToConstant: 160)
            ])
    }
    
    fileprivate func activatePenguinViewConstraints() {
        guard let penguinAnimationView = penguinAnimationView else { return }
        
        view.addSubview(penguinAnimationView)
        penguinAnimationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            penguinAnimationView.topAnchor.constraint(equalTo: cycleAnimationView.bottomAnchor, constant: 2*padding),
            penguinAnimationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            penguinAnimationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            penguinAnimationView.heightAnchor.constraint(equalToConstant: 160)
            ])
        
    }
    
    fileprivate func activateSwitchViewConstraints() {
        guard let penguinAnimationView = penguinAnimationView,
            let switchAnimationView = switchAnimationView else { return }
        
        view.addSubview(switchAnimationView)
        switchAnimationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            switchAnimationView.topAnchor.constraint(equalTo: penguinAnimationView.bottomAnchor, constant: 2*padding),
            switchAnimationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            switchAnimationView.heightAnchor.constraint(equalToConstant: 50),
            switchAnimationView.widthAnchor.constraint(equalToConstant: 70)
            ])
    }
}
