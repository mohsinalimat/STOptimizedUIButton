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
    
    // Storyboard IBOutlet
    @IBOutlet weak var letsGoButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var unlockButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // You also can optimize your UIButton in your code by calling '.toOptimizedButton'
        self.unlockButton.toOptimizedButton(setBorderColor: UIColor.blueColor(), setTitleColor: UIColor.whiteColor(), setFillColor: UIColor.blueColor(), setHighlightedTextColor: UIColor.whiteColor(),isFilled: true, shoudlAnimate: true)
    }
    
    @IBAction func buttonTouched(sender: UIButton) {
        // Action when Button Touched
        print("Button with Title: \"\(sender.currentTitle!)\" was tapped")
        
    }
}

