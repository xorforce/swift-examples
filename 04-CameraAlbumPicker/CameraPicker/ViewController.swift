//
//  ViewController.swift
//  CameraPicker
//
//  Created by Bhagat  Singh on 18/05/19.
//  Copyright © 2019 Bhagat Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var albumButton: UIBarButtonItem!
    @IBOutlet weak var imageView: UIImageView!
    
    /*
     Don't forget to assign specific messages for NSPhotoLibraryUsageDescription
     and NSCameraUsageDescription, which basically resolve to the messages which
     will be shown while asking permission from the user for the read permission
     from camera and photo library. These strings are set in the Info.plist file
     of the app.
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //check if camera is available
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        
        //adding border to imageView so that it is visible in no
        //photo selected state
        imageView.layer.cornerRadius = 4
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 0.7
    }

    @IBAction func cameraButtonPressed(_ sender: Any) {
        //choose photo with type camera
        choosePhoto(sourceType: .camera)
    }
    
    @IBAction func albumButtonPressed(_ sender: Any) {
        //choose photo with type photo album
        choosePhoto(sourceType: .photoLibrary)
    }
    
    //init and setup properties of controller
    func choosePhoto(sourceType: UIImagePickerController.SourceType) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = sourceType
        present(pickerController, animated: true, completion: nil)
    }
    
    //delegate function which gets called when user selects an image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    //delegate function which gets called when user cancels the controller
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

