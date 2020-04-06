//
//  SlideInTransition.swift
//  SchedulingApp
//
//  Created by Hope Welch on 4/6/20.
//  Copyright © 2020 PWGTC. All rights reserved.
//

import UIKit

class SlideInTransition: NSObject, UIViewControllerAnimatedTransitioning {

    var isPresenting = false
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 3.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from) else { return }
       
        let containerView = transitionContext.containerView
        
        let finalWidth = toViewController.view.bounds.width * 0.8
        let finalHeight = toViewController.view.bounds.height
        
        if isPresenting {
            //Add menu view controller to container
            containerView.addSubview(toViewController.view)
            
            //Initial frame off the screen
            toViewController.view.frame =  CGRect(x: -finalWidth, y: 0, width: finalWidth, height: finalHeight)
        }
        
        //Animate on screen
        let transform = {
            toViewController.view.transform = CGAffineTransform(translationX: finalWidth, y: 0)
        }
        
        //Animate back off screen
        let identity = {
            fromViewController.view.transform = .identity
        }
        
        //Animation of the transition
        let duration = transitionDuration(using: transitionContext)
        let isCancelled = transitionContext.transitionWasCancelled
        UIView.animate(withDuration: duration, animations: {
            self.isPresenting ? transform() : identity()
        }) { (_) in
            transitionContext.completeTransition(!isCancelled)
        }
        
    }
    
}
