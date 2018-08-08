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
    
    //Maximum Health
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
        bloodBackground()
        //7.63 came from how much damage was left after 10 hits
        if self.armorBarView.frame.size.width > 7.63 {
            self.armorBarView.frame.size.width -= CGFloat(damageAmount)
        } else if self.healthBarView.frame.size.width > 7.63 {
            self.healthBarView.frame.size.width -= CGFloat(damageAmount)
        }
    }
    
    @IBAction func healBar(_ sender: Any) {
        if self.armorBarView.frame.size.width < CGFloat(barAmount) {
            self.armorBarView.frame.size.width += CGFloat(healAmount)
            print(self.armorBarView.frame.size.width)
        } else if self.healthBarView.frame.size.width < CGFloat(barAmount) {
            self.healthBarView.frame.size.width += CGFloat(healAmount)
        }
    }
    
    func bloodBackground() {
        //Label "This is blood btw" comment
        let label = UILabel(frame: CGRect(x: 80, y: 350, width: 200, height: 20))
        label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.center
        //degree 0 starts from the left and degree 180 is on the right
        label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 6)
        label.text = "this is blood btw"
        self.view.addSubview(label)
        
        //Background Red
        self.view.backgroundColor = UIColor.red.withAlphaComponent(0.6)
        
        //delay to program
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // delay one second
            self.view.backgroundColor = UIColor.red.withAlphaComponent(0.7)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // delay one second
            self.view.backgroundColor = UIColor.white
            //remove label
            label.removeFromSuperview()
        }
    }
    
    func deadBackground() {
        
    }
    
}

