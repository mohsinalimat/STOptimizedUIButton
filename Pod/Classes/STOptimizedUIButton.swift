//
//  STAppStoreUIButton.swift
//  Pods
//
//  Created by Sven Tiigi on 10.12.15.
//
//

import UIKit


@IBDesignable
class STOptimizedUIButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 5.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    @IBInspectable var borderWidth: CGFloat = 1 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.CGColor
        }
    }
    @IBInspectable var titleColorStateNormal : UIColor?{
        didSet {
            setTitleColor(titleColorStateNormal!, forState: .Normal)
        }
    }
    @IBInspectable var titleColorStateHighlighted : UIColor?{
        didSet {
            setTitleColor(titleColorStateHighlighted!, forState: .Highlighted)
        }
    }
    @IBInspectable var fillColorHighlighted : UIColor?{
        didSet {
            self.setBackgroundImage(getImageWithColor(fillColorHighlighted!, size: self.bounds.size), forState: .Highlighted)
        }
    }
    @IBInspectable var fillColorNormal : UIColor?{
        didSet {
            self.setBackgroundImage(getImageWithColor(fillColorNormal!, size: self.bounds.size), forState: .Normal)
        }
    }
    @IBInspectable var bounceAnimation : Bool = true{
        didSet {
            if bounceAnimation{
                addBounceAnimation()
            }
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
