//
//  PopUpAmperViewController.swift
//  ElectroHelper
//
//  Created by Елена on 01.11.2021.
//

import UIKit

class PopUpAmperViewController: UIViewController {

    @IBOutlet weak var ITextField: UITextField!
    @IBOutlet weak var AmIButton: UIButton!
    @IBOutlet var AmICollect: [UIButton]!
    @IBOutlet private weak var StackIAm: UIStackView!
    @IBOutlet private weak var StackIButton: UIStackView!
    
    
    @IBAction func AmIButton(_ sender: UIButton) {
        StackIButton.isHidden = false
        StackIAm.isHidden = true
    }
    
    @IBAction func AmIStackButton(_ sender: UIButton) {
        AmIData = "\((sender.titleLabel?.text)!)"
        AmIButton.setTitle((sender.titleLabel?.text)!, for: .normal)
        StackIButton.isHidden = true
        StackIAm.isHidden = false
        
    }
    
    
    
    @IBAction func OkButton(_ sender: Any) {
        IDelegate?.updateI(dtI: ITextField.text!, dtAmI: (AmIButton.titleLabel?.text)!)
        dismiss(animated: true, completion: nil)
    }
    
    var IData = ""
    var AmIData = ""
    var IDelegate: DataDelegate?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ITextField.text = IData
        AmIButton.setTitle(AmIData, for: .normal)

}
}

