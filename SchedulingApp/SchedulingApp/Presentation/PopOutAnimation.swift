//
//  PopOutAnimation.swift
//  SchedulingApp
//
//  Created by Hope Welch on 5/8/20.
//  Copyright © 2020 PWGTC. All rights reserved.
//

import UIKit

//Somehow, someway, I want it to 'pop' from the middle
//for now, sliding from the side

class PopOutAnimation: NSObject, UIViewControllerAnimatedTransitioning {

    var isPresenting = false

    let dimmingView = UIView()
    var dismissingView = UIViewController()
    
    /**
     Frame rate for the slide transition
     */
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
@objc func handleTap(recognizer: UITapGestureRecognizer) {
   
    dismissingView.dismiss(animated: true)
}
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from) else { return }
       
        dismissingView = fromViewController
        
        let containerView = transitionContext.containerView
        
        //Resize DayView
       //toViewController.view.fs_height *= 0.4
       //toViewController.view.fs_width *= 0.85
        
        //0.8 makes it slid 80% across
        let finalWidth = toViewController.view.bounds.width * 0.85
        let finalHeight = toViewController.view.bounds.height * 0.4//* 0.35
 
        if isPresenting {
            //Add dimming view
            dimmingView.translatesAutoresizingMaskIntoConstraints = false
            dimmingView.backgroundColor = .black
            dimmingView.alpha = 0.0
            containerView.addSubview(dimmingView)
            dimmingView.frame = containerView.bounds

            let recognizer = UITapGestureRecognizer(target: self,
                                                    action: #selector(handleTap(recognizer:)))
            dimmingView.addGestureRecognizer(recognizer)
            
            //Add Day view controller to container
            containerView.addSubview(toViewController.view)
            
            //Initial frame off the screen
            //toViewController.view.frame =  CGRect(x: finalWidth, y: finalHeight * 0.35, width: finalWidth * 0.85, height: finalHeight * 0.4)
            toViewController.view.frame =  CGRect(x: finalWidth, y: finalHeight * 0.8, width: finalWidth, height: finalHeight)
        }


        //Animate on screen
        let transform = {
            self.dimmingView.alpha = 0.5
            toViewController.view.transform = CGAffineTransform(translationX: -finalWidth * 0.91, y: 0)
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
            print("self is presenting: \(self.isPresenting)")
        }) { (_) in
            transitionContext.completeTransition(!isCancelled)
        }
        
    }
    
}

// MARK: - Private
//private extension SlideInTransition {
//  func setupDimmingView() {
//    dimmingView = UIView()
//    dimmingView.translatesAutoresizingMaskIntoConstraints = false
//    dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
//    dimmingView.alpha = 0.0
//
//    let recognizer = UITapGestureRecognizer(target: self,
//                                            action: #selector(handleTap(recognizer:)))
//    dimmingView.addGestureRecognizer(recognizer)
//  }
//
//  @objc func handleTap(recognizer: UITapGestureRecognizer) {
//    presentingViewController.dismiss(animated: true)
//  }
//}

