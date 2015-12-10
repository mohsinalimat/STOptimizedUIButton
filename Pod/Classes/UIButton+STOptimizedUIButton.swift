//
//  UIButton+AppStoreButton.swift
//  Pods
//
//  Created by Sven Tiigi on 09.12.15.
//
//

import UIKit
import ObjectiveC

var touchDownKey: UInt8 = 0
typealias touchDownActionBlock = (sender: UIButton) -> Void
class TouchDownWrapper : NSObject {
    var block : touchDownActionBlock
    init(block: touchDownActionBlock) {
        self.block = block
    }
}
var touchUpKey: UInt8 = 0
typealias touchUpActionBlock = (sender: UIButton) -> Void
class TouchUpWrapper : NSObject {
    var block : touchUpActionBlock
    init(block: touchUpActionBlock) {
        self.block = block
    }
}

extension UIButton{
    
    func addTouchDownAnimation(block: touchDownActionBlock) {
        objc_setAssociatedObject(self, &touchDownKey, TouchDownWrapper(block: block), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        addTarget(self, action: "handleTouchDownAction:", forControlEvents: .TouchDown)
    }
    
    func handleTouchDownAction(sender: UIButton) {
        let wrapper = objc_getAssociatedObject(self, &touchDownKey) as! TouchDownWrapper
        wrapper.block(sender: sender)
    }
    
    func addTouchUpAnimation(block: touchUpActionBlock) {
        objc_setAssociatedObject(self, &touchUpKey, TouchUpWrapper(block: block), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        addTarget(self, action: "handleTouchUpAction:", forControlEvents: .TouchUpInside)
        addTarget(self, action: "handleTouchUpAction:", forControlEvents: .TouchUpOutside)
    }
    
    func handleTouchUpAction(sender: UIButton) {
        let wrapper = objc_getAssociatedObject(self, &touchUpKey) as! TouchUpWrapper
        wrapper.block(sender: sender)
    }
    
    public func toOptimizedButton(setBorderColor borderColor : UIColor,setTitleColor titleColor : UIColor, setFillColor fillColor : UIColor, setHighlightedTextColor highlightedTextColor : UIColor,isFilled filled : Bool, shoudlAnimate animate : Bool){
        self.layer.borderWidth = 1.0
        self.layer.borderColor = borderColor.CGColor
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
        self.setTitleColor(titleColor, forState: .Normal)
        self.setTitleColor(highlightedTextColor, forState: .Highlighted)
        if filled{
             self.setBackgroundImage(getImageWithColor(fillColor, size: self.bounds.size), forState: .Normal)
            self.setBackgroundImage(getImageWithColor(fillColor, size: self.bounds.size), forState: .Highlighted)
        }else{
            self.setBackgroundImage(getImageWithColor(fillColor, size: self.bounds.size), forState: .Highlighted)
        }
        if animate{
            self.addTouchDownAnimation { sender in
                self.touchDownAnimation()
            }
            self.addTouchUpAnimation { (sender) -> Void in
                self.touchUpAnimation()
            }
        }
    }
    
    private func touchUpAnimation(){
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.transform = CGAffineTransformMakeScale(1.08, 1.08)
            }, completion: { (Bool finished) -> Void in
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.transform = CGAffineTransformIdentity
                })
        })
    }
    
    private func touchDownAnimation(){
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.transform = CGAffineTransformMakeScale(0.9, 0.9)
        })
    }
    
    public func addBounceAnimation(){
        self.addTouchDownAnimation { sender in
            self.touchDownAnimation()
        }
        self.addTouchUpAnimation { (sender) -> Void in
           self.touchUpAnimation()
        }
    }
    
    private func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRectMake(0, 0, size.width, size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
