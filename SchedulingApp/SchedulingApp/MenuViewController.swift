//
//  MainViewController.swift
//  SchedulingApp
//
//  Created by Hope Welch on 3/25/20.
//  Copyright © 2020 PWGTC. All rights reserved.
//

//import Foundation
import UIKit

enum MenuType: Int {
    case profile
    case mySchedule
    case groupSchedule
    case createNew
    case settings
}

/**
The menu
 */
class MenuViewController: UITableViewController {

    var didTapMenuType: ((MenuType) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //@IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
       // guard sender.view != nil else { return }


        //if didTap x> 80% then dismiss view
        //x = 331.0 -> that's the 80% I do believe
        //var range = toViewController.view.bounds.width * 0.8

       // print(sender.location(in: sender.view).x)

        //sender.location(in: sender.view).self)


   // }
    
//    let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap(_:)))
//            tap.delegate = self
//            self.view.addGestureRecognizer(tap)
//
//
//
//    func handleTap(sender: UITapGestureRecognizer? = nil)
//        {
//            hideView()
//        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let menuType = MenuType(rawValue:  indexPath.row) else { return }
        
//        let numbers = [1, 2, 3, 4, 5]
//
//        let n = numbers[1]
//          print("Inside profile switch case \(n)")
        dismiss(animated: true) { [weak self] in
            print("Dismissing: \(menuType)")
            switch menuType{
                case .profile:
                self?.didTapMenuType?(menuType)
            case .groupSchedule:
                self?.didTapMenuType?(menuType)
            case .mySchedule:
                self?.didTapMenuType?(menuType)
            case .createNew:
                self?.didTapMenuType?(menuType)
                //Here might be where I want to create a new schedule under groups. Tricky part is, internet is saying that has to do with Model
            default:
                break;
            }
            
        }
    }
    
}
