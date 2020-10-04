//
//  GameViewController.swift
//  Point24
//
//  Created by Mr. Apple on 10/4/20.
//  Copyright © 2020 Mr. Apple. All rights reserved.
//

import Foundation
import UIKit

class GameViewController : UIViewController {
    
    @IBOutlet weak var exitButton: UIButton!
    override func viewDidLoad() {
        
        
    }
    
    @IBAction func exitOnClick(sender: UIButton, forEvent event: UIEvent) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}