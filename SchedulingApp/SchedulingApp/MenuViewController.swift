//
//  MainViewController.swift
//  SchedulingApp
//
//  Created by Hope Welch on 3/25/20.
//  Copyright © 2020 PWGTC. All rights reserved.
//

import UIKit

protocol MenuViewControllerDelegate: AnyObject {
  func menuViewController(controller: MenuViewController, didSelectGames selectedGames: MenuTable)
}

enum MenuType: Int {
    case profile
    case mySchedule
    case groupSchedule
    case createNew
    case settings
}

final class MenuViewController: UITableViewController {
  // MARK: - Properties
  weak var delegate: MenuTableViewControllerDelegate?
  var gamesArray: [Games]!
}

// MARK: - UITableViewDataSource
extension MenuViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return gamesArray.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "GamesCell", for: indexPath) as! GamesTableViewCell

    let games = gamesArray[indexPath.row]
    cell.hostLabel.text = games.host
    cell.yearLabel.text = games.year
    cell.logoImageView.image = UIImage(named: games.flagImageName)

    return cell
  }
}

// MARK: - UITableViewDelegate
extension MenuViewController {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let selectedGames = gamesArray[indexPath.row]
    delegate?.gamesTableViewController(controller: self, didSelectGames: selectedGames)
  }
}

//import Foundation
import UIKit



protocol MenuViewControllerDelegate: AnyObject {
  func menuViewController(controller: MenuViewController)
}
/**
The menu
 */
class MenuViewController: UITableViewController, UIGestureRecognizerDelegate {

    
    //MARK: - Properties
    
    //weak var delegate: MenuViewControllerDelegate?
    
    var didTapMenuType: ((MenuType) -> Void)?
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let menuType = MenuType(rawValue:  indexPath.row) else { return }
        
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
