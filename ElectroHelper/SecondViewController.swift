//
//  SecondViewController.swift
//  ElectroHelper
//
//  Created by Елена on 19.10.2021.
//

import UIKit

var firstVar:Double = 0
var secondVar:Double = 0
var thirdVar:Double = 0
var fourthVar:Double = 1
var titleVar = ""
var chooseButton = 6
func result() -> Double {
    var i = (firstVar + secondVar + thirdVar)*fourthVar
    switch chooseButton {
    case 3:
        i = (secondVar + thirdVar)*fourthVar
    case 4:
        i = (secondVar + thirdVar)*fourthVar
    default:
        i = (firstVar + secondVar + thirdVar)*fourthVar
    }
    switch i {
    case 1000..<1000_000:
        titleVar = "kΩ"
        i = i / 1000
    case 0..<1000:
        titleVar = "Ω"
    case 1000_000..<1000_000_000:
        titleVar = "MΩ"
        i = i / 1000_000
    case 1000_000_000..<1000_000_000_000:
        titleVar = "GΩ"
        i = i / 1000_000_000
    default:
        titleVar = "error"
        }
    return i
}

class SecondViewController: UIViewController {

    @IBOutlet weak var FirstLineButton: UIStackView!
    @IBOutlet weak var SecondLineButton: UIStackView!
    @IBOutlet weak var ThirdLineButton: UIStackView!
    @IBOutlet weak var FourthLineButton: UIStackView!
    @IBOutlet weak var FifthLineButton: UIStackView!
    @IBOutlet weak var SixthLineButton: UIStackView!
    @IBOutlet weak var FirstLabel: UILabel!
    @IBOutlet weak var SecondLabel: UILabel!
    @IBOutlet weak var ThirdLabel: UILabel!
    @IBOutlet weak var FourthLabel: UILabel!
    @IBOutlet weak var FifthLabel: UILabel!
    @IBOutlet weak var SixthLabel: UILabel!
    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var LabelOm: UILabel!
    @IBOutlet weak var AccuracyLabel: UILabel!
    @IBOutlet weak var TCRLabel: UILabel!
    
    
     
    
    @IBAction func ThreeButton(_ sender: Any) {
        FirstLineButton.isHidden = true
        SecondLineButton.isHidden = false
        ThirdLineButton.isHidden = false
        FourthLineButton.isHidden = false
        FifthLineButton.isHidden = true
        SixthLineButton.isHidden = true
        
        FirstLabel.isHidden = true
        FifthLabel.isHidden = true
        SixthLabel.isHidden = true
        chooseButton = 3
        AccuracyLabel.text = "\u{00B1}20%"
        TCRLabel.isHidden = true
    }
    @IBAction func FourButton(_ sender: Any) {
        FirstLineButton.isHidden = true
        SecondLineButton.isHidden = false
        ThirdLineButton.isHidden = false
        FourthLineButton.isHidden = false
        FifthLineButton.isHidden = false
        SixthLineButton.isHidden = true
        
        FirstLabel.isHidden = true
        FifthLabel.isHidden = false
        SixthLabel.isHidden = true
        chooseButton = 4
        TCRLabel.isHidden = true
    }
    @IBAction func FiveButton(_ sender: Any) {
        FirstLineButton.isHidden = false
        SecondLineButton.isHidden = false
        ThirdLineButton.isHidden = false
        FourthLineButton.isHidden = false
        FifthLineButton.isHidden = false
        SixthLineButton.isHidden = true
        
        FirstLabel.isHidden = false
        FifthLabel.isHidden = false
        SixthLabel.isHidden = true
        chooseButton = 5
        TCRLabel.isHidden = true
    }
    @IBAction func SixButton(_ sender: Any) {
        FirstLineButton.isHidden = false
        SecondLineButton.isHidden = false
        ThirdLineButton.isHidden = false
        FourthLineButton.isHidden = false
        FifthLineButton.isHidden = false
        SixthLineButton.isHidden = false
        
        FirstLabel.isHidden = false
        FifthLabel.isHidden = false
        SixthLabel.isHidden = false
        chooseButton = 6
        TCRLabel.isHidden = false
    }
   
    @IBOutlet var AllButton: [UIButton]!
    
    
    @IBAction func BackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
        
    
  
    
    @IBAction func FirstCollect(_ sender: UIButton) {
        FirstLabel.backgroundColor = sender.backgroundColor
        firstVar = Double((sender.titleLabel?.text)!) ?? 0
        ResultLabel.text = String(result())
        LabelOm.text = titleVar
    }
        
    @IBAction func SecondCollect(_ sender: UIButton) {
        SecondLabel.backgroundColor = sender.backgroundColor
        secondVar = Double((sender.titleLabel?.text)!) ?? 0
        ResultLabel.text = String(result())
        LabelOm.text = titleVar
    }
    
    @IBAction func ThirdCollect(_ sender: UIButton) {
        ThirdLabel.backgroundColor = sender.backgroundColor
        thirdVar = Double((sender.titleLabel?.text)!) ?? 0
        ResultLabel.text = String(result())
        LabelOm.text = titleVar
    }
    @IBAction func FourthCollect(_ sender: UIButton) {
        FourthLabel.backgroundColor = sender.backgroundColor
        fourthVar = Double((sender.titleLabel?.text)!) ?? 0
        ResultLabel.text = String(result())
        LabelOm.text = titleVar
    }
    @IBAction func FifthCollect(_ sender: UIButton) {
        FifthLabel.backgroundColor = sender.backgroundColor
        AccuracyLabel.text = "\u{00B1}\((sender.titleLabel?.text)!)%"
    }
    @IBAction func SixthCollect(_ sender: UIButton) {
        SixthLabel.backgroundColor = sender.backgroundColor
        TCRLabel.text = " \((sender.titleLabel?.text)!)ppm/K"
    }
    
    
    
    
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        AccuracyLabel.text = "\u{00B1}20%"
        AllButton.forEach { (btn) in
            btn.layer.cornerRadius = btn.frame.height / 7
            if btn.isOpaque {
                btn.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                btn.layer.borderWidth = 0
            } else {
                btn.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                btn.layer.borderWidth = 1
                
            }
            
        }

        
    }
    


}


