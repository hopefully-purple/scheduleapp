//
//  MenuTable.swift
//  SchedulingApp
//
//  Created by Hope Welch on 5/6/20.
//  Copyright © 2020 PWGTC. All rights reserved.
//

import UIKit

enum MenuType: Int {
    case profile
    case mySchedule
    case groupSchedule
    case createNew
    case settings
}

class MenuTable{
    
    var didTapMenuType: ((MenuType) -> Void)?
    
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

