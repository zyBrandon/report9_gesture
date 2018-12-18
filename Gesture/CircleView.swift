

//
//  CircleView.swift
//  Gestures
//
//  Created by 周越 on 2018/11/14.
//  Copyright © 2018年 周越. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {
    
    @IBInspectable var fillcolor:UIColor?
    @IBInspectable var stroke:UIColor?
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    func setup() {
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer: )))
        self.addGestureRecognizer(panRecognizer)
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch(recognizer: )))
        self.addGestureRecognizer(pinchRecognizer)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer: )))
        self.addGestureRecognizer(tapRecognizer)
        
        tapRecognizer.numberOfTouchesRequired = 1
        tapRecognizer.numberOfTapsRequired = 2
    }
    
    @objc func tap(recognizer:UITapGestureRecognizer){
        switch recognizer.state {
        case .recognized:
            self.removeFromSuperview()
            print("double clicked")
        default:
            break
        }
    }
    
    @objc func pinch(recognizer:UIPinchGestureRecognizer){
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            bounds.size = CGSize(width: bounds.width * recognizer.scale, height: bounds.height * recognizer.scale)
            recognizer.scale = 1
        default:
            break
        }
    }
    
    @objc func pan(recognizer:UIPanGestureRecognizer){
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            let translation = recognizer.translation(in: self)
            center.x += translation.x
            center.y += translation.y
            recognizer.setTranslation(.zero, in: self)
            
        default:
            break
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillcolor?.setFill()
        stroke?.setStroke()
        path.fill()
        path.stroke()
    }
    
    
}


