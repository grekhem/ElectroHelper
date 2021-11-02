//
//  ResistorLedViewController.swift
//  ElectroHelper
//
//  Created by Елена on 01.11.2021.
//

import UIKit

protocol DataDelegate {
    func updateVcc(dtVcc: String, dtVolt: String )
    func updateVf(dtVf: String, dtVoltVf: String )
    func updateR(dtR: String, dtOmR: String )
    func updateI(dtI: String, dtAmI: String )
}



class ResistorLedViewController: UIViewController, DataDelegate {
    @IBAction func tap(_ sender: Any) {
        SumLed.resignFirstResponder()
    }
    @IBAction func BackButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var PRWattLabel: UILabel!
    @IBOutlet weak var PLedWattLabel: UILabel!
    
    @IBOutlet weak var VccTooSmall: UILabel!
    @IBAction func LedSumAction(_ sender: Any) {
        PRWattLabel.text = "P(R) = \(roundWatt(i:((AmSum() * AmSum()) * OmSum())))"
        PLedWattLabel.text = "P(LED) = \(roundWatt(i:(AmSum() * VfSum())))"
        if (Int(labelVCC1)! <= (Int(labelVf)! *  Int(SumLedText()))) {
            VccTooSmall.isHidden = false
        } else {
            VccTooSmall.isHidden = true
        }
    }
    
    
    @IBOutlet weak var SumLed: UITextField!
    lazy var SumLedText = {(Double((self.SumLed.text)!)) ?? 0}
    
    @IBOutlet weak var ILabelText: UIButton!
    var labelI = "20"
    var labelAmI = "mA"
    lazy var AmSum = { Double(self.labelI)! * self.calculateAmper(Amper: self.labelAmI)}
    
    @IBOutlet weak var RLabelText: UIButton!
    var labelR = "100"
    var labelOmR = "Ω"
    lazy var OmSum = { Double(self.labelR)! * self.calculateOm(Om: self.labelOmR)}
    
    @IBOutlet weak var VfLabelText: UIButton!
    var labelVf = "2"
    var labelVoltVf = "V"
    lazy var VfSum = { Double(self.labelVf)! * self.calculateVolt(Volt: self.labelVoltVf)}
    
    @IBOutlet weak var VccLabelText: UIButton!
    var labelVCC1 = "5"
    var labelVolt1 = "V"
    lazy var VccSum = { Double(self.labelVCC1)! * self.calculateVolt(Volt: self.labelVolt1)}
    
    func roundOm(i: Double) -> Int {
        var m:Double = 0
   
        switch (i * 1000) {
        case ..<1:
            m = i * 1000000
            labelOmR = "µΩ"
        case ..<1000:
            m = i * 1000
            labelOmR = "mΩ"
        case ..<1000000:
            m = i
            labelOmR = "Ω"
        case ..<1000000000:
            m = i / 1000
            labelOmR = "kΩ"
        case ..<1000000000000:
            m = i / 1000000
            labelOmR = "MΩ"
        default:
            m = i / 1000000000
            labelOmR = "GΩ"
        }
        return Int(m)
        
    }
    
    func roundWatt(i: Double) -> String {
        var m:Double = 0
        var n = ""
   
        switch (i * 1000) {
        case ..<1:
            m = i * 1000000
            n = "µW"
        case ..<1000:
            m = i * 1000
            n = "mW"
        case ..<1000000:
            m = i
            n = "W"
        case ..<1000000000:
            m = i / 1000
            n = "kW"
        case ..<1000000000000:
            m = i / 1000000
            n = "MW"
        default:
            m = i / 1000000000
            n = "GW"
        }
        return "\(round(m)) \(n)"
        }
    
    func roundAm(i: Double) -> Int {
        var m:Double = 0
   
        switch (i * 1000) {
        case ..<1:
            m = i * 1000000
            labelAmI = "µA"
        case ..<1000:
            m = i * 1000
            labelAmI = "mA"
        case ..<1000000:
            m = i
            labelAmI = "A"
        case ..<1000000000:
            m = i / 1000
            labelAmI = "kA"
        case ..<1000000000000:
            m = i / 1000000
            labelAmI = "MA"
        default:
            m = i / 1000000000
            labelAmI = "GA"
        }
        return Int(m)
        }
    
    
    
    
    func calculateOm(Om: String) -> Double {
        var OmInt: Double
        switch Om {
        case "µΩ":
            OmInt = 0.000001
        case "mΩ":
            OmInt = 0.001
        case "Ω":
          OmInt = 1
        case "kΩ":
          OmInt = 1000
        case "MΩ":
          OmInt = 1000000
        case "GΩ":
          OmInt = 1000000000
        default:
          OmInt = 1
        }
        return OmInt
        }
    
    func calculateVolt(Volt: String) -> Double {
        var VoltInt: Double
        switch Volt {
        case "µV":
            VoltInt = 0.000001
        case "mV":
            VoltInt = 0.001
        case "V":
            VoltInt = 1
        case "kV":
            VoltInt = 1000
        case "MV":
            VoltInt = 1000000
        case "GV":
            VoltInt = 1000000000
        default:
            VoltInt = 1
        }
        return VoltInt
        }
    
