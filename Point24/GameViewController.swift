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
    
    @IBOutlet weak var totalScoreLabel: UILabel!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var operand1Label: UILabel!
    @IBOutlet weak var operand2Label: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var mulButton: UIButton!
    @IBOutlet weak var divButton: UIButton!
    @IBOutlet weak var num1Button: UIButton!
    @IBOutlet weak var num2Button: UIButton!
    @IBOutlet weak var num3Button: UIButton!
    @IBOutlet weak var num4Button: UIButton!
    @IBAction func addOnClick(sender: UIButton, forEvent event: UIEvent) {
        
    }
    @IBAction func subOnClick(sender: UIButton, forEvent event: UIEvent) {
        
    }
    @IBAction func mulOnClick(sender: UIButton, forEvent event: UIEvent) {
        
    }
    @IBAction func divOnClick(sender: UIButton, forEvent event: UIEvent) {
        
    }
    @IBAction func num1OnClick(sender: UIButton, forEvent event: UIEvent) {
        
    }
    @IBAction func num2OnClick(sender: UIButton, forEvent event: UIEvent) {
        
    }
    @IBAction func num3OnClick(sender: UIButton, forEvent event: UIEvent) {
        
    }
    @IBAction func num4OnClick(sender: UIButton, forEvent event: UIEvent) {
        
    }
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    @IBAction func exitOnClick(sender: UIButton, forEvent event: UIEvent) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
    
    
    
}