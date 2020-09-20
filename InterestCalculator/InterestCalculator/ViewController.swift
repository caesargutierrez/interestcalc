//
//  ViewController.swift
//  InterestCalculator
//
//  Created by Caesar Gutierrez on 8/24/19.
//  Copyright © 2019 Caesar Gutierrez. All rights reserved.
//
//TODO: check why the apr value isnt taken, perhaps the math?
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    
    @IBOutlet weak var balanceTextField: UITextField!
    @IBOutlet weak var aprTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        balanceTextField.delegate = self
        aprTextField.delegate = self
    }
    
    //MARK: functions
    // Gets the interest rate and balance and returns new balance
    func getResult (balance: Double, apr: Double) -> Double {
        
        let toMult = apr/100
        
        let interest = (balance * toMult) / 356
        
        return balance + interest
        
    }
    //UItextField delegate func
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let aprCanResign = false
        balanceTextField.resignFirstResponder()
        aprTextField.resignFirstResponder()
        return true
    }
    
    
    //Mark: Action
    // Cak getResult and sends it to resultLabel
    @IBAction func checkButton(_ sender: UIButton) {
        var bal: Double?
        var inter: Double?
        
        if let balance = balanceTextField.text {
             bal = Double(balance)
        }
        else {
            errorLabel.text = "Error: enter value first!"
        }
        
        if let interest = aprTextField.text {
             inter = Double(interest)
        }
        else {
            //TODO: this seems like redundant code maybe create a func
            errorLabel.text = "Error: enter value first!"
        }
        let result = getResult(balance: bal! ,apr: inter! )
        
        resultLabel.text = "You owe: " + String(result)
        
        
        
    }
    
        
    
    
    
    
    


}

