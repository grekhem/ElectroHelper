//
//  ViewController.swift
//  ElectroHelper
//
//  Created by Елена on 18.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var ChooseButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ChooseButton.forEach { (btn) in
            btn.layer.cornerRadius = btn.frame.height / 4
            btn.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            btn.layer.borderWidth = 1
            btn.titleLabel?.adjustsFontSizeToFitWidth = true
         //   btn.titleLabel?.adjustsFontForContentSizeCategory = true
            btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 10)
            btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            
            
        }
      
        
       
        
    }

    
    
    
    
   
    
}

