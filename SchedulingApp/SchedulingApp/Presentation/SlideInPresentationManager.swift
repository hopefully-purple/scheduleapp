//
//  SlideInPresentationManager.swift
//  
//
//  Created by Hope Welch on 5/6/20.
//

import UIKit

enum PresentationDirection {
    case left
    case top
    case right
    case bottom
}
class SlideInPresentationManager: NSObject {

    //Direction property with default value left
    var direction: PresentationDirection = .left
    
}
//MARK: - UIViewControllerTransitioningDelegate
extension SlideInPresentationManager: UIViewControllerTransitioningDelegate{
    
    /**
     Instantiate a SlideInPresentationController with the direction from SlideInPresentationManager. Return it to use for the presentation
     */
    func presentationController(
      forPresented presented: UIViewController,
      presenting: UIViewController?,
      source: UIViewController
    ) -> UIPresentationController? {
      let presentationController = SlideInPresentationController(
        presentedViewController: presented,
        presenting: presenting,
        direction: direction
      )
      return presentationController
    }
    
    /**
     Returns the animation controller for presenting the view controller.
     */
    func animationController(
      forPresented presented: UIViewController,
      presenting: UIViewController,
      source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
      return SlideInPresentationAnimator(direction: direction, isPresentation: true)
    }

    /**
     Returns the animation controller for dismissing the view controller
     */
    func animationController(
      forDismissed dismissed: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
      return SlideInPresentationAnimator(direction: direction, isPresentation: false)
    }

}
