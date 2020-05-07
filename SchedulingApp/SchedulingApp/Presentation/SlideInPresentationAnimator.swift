//
//  SlideInPresentationAnimator.swift
//  SchedulingApp
//
//  Created by Hope Welch on 5/6/20.
//  Copyright © 2020 PWGTC. All rights reserved.
//

import UIKit

final class SlideInPresentationAnimator: NSObject {
  
  // MARK: - Properties
  //Tells the animation controller the direction from which it should animate the view controller's view
  let direction: PresentationDirection

  //To tell the animation controller whether to present or dismiss the view controller
  let isPresentation: Bool
  
  
  // MARK: - Initializers
    /**
     An initializer that accepts the two declared values above
     */
  init(direction: PresentationDirection, isPresentation: Bool) {
    self.direction = direction
    self.isPresentation = isPresentation
    super.init()
  }
}
// MARK: - UIViewControllerAnimatedTransitioning
extension SlideInPresentationAnimator: UIViewControllerAnimatedTransitioning {
  
    /**
     Define how long the transition takes
     */
    func transitionDuration( using transitionContext: UIViewControllerContextTransitioning?
  ) -> TimeInterval {
    return 0.3
  }

    /**
     
     */
 func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
   // If this is a presentation, the method asks the transitionContext for the view controller associated with .to
    //Moving TO this controller
    //If dismissal, it asks the transitionContext for the view controller associated with .from
    //Moving FROM this controller
   let key: UITransitionContextViewControllerKey = isPresentation ? .to : .from

   guard let controller = transitionContext.viewController(forKey: key)
     else { return }
     
   // If the action is a presentation, your code adds the view controller's view to the view hierarchy. This code uses
    //the transitionContext to get the container view
   if isPresentation {
     transitionContext.containerView.addSubview(controller.view)
   }

   // Calculate the frames that are animated from and to.
    //Asks the transitionContext for the view's frame when it's presented
   let presentedFrame = transitionContext.finalFrame(for: controller)
    //Tricky task of calculating the view's frame when it's dismissed. Sets the frame origin so it's just outside the visible area
    //based on the presentation direction
   var dismissedFrame = presentedFrame
   switch direction {
   case .left:
     dismissedFrame.origin.x = -presentedFrame.width
   case .right:
     dismissedFrame.origin.x = transitionContext.containerView.frame.size.width
   case .top:
     dismissedFrame.origin.y = -presentedFrame.height
   case .bottom:
     dismissedFrame.origin.y = transitionContext.containerView.frame.size.height
   }
     
   //Determine the transition's initial and final frames.
   let initialFrame = isPresentation ? dismissedFrame : presentedFrame
   let finalFrame = isPresentation ? presentedFrame : dismissedFrame
     
   //Animates the view from initial to final frame.
   let animationDuration = transitionDuration(using: transitionContext)
   controller.view.frame = initialFrame
   UIView.animate(
     withDuration: animationDuration,
     animations: {
       controller.view.frame = finalFrame
   }, completion: { finished in
     if !self.isPresentation {
       controller.view.removeFromSuperview()
     }
     transitionContext.completeTransition(finished)
   })
 }

}

