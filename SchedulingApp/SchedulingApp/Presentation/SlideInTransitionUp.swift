//
//  SlideInTransitionUp.swift
//  SchedulingApp
//
//
//https://www.raywenderlich.com/3636807-uipresentationcontroller-tutorial-getting-started
//^^This is a link to a slide in transition tutorial that looks very good and detailed, different from the video one.
//  What's great is it's a left, right, and bottom slide, which was my original original idea.
//
//  Created by Hope Welch on 5/7/20.
//  Copyright © 2020 PWGTC. All rights reserved.
//

import UIKit

class SlideInTransitionUp: NSObject, UIViewControllerAnimatedTransitioning {

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
       // presentingViewController.dismiss(animated: true)
        print("HANDLETAP SLIDE")
        //dismiss(animated: true)
        dismissingView.dismiss(animated: true)

    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from) else { return }
        dismissingView = fromViewController
        let containerView = transitionContext.containerView
        print("UUUUUPPPPP")
        //0.7 makes it slid 70% across
        let finalWidth = toViewController.view.bounds.width
        let finalHeight = toViewController.view.bounds.height * 0.7
        let regHeight = toViewController.view.bounds.height
        //print("Inside SlideInTransition->animateTransition->before if isPresenting")
        if isPresenting {
            //Add dimming view
            dimmingView.translatesAutoresizingMaskIntoConstraints = false
            dimmingView.backgroundColor = .black
            dimmingView.alpha = 0.0
            containerView.addSubview(dimmingView)
            dimmingView.frame = containerView.bounds
//            print("About to declare tap recognizer in SLide")
            let recognizer = UITapGestureRecognizer(target: self,
                                                    action: #selector(handleTap(recognizer:)))
            dimmingView.addGestureRecognizer(recognizer)
            
            //Add menu view controller to container
            containerView.addSubview(toViewController.view)
            
            //Initial frame off the screen
            toViewController.view.frame =  CGRect(x: 0, y: regHeight, width: finalWidth, height: finalHeight)
        }


        //Animate on screen
        let transform = {
            self.dimmingView.alpha = 0.5
            toViewController.view.transform = CGAffineTransform(translationX: 0, y: -finalHeight)
        }
        
        //Animate back off screen
        let identity = {
            self.dimmingView.alpha = 0.0
            fromViewController.view.transform = .identity
        }
        //print("in SlideInTransition after let identity")
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
