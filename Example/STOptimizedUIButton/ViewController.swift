//
//  ViewController.swift
//  STAppStoreUIButton
//
//  Created by SvenTiigi on 12/09/2015.
//  Copyright (c) 2015 SvenTiigi. All rights reserved.
//

import UIKit
import STOptimizedUIButton

class ViewController: UIViewController {
    
    @IBOutlet weak var letsGoButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var unlockButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.unlockButton.toAppStoreButton(setBorderColor: UIColor.blueColor(), setTitleColor: UIColor.whiteColor(), setFillColor: UIColor.blueColor(), setHighlightedTextColor: UIColor.whiteColor(),isFilled: true, shoudlAnimate: true)
        
    }
    
    @IBAction func buttonTouched(sender: UIButton) {
        print("Button with Title: \"\(sender.currentTitle!)\" was tapped")
        
    }
}

