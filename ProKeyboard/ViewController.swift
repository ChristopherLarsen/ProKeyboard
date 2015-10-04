//
//  ViewController.swift
//  ProKeyboard
//
//  Created by Christopher Larsen on 2015-10-04.
//  Copyright © 2015 DRG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Dispatch.after(0.5) { () -> Void in
            self.textField.becomeFirstResponder()
        }
        
    }

}

