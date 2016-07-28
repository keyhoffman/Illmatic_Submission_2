//
//  ImagePickerViewController.swift
//  Five
//
//  Created by Key Hoffman on 7/28/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import UIKit
import SnapKit

class ImagePickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ImagePickerViewModelViewDelegate {

    weak var viewModel: ImagePickerViewModelType? {
        didSet { viewModel?.viewDelegate = self }
    }
    
    let imagePicker = UIImagePickerController()
    
    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        
//    }
    
    func displayPhotos() {
        displaySelectedSourceType(.PhotoLibrary)
    }
    
    func displayCamera() {
        displaySelectedSourceType(.Camera)
    }
    
    private func displaySelectedSourceType(type: UIImagePickerControllerSourceType) {
        if UIImagePickerController.isSourceTypeAvailable(type) {
            imagePicker.delegate = self
            imagePicker.sourceType = type
            imagePicker.allowsEditing = false
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.dismissViewControllerAnimated(true, completion: nil)
        viewModel?.pickedImage = image
    }
   
}
