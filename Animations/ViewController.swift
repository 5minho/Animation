//
//  ViewController.swift
//  Animations
//
//  Created by 오민호 on 2017. 10. 28..
//  Copyright © 2017년 오민호. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animatedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func rotate_UIViewAnimation() {
        
        let originTransform = animatedView.transform
        
        UIView.animate(withDuration: 0.5,
                       animations: { [weak self] in
                        self?.animatedView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }) { [weak self] _ in
            self?.animatedView.transform = originTransform
        }
        
    }
    
    func rotate_CoreAnimation() {
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = CGFloat.pi
        rotationAnimation.duration = 0.5
        animatedView.layer.add(rotationAnimation, forKey: "rotationAnimation")
        
    }

    @IBAction func touchUpStartButton(_ sender: UIButton) {
        rotate_UIViewAnimation()
    }
    
}

