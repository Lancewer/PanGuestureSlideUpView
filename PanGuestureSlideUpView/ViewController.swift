//
//  ViewController.swift
//  PanGuestureSlideUpView
//
//  Created by lancewer on 1/15/18.
//  Copyright © 2018 lancewer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var slideUpView:SlideUpView!
//    var originSlideViewPoint:CGPoint!
    var slideViewTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        if let slideView = Bundle.main.loadNibNamed("SlideUpView", owner: nil, options: nil)?.first as? SlideUpView{
            self.view.addSubview(slideView)
            slideView.translatesAutoresizingMaskIntoConstraints = false
            slideView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0.0).isActive = true
            slideView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0).isActive = true
            slideView.heightAnchor.constraint(equalToConstant: 1000.0).isActive = true
            slideViewTopConstraint = slideView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height - 200.0)
            slideViewTopConstraint.isActive = true
            
            let panGestureRecongizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
            panGestureRecongizer.maximumNumberOfTouches = 2
            slideView.addGestureRecognizer(panGestureRecongizer)
            slideUpView = slideView
            slideUpView.isMultipleTouchEnabled = true
            slideUpView.isUserInteractionEnabled = true
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func handlePanGesture(_ gestureReconginzer:UIGestureRecognizer){
        if let panGesture = gestureReconginzer as? UIPanGestureRecognizer {
            let translation = panGesture.translation(in: view)
            //reset pan gesture translation
            panGesture.setTranslation(CGPoint.zero, in: view)
            print(translation)
            
            var newConstant = slideViewTopConstraint.constant + translation.y
            if newConstant > view.frame.height - 200 {
                newConstant = view.frame.height - 200
            } else if newConstant < (view.frame.height - slideUpView.bounds.height) {
                newConstant = view.frame.height - slideUpView.bounds.height
            }
            slideViewTopConstraint.constant = newConstant

            
            if panGesture.state == .began {
                // add something you want to happen when the Label Panning has started
            }
            
            if panGesture.state == .ended {
                // add something you want to happen when the Label Panning has ended
            }
            
            if panGesture.state == .changed {
                // add something you want to happen when the Label Panning has been change ( during the moving/panning )
            } else {
                // or something when its not moving
            }
        }
    }
}

