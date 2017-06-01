//
//  ViewController.swift
//
//  Copyright © 2017 Cameron Johns. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Keyboard management
        self.hideKeyboardWhenInteractingWithView()
        self.keyboardScrollSetup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

