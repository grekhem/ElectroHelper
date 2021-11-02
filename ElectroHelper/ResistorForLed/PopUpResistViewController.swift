//
//  PopUpResistViewController.swift
//  ElectroHelper
//
//  Created by Елена on 01.11.2021.
//

import UIKit

class PopUpResistViewController: UIViewController {
    @IBOutlet weak var RTextField: UITextField!
    @IBOutlet weak var OmRButton: UIButton!
    @IBOutlet var OmRCollect: [UIButton]!
    @IBOutlet private weak var StackROm: UIStackView!
    @IBOutlet private weak var StackRButton: UIStackView!
    
    
    
    @IBAction func OmRButton(_ sender: UIButton) {
        StackRButton.isHidden = false
        StackROm.isHidden = true
    }
    
    @IBAction func OmRStackButton(_ sender: UIButton) {
        OmRData = "\((sender.titleLabel?.text)!)"
        OmRButton.setTitle((sender.titleLabel?.text)!, for: .normal)
        StackRButton.isHidden = true
        StackROm.isHidden = false
        
    }
    
    
    
    @IBAction func OkButton(_ sender: Any) {
        RDelegate?.updateR(dtR: RTextField.text!, dtOmR: (OmRButton.titleLabel?.text)!)
        dismiss(animated: true, completion: nil)
    }
    
    var RData = ""
    var OmRData = ""
    var RDelegate: DataDelegate?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RTextField.text = RData
        OmRButton.setTitle(OmRData, for: .normal)

}
}
