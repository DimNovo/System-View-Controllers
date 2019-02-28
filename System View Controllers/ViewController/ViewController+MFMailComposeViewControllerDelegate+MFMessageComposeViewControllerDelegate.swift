//
//  ViewController+MFMailComposeViewControllerDelegate+MFMessageComposeViewControllerDelegate.swift
//  System View Controllers
//
//  Created by Dmitry Novosyolov on 27/02/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import MessageUI

extension ViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
}

extension ViewController: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