    func calculateAmper(Amper: String) -> Double {
        var AmperInt: Double
        switch Amper {
        case "µA":
            AmperInt = 0.000001
        case "mA":
            AmperInt = 0.001
        case "A":
            AmperInt = 1
        case "kA":
            AmperInt = 1000
        case "MA":
            AmperInt = 1000000
        case "GA":
            AmperInt = 1000000000
        default:
            AmperInt = 1
        }
        return AmperInt
        }
   
    func updateR(dtR: String, dtOmR: String) {
        RLabelText.setTitle("\(dtR) \(dtOmR)", for: .normal )
        labelR = dtR
        labelOmR = dtOmR
        labelI = "\(roundOm(i:((VccSum() - (VfSum()) * SumLedText() ) / OmSum())))"
        ILabelText.setTitle("\(labelI) \(labelAmI)", for: .normal)
        PRWattLabel.text = "P(R) = \(roundWatt(i:((AmSum() * AmSum()) * OmSum())))"
        PLedWattLabel.text = "P(LED) = \(roundWatt(i:(AmSum() * VfSum())))"
        
    }
    
    func updateI(dtI: String, dtAmI: String) {
        ILabelText.setTitle("\(dtI) \(dtAmI)", for: .normal )
        labelI = dtI
        labelAmI = dtAmI
        labelR = "\(roundOm(i:((VccSum() - (VfSum() * SumLedText())) / AmSum())))"
        RLabelText.setTitle("\(labelR) \(labelOmR)", for: .normal)
        if (Int(labelVCC1)! <= (Int(labelVf)! *  Int(SumLedText()))) {
            VccTooSmall.isHidden = false
        } else {
            VccTooSmall.isHidden = true
        }
        PRWattLabel.text = "P(R) = \(roundWatt(i:((AmSum() * AmSum()) * OmSum())))"
        PLedWattLabel.text = "P(LED) = \(roundWatt(i:(AmSum() * VfSum())))"
    }
    
    func updateVf(dtVf: String, dtVoltVf: String) {
        VfLabelText.setTitle("\(dtVf) \(dtVoltVf)", for: .normal )
        labelVf = dtVf
        labelVoltVf = dtVoltVf
        labelR = "\(roundOm(i:((VccSum() - (VfSum() * SumLedText())) / AmSum())))"
        RLabelText.setTitle("\(labelR) \(labelOmR)", for: .normal)
        if (Int(labelVCC1)! <= (Int(labelVf)! *  Int(SumLedText()))) {
            VccTooSmall.isHidden = false
        } else {
            VccTooSmall.isHidden = true
        }
        PRWattLabel.text = "P(R) = \(roundWatt(i:((AmSum() * AmSum()) * OmSum())))"
        PLedWattLabel.text = "P(LED) = \(roundWatt(i:(AmSum() * VfSum())))"
        
    }
    
    func updateVcc(dtVcc: String, dtVolt: String) {
        VccLabelText.setTitle("\(dtVcc) \(dtVolt)", for: .normal )
        labelVCC1 = dtVcc
        labelVolt1 = dtVolt
        labelR = "\(roundOm(i:((VccSum() - (VfSum() * SumLedText())) / AmSum())))"
        RLabelText.setTitle("\(labelR) \(labelOmR)", for: .normal)
        if (Int(labelVCC1)! <= (Int(labelVf)! *  Int(SumLedText()))) {
            VccTooSmall.isHidden = false
        } else {
            VccTooSmall.isHidden = true
        }
        PRWattLabel.text = "P(R) = \(roundWatt(i:((AmSum() * AmSum()) * OmSum())))"
        PLedWattLabel.text = "P(LED) = \(roundWatt(i:(AmSum() * VfSum())))"
        }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc2 = segue.destination as? PopUpResistLedViewController {
            vc2.VccData = labelVCC1
            vc2.VccDelegate = self
            vc2.VoltData = labelVolt1
        }
        
        if let vc3 = segue.destination as? PopUpVfLedViewController {
            vc3.VfData = labelVf
            vc3.VfDelegate = self
            vc3.VoltVfData = labelVoltVf
        }
        
        if let vc4 = segue.destination as? PopUpResistViewController  {
            vc4.RData = labelR
            vc4.RDelegate = self
            vc4.OmRData = labelOmR
        }
        
        if let vc5 = segue.destination as? PopUpAmperViewController  {
            vc5.IData = labelI
            vc5.IDelegate = self
            vc5.AmIData = labelAmI
        }
    
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VccLabelText.setTitle("\(labelVCC1) \(labelVolt1)", for: .normal)
        VfLabelText.setTitle("\(labelVf) \(labelVoltVf)", for: .normal)
        RLabelText.setTitle("\(labelR) \(labelOmR)", for: .normal)
        ILabelText.setTitle("\(labelI) \(labelAmI)", for: .normal)
        print(SumLedText())
        PRWattLabel.text = "P(R) = \(roundWatt(i:((AmSum() * AmSum()) * OmSum())))"
        PLedWattLabel.text = "P(LED) = \(roundWatt(i:(AmSum() * VfSum())))"
    }
    

   

}
