//
//  MainViewController.swift
//  mParticleDemo
//
//  Created by Merritt Tidwell on 5/22/18.
//  Copyright © 2018 Merritt Tidwell. All rights reserved.
//

import UIKit
import mParticle_Apple_SDK

class MainViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBOutlet var consentView: UIView!
    
    @IBAction func showConsentView(_ sender: Any) {
        self.view.addSubview(consentView)
        consentView.center = self.view.center
    }
    
    @IBAction func grantConsentButtonPressed(_ sender: Any) {
   
        let consent = MPGDPRConsent()
        consent.consented = true
        MParticleUser().consentState()?.addGDPRConsentState(consent, purpose: "location")
        
        self.consentView.removeFromSuperview()
    
    }
}
