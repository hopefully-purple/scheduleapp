//
//  SlideInPresentationController.swift
//  SchedulingApp
//
//  Created by Hope Welch on 5/6/20.
//  Copyright © 2020 PWGTC. All rights reserved.
//

import UIKit

class SlideInPresentationController: UIPresentationController {
    
    // MARK: - Properties
    
    //dimming variable
    private var dimmingView: UIView!
    
    //Declares direction to represent the direction of the presentation
    private var direction: PresentationDirection

    //Declares an initializer that accepts the presented and presenting view controllers, as well as the presentation direction
    init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?,
         direction: PresentationDirection) {
      
      self.direction = direction

      //Calls the designated initializer for UIPresentationController
      super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        
        //Calls the setUpDimmingView to enable the tap dismiss feature we wanted
        setupDimmingView()
    }
    
    /**
     Return the full frame
     */
    override var frameOfPresentedViewInContainerView: CGRect {
        
      //Declare a frame and give it the size calculated in the size(..) function
      var frame: CGRect = .zero
      frame.size = size(forChildContentContainer: presentedViewController,
                        withParentContainerSize: containerView!.bounds.size)

      //For .right and .bottom directions, adjust the origin by moving the x origin and y origin 1/3 of the width or height
      switch direction {
      case .right:
        frame.origin.x = containerView!.frame.width*(1.0/3.0)
      case .bottom:
        frame.origin.y = containerView!.frame.height*(1.0/3.0)
      default:
        frame.origin = .zero
      }
      return frame
    }

    
    //MARK: - Functions
    
    /**
     Make the dimming view fade in along with the presentation
     */
    override func presentationTransitionWillBegin() {
      
      guard let dimmingView = dimmingView else {
        return
      }
        
      //Put the dimmingView into the back of the view hierarchy
      containerView?.insertSubview(dimmingView, at: 0)

      //Constrain the dimming view to the edges of the container view so that it fills the entire screen
      NSLayoutConstraint.activate(
        NSLayoutConstraint.constraints(withVisualFormat: "V:|[dimmingView]|",
          options: [], metrics: nil, views: ["dimmingView": dimmingView]))
      NSLayoutConstraint.activate(
        NSLayoutConstraint.constraints(withVisualFormat: "H:|[dimmingView]|",
          options: [], metrics: nil, views: ["dimmingView": dimmingView]))

      //Set the dimming view alpha
      guard let coordinator = presentedViewController.transitionCoordinator else {
        dimmingView.alpha = 1.0
        return
      }

      //Set the presentation transition?
      coordinator.animate(alongsideTransition: { _ in
        self.dimmingView.alpha = 1.0
      })
    }
    
    /**
     Hide the dimming view when you dismiss the presented controller
     */
    override func dismissalTransitionWillBegin() {
      guard let coordinator = presentedViewController.transitionCoordinator else {
        dimmingView.alpha = 0.0
        return
      }

      coordinator.animate(alongsideTransition: { _ in
        self.dimmingView.alpha = 0.0
      })
    }
    
    /**
     Responds to layout changes in the presentation controller's container view.
     You reset the presented view's frame to fit any changes to the containerview frame
     */
    override func containerViewWillLayoutSubviews() {
      presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    /**
     Give the size of the presented view controller's content to the presentation controller.
     
     This method receives the content container and parent view’s size, and then it calculates the size for the presented content.
     In this code, you restrict the presented view to 2/3 of the screen by returning 2/3 the width for horizontal and 2/3 the height for vertical presentations.
     */
    override func size(forChildContentContainer container: UIContentContainer,
                       withParentContainerSize parentSize: CGSize) -> CGSize {
      switch direction {
      case .left, .right:
        return CGSize(width: parentSize.width*(2.0/3.0), height: parentSize.height)
      case .bottom, .top:
        return CGSize(width: parentSize.width, height: parentSize.height*(2.0/3.0))
      }
    }


}

// MARK: - Private
private extension SlideInPresentationController {
  func setupDimmingView() {
    dimmingView = UIView()
    dimmingView.translatesAutoresizingMaskIntoConstraints = false
    dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
    dimmingView.alpha = 0.0
    
    let recognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
    dimmingView.addGestureRecognizer(recognizer)

  }
    
    /**
     This is the tap dismiss feature
     */
  @objc func handleTap(recognizer: UITapGestureRecognizer){
        presentingViewController.dismiss(animated: true)
  }

}

