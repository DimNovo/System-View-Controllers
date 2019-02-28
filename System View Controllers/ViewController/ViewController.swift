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
    
    func safari(sender: UIButton) {
        let url = URL(string: "http://learnswift.ru")!
        
        let safariViewController = SFSafariViewController(url: url)
        
        present(safariViewController, animated: true, completion: nil)
    }
    
    func camera(sender: UIButton) {
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
    
    func email(sender: UIButton) {
        guard MFMailComposeViewController.canSendMail() else { return }
        
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        mailComposer.setToRecipients(["i1710@icloud.com"])
        mailComposer.setSubject("This is a test at \(Date())")
        mailComposer.setMessageBody("Hello! The tigers is hungry!", isHTML: false)
        
        present(mailComposer, animated: true, completion: nil)
    }
    
    func iMessage(sender: UIButton) {
        guard MFMessageComposeViewController.canSendText(),
              MFMessageComposeViewController.canSendAttachments(),
              MFMessageComposeViewController.canSendSubject()
        else { return }
        print(#function, "send iMessage" )
        let iMessageComposer = MFMessageComposeViewController()
        iMessageComposer.messageComposeDelegate = self

        present(iMessageComposer, animated: true, completion: nil)
    }
    
    // MARK: - ... IBAction
    @IBAction func buttonPressed(sender button: UIButton) {
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

