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
    case home
    case camera
    case profile
}

/**
The menu
 */
class MenuViewController: UITableViewController {

    var didTapMenuType: ((MenuType) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let menuType = MenuType(rawValue:  indexPath.row) else { return }
        
        dismiss(animated: true) { [weak self] in
            print("Dismissing: \(menuType)")
            self?.didTapMenuType?(menuType)
        }
    }
    
}
