//
//  ViewController+UIImagePickerControllerDelegate.swift
//  System View Controllers
//
//  Created by Dmitry Novosyolov on 27/02/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import UIKit

extension ViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        imageView.image = image
        
        dismiss(animated: true, completion: nil)
    }
}
