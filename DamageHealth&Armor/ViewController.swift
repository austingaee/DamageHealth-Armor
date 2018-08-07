//
//  ViewController.swift
//  DamageHealth&Armor
//
//  Created by austin_gae on 8/7/18.
//  Copyright © 2018 Austin Gae. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var armorBarView: UIView!
    
    @IBOutlet weak var healthBarView: UIView!
    
    var damageAmount : Float = 0.0
    var healAmount : Float = 0.0
    
    var barAmount : Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        damageAmount = Float(self.armorBarView.frame.size.width) * 0.10
        healAmount = Float(self.armorBarView.frame.size.width) * 0.05
        barAmount = Float(self.armorBarView.frame.size.width)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func damageBar(_ sender: UIButton) {
        if Float(self.armorBarView.frame.size.width) > 0.0 {
            self.armorBarView.frame.size.width -= CGFloat(damageAmount)
        } 
    }
    
    @IBAction func healBar(_ sender: Any) {
        if Float(self.armorBarView.frame.size.width) < barAmount {
            self.armorBarView.frame.size.width += CGFloat(healAmount)
        }
    }
}

