//
//  PopUpResistLedViewController.swift
//  ElectroHelper
//
//  Created by Елена on 01.11.2021.
//

import UIKit

class PopUpResistLedViewController: UIViewController {
    @IBOutlet weak var VccTextField: UITextField!
    @IBOutlet weak var VoltButton: UIButton!
    @IBOutlet var VoltCollect: [UIButton]!
    @IBOutlet private weak var StackButton: UIStackView!
    @IBOutlet private weak var StackVolt: UIStackView!
    
    
    @IBAction func VoltButton(_ sender: UIButton) {
        StackButton.isHidden = true
        StackVolt.isHidden = false
    }
    
    @IBAction func VoltStackButton(_ sender: UIButton) {
        VoltData = "\((sender.titleLabel?.text)!)"
        VoltButton.setTitle((sender.titleLabel?.text)!, for: .normal)
        StackButton.isHidden = false
        StackVolt.isHidden = true
        
    }
    
    
    
    @IBAction func OkButton(_ sender: Any) {
        VccDelegate?.updateVcc(dtVcc: VccTextField.text!, dtVolt: (VoltButton.titleLabel?.text)!)
        dismiss(animated: true, completion: nil)
    }
    
    var VccData = ""
    var VoltData = ""
    var VccDelegate: DataDelegate?
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VccTextField.text = VccData
        VoltButton.setTitle(VoltData, for: .normal)
        
    }
    

   

}
