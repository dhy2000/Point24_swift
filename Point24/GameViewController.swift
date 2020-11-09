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
    
    // Data Segment
    var numArr: [RationalNumber?] = [ONE, ONE, ONE, ONE]
    var initArr: [Int] = [1, 1, 1, 1]
    
    var operand1: RationalNumber?, operand2: RationalNumber?
    var operate: Character?
    
    var totalScore: Int = 0
    
    @IBOutlet weak var totalScoreLabel: UILabel!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
    @IBOutlet weak var skipButton: UIButton!
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
        operate = Character("+")
        updateView()
    }
    @IBAction func subOnClick(sender: UIButton, forEvent event: UIEvent) {
        operate = Character("-")
        updateView()
    }
    @IBAction func mulOnClick(sender: UIButton, forEvent event: UIEvent) {
        operate = Character("*")
        updateView()
    }
    @IBAction func divOnClick(sender: UIButton, forEvent event: UIEvent) {
        operate = Character("/")
        updateView()
    }
    @IBAction func num1OnClick(sender: UIButton, forEvent event: UIEvent) {
        uploadNum(1)
        updateView()
    }
    @IBAction func num2OnClick(sender: UIButton, forEvent event: UIEvent) {
        uploadNum(2)
        updateView()
    }
    @IBAction func num3OnClick(sender: UIButton, forEvent event: UIEvent) {
        uploadNum(3)
        updateView()
    }
    @IBAction func num4OnClick(sender: UIButton, forEvent event: UIEvent) {
        uploadNum(4)
        updateView()
    }
    @IBAction func restartOnClick(sender: UIButton, forEvent event: UIEvent) {
        restartCurrentGame()
    }
    @IBAction func skipOnClick(sender: UIButton, forEvent event: UIEvent) {
        startGame()
    }
    
    func updateButtoni(i: Int, _ txt: String) {
        switch i {
        case 1:
            num1Button.setTitle(txt, forState: .Normal)
            break
        case 2:
            num2Button.setTitle(txt, forState: .Normal)
            break
        case 3:
            num3Button.setTitle(txt, forState: .Normal)
            break
        case 4:
            num4Button.setTitle(txt, forState: .Normal)
            break
        default:
            break
        }
    }
    
    func checkCalculate() -> Bool {
        if let operand1 = operand1 , let operand2 = operand2, let operate = operate {
            let answ = calc2Number(operate, operand1, operand2)
            for i in 0...3 {
                if numArr[i] == nil {
                    numArr[i] = answ
                    
                    return true
                }
            }
        }
        return false
    }
    
    func updateView() {
        totalScoreLabel.text = "Total Score: \(totalScore)"
        if checkCalculate() {
            operate = nil
            operand1 = nil
            operand2 = nil
        }
        if checkWin() {
            totalScore += 1
            startGame()
            return
        }
        // update Numbers
        for i in 0...3 {
            if let numi = numArr[i] {
                updateButtoni(i + 1, numi.toString())
            }
            else {
                updateButtoni(i + 1, "-")
            }
        }
        // update labels
        if let operand1 = operand1 {
            operand1Label.text = operand1.toString()
        }
        else {
            operand1Label.text = ""
        }
        if let operand2 = operand2 {
            operand2Label.text = operand2.toString()
        }
        else {
            operand2Label.text = ""
        }
        // update operator
        if let operate = operate {
            operatorLabel.text = String(operate)
        }
        else {
            operatorLabel.text = ""
        }
    }
    
    func uploadNum(index: Int) {
        if operand1 != nil && operand2 != nil {
            return
        }
        let num2upload = numArr[index - 1]
        numArr[index - 1] = nil
        /*for i in (index - 1)..<3 {
            numArr[i] = numArr[i + 1]
            numArr[i + 1] = nil
        }*/
        if operand1 == nil {
            operand1 = num2upload
        }
        else if operand2 == nil {
            operand2 = num2upload
        }
    }
    
    func checkWin() -> Bool {
        if numArr[0] != nil && numArr[1] == nil && numArr[2] == nil && numArr[3] == nil {
            let result = numArr[0]!
            if result.compareTo(RationalNumber(24)) == 0 {
                return true
            }
        }
        return false
    }
    
    func startGame() {
        for i in 0...3 {
            initArr[i] = Int(arc4random() % 13 + 1)
        }
        restartCurrentGame()
        updateView()
    }
    func restartCurrentGame() {
        operand1 = nil
        operand2 = nil
        operate = nil
        for i in 0...3 {
            numArr[i] = RationalNumber(initArr[i])
        }
        updateView()
    }
    
    
    override func viewDidLoad() {
        startGame()
        updateView()
        super.viewDidLoad()
    }
    
    @IBAction func exitOnClick(sender: UIButton, forEvent event: UIEvent) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    

    
}