//
//  ImagePickerViewModel.swift
//  Five
//
//  Created by Key Hoffman on 7/28/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

protocol ImagePickerViewModelCoordinatorDelegate: class, ErrorDelegate {
    func userHasChosenImage(withData data: NSData)
}

protocol ImagePickerViewModelViewDelegate: class {
    func displayCamera()
    func displayPhotos()
}

protocol ImagePickerViewModelType: class {
    var pickedImage: UIImage? { get set }
    
    weak var viewDelegate:        ImagePickerViewModelViewDelegate?        { get set }
    weak var coordinatorDelegate: ImagePickerViewModelCoordinatorDelegate? { get set }
    
    init(isTakingSelfie: Bool)
}

final class ImagePickerViewModel: ImagePickerViewModelType {
    
    var pickedImage: UIImage? {
        didSet {
            guard let image = pickedImage, let imageData = UIImagePNGRepresentation(image) else {
                coordinatorDelegate?.anErrorHasOccured("Could not write photo in memory")
                return
            }
            coordinatorDelegate?.userHasChosenImage(withData: imageData)
        }
    }
    
    weak var coordinatorDelegate: ImagePickerViewModelCoordinatorDelegate?
    weak var viewDelegate: ImagePickerViewModelViewDelegate? {
        didSet {
            if isTakingSelfie  { viewDelegate?.displayCamera() }
            if !isTakingSelfie { viewDelegate?.displayPhotos() }
        }
    }
    
    private var isTakingSelfie: Bool
    
    init(isTakingSelfie: Bool) {
        self.isTakingSelfie = isTakingSelfie
    }
    
}


















