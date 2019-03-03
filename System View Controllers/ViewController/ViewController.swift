//
//  ViewController.swift
//  System View Controllers
//
//  Created by Dmitry Novosyolov on 27/02/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import MessageUI
import UIKit
import SafariServices

class ViewController: UIViewController {

    // MARK: - ... @IBOutlet
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - ... Methods
    func share(sender: UIButton) {
        guard let image = imageView.image else { return }
        
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        // For iPad UI
        activityController.popoverPresentationController?.sourceView = sender
        
        present(activityController, animated: true, completion: nil)
    }
    
    func safari(sender: RoundButton) {
        let url = URL(string: "http://learnswift.ru")!
        
        let safariViewController = SFSafariViewController(url: url)
        
        present(safariViewController, animated: true, completion: nil)
    }
    
    func camera(sender: RoundButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(
            title: "Chose Image Source",
            message: nil,
            preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { action in
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        }
        alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { action in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        alertController.addAction(photoLibraryAction)
        }
        
        // For iPad UI
        alertController.popoverPresentationController?.sourceView = sender
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    func email(sender: RoundButton)
    {
        guard UIApplication.shared.canOpenURL(URL(string:"mailto:")!) else
        {
            return
            
        }
        UIApplication.shared.open(URL(string:"mailto:")!, options: [:], completionHandler: nil)
    }
    
    func iMessage(sender: RoundButton)
    {
        guard UIApplication.shared.canOpenURL(URL(string:"sms:")!) else
        {
            return
            
        }
                UIApplication.shared.open(URL(string:"sms:")!, options: [:], completionHandler: nil)
    
    }
    
    // MARK: - ... IBAction
    @IBAction func buttonPressed(sender button: RoundButton) {
        guard let text =  button.titleLabel?.text else { return }
        
        switch text {
        case "Share":
            share(sender: button)
        case "Safari":
            safari(sender: button)
        case "Camera":
            camera(sender: button)
        case "Email":
            email(sender: button)
        case "iMessage":
            iMessage(sender: button)
        default:
            break
        }
    }
}

