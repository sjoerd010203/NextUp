//
//  ViewController.swift
//  NextUp
//
//  Created by Sjoerd van Lexmond on 08/06/2025.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var modeSwitch: UISwitch!
    override func  viewDidLoad() {
        super.viewDidLoad()
            
            modeSwitch.isOn = true
        }
        
        @IBAction func valueChanged(_ sender: Any) {
            if modeSwitch.isOn == true
            {
                //licht
                let window = UIApplication.shared.windows[0]
                window.overrideUserInterfaceStyle = .light
            }
            else
            {
                //dark
                let window = UIApplication.shared.windows[0]
                window.overrideUserInterfaceStyle = .dark
            }
        }
    }
    

