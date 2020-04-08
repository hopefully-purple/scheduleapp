//
//  SlideInTransition.swift
//  SchedulingApp
//
// MAJOR TODO:::: MAKE THIS REUSABLE?? 
//
//
//https://www.raywenderlich.com/3636807-uipresentationcontroller-tutorial-getting-started
//^^This is a link to a slide in transition tutorial that looks very good and detailed, different from the video one.
//  What's great is it's a left, right, and bottom slide, which was my original original idea.
//
//  Created by Hope Welch on 4/6/20.
//  Copyright © 2020 PWGTC. All rights reserved.
//

import UIKit

class SlideInTransition: NSObject, UIViewControllerAnimatedTransitioning {

    var isPresenting = false
    
    let dimmingView = UIView()
    
    /**
     Frame rate for the slide transition
     */
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from) else { return }
       
        let containerView = transitionContext.containerView
        
        //0.8 makes it slid 80% across
        let finalWidth = toViewController.view.bounds.width * 0.8
        let finalHeight = toViewController.view.bounds.height
        
        if isPresenting {
            //Add dimming view
            dimmingView.backgroundColor = .black
            dimmingView.alpha = 0.0
            containerView.addSubview(dimmingView)
            dimmingView.frame = containerView.bounds
            
            //Add menu view controller to container
            containerView.addSubview(toViewController.view)
            
            //Initial frame off the screen
            toViewController.view.frame =  CGRect(x: -finalWidth, y: 0, width: finalWidth, height: finalHeight)
        }
        
        //Animate on screen
        let transform = {
            self.dimmingView.alpha = 0.5
            toViewController.view.transform = CGAffineTransform(translationX: finalWidth, y: 0)
        }
        
        //Animate back off screen
        let identity = {
            self.dimmingView.alpha = 0.0
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