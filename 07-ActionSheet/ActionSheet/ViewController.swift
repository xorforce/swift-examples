//
//  ViewController.swift
//  ActionSheet
//
//  Created by Bhagat  Singh on 21/05/19.
//  Copyright © 2019 Bhagat Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let alertTitle = "This is an alert"
    let alertMessage = "This is the custom message inside it"
    
    let doneTitle = "Done"
    let cancelTitle = "Cancel"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //action which presents an alert
    @IBAction func alertControllerButtonTapped(_ sender: Any) {
        
        //create an alert controller
        let alertController = UIAlertController(title: alertTitle,
                                                message: alertMessage,
                                                preferredStyle: .alert)
        
        //alert action done
        let alertActionDone = UIAlertAction(title: doneTitle, style: .default) { (action) in
            print("Done action was pressed")
        }
        
        //alert action cancel
        let alertActionCancel = UIAlertAction(title: cancelTitle, style: .destructive) { (action) in
            print("Cancel action was pressed")
        }
        
        //add actions
        alertController.addAction(alertActionDone)
        alertController.addAction(alertActionCancel)
        
        //present the controller
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func actionSheetButtonTapped(_ sender: Any) {
        
        //create an alert controller
        let alertController = UIAlertController(title: alertTitle,
                                                message: alertMessage,
                                                preferredStyle: .actionSheet)
        
        //alert action done
        let alertActionDone = UIAlertAction(title: doneTitle, style: .default) { (action) in
            print("Done action was pressed")
        }
        
        //alert action cancel
        let alertActionCancel = UIAlertAction(title: cancelTitle, style: .destructive) { (action) in
            print("Cancel action was pressed")
        }
        
        //add actions
        alertController.addAction(alertActionDone)
        alertController.addAction(alertActionCancel)
        
        //present the controller
        present(alertController, animated: true, completion: nil)
    }
}

