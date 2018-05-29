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

    @IBAction func grantConsent(_ sender: Any) {

        let consent = MPGDPRConsent()
        consent.consented = true
        MParticleUser().consentState()?.addGDPRConsentState(consent, purpose: "marketing")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
