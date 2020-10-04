//
//  ViewController.swift
//  Point24
//
//  Created by Mr. Apple on 10/4/20.
//  Copyright © 2020 Mr. Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var exitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playOnClick(sender: UIButton, forEvent event: UIEvent) {
        print("Hello, Let\'s Start Game")
    }
    
    @IBAction func exitOnClick(sender: UIButton, forEvent event: UIEvent) {
        print("Bye~")
        exit(0)
    }


}

