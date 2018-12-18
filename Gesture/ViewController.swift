//
//  ViewController.swift
//  Gesture
//
//  Created by 周越 on 2018/11/24.
//  Copyright © 2018年 周越. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func add_label(_ sender: Any) {
        let x = Int(arc4random()) % Int(view.bounds.width)
        let y = Int(arc4random()) % Int(view.bounds.height)
        
        let label = UILabel(frame: CGRect(x: x, y: y, width: 30, height: 30))
        label.text = "A"
        label.textAlignment = .center
        label.backgroundColor = UIColor.red
        
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = CGSize(width: 5, height: 5)
        label.layer.opacity = 1
        
        view.addSubview(label)
        
        
    }
    
    @IBAction func move_label(_ sender: Any) {
        let x = Int(arc4random()) % Int(view.bounds.width)
        let y = Int(arc4random()) % Int(view.bounds.height)
        for label in view.subviews {
            if label is UILabel {
                UIView.animate(withDuration: 1) {
                    let x = Int(arc4random()) % Int(y)
                    let y = Int(arc4random()) % Int(x)
                    label.center.x = CGFloat(x)
                    label.center.y = CGFloat(y)
                    
                    
                }
            }
        }
    }
    
    @IBAction func delete_label(_ sender: Any) {
        for label in view.subviews{
            if label is UILabel {
                label.removeFromSuperview()
            }
        }
    }
    
}

