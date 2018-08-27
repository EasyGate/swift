//
//  CurrencyConversionViewController.swift
//  Easy Gate
//
//  Created by ameer on 8/1/18.
//  Copyright © 2018 JpJets. All rights reserved.
//

import UIKit

class CurrencyConversionViewController: UIViewController {
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBAction
    @IBAction func From(_ sender: ScalableButton) {
        let sb = UIStoryboard(name: "Maine", bundle: nil)
        let controller = sb.instantiateViewController(withIdentifier: "FromePopUpViewController")
        self.navigationController?.pushViewController(controller, animated: false)
    }
    
    @IBAction func To(_ sender: ScalableButton) {
        let sb = UIStoryboard(name: "Maine", bundle: nil)
        let controller = sb.instantiateViewController(withIdentifier: "ToPopUpViewController")
        self.navigationController?.pushViewController(controller, animated: false)
    }
    
    @IBAction func Back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)}
    
    @IBAction func Home(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Maine", bundle: nil)
        let controller = sb.instantiateViewController(withIdentifier: "Home")
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

