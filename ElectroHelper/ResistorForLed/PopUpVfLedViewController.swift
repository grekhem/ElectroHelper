//
//  PopUpVfLedViewController.swift
//  ElectroHelper
//
//  Created by Елена on 01.11.2021.
//

import UIKit

class PopUpVfLedViewController: UIViewController {
    @IBOutlet weak var VfTextField: UITextField!
    @IBOutlet weak var VoltVfButton: UIButton!
    @IBOutlet var VoltVfCollect: [UIButton]!
    @IBOutlet private weak var StackVfVolt: UIStackView!
    @IBOutlet private weak var StackVfButton: UIStackView!
    
    
    @IBAction func VoltVfButton(_ sender: UIButton) {
        StackVfButton.isHidden = false
        StackVfVolt.isHidden = true
    }
    
    @IBAction func VoltVfStackButton(_ sender: UIButton) {
        VoltVfData = "\((sender.titleLabel?.text)!)"
        VoltVfButton.setTitle((sender.titleLabel?.text)!, for: .normal)
        StackVfButton.isHidden = true
        StackVfVolt.isHidden = false
        
    }
    
    
    
    @IBAction func OkButton(_ sender: Any) {
        VfDelegate?.updateVf(dtVf: VfTextField.text!, dtVoltVf: (VoltVfButton.titleLabel?.text)!)
        dismiss(animated: true, completion: nil)
    }
    
    var VfData = ""
    var VoltVfData = ""
    var VfDelegate: DataDelegate?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VfTextField.text = VfData
        VoltVfButton.setTitle(VoltVfData, for: .normal)

}
}
