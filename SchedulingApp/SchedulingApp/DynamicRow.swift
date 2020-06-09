//
//  DynamicRow.swift
//  SchedulingApp
//
//  Created by Hope Welch on 6/8/20.
//  Copyright © 2020 PWGTC. All rights reserved.
//

import UIKit

protocol DynamicRow: class {
    func getCellFor(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func didSelectRow()
}

// empty implementation so that only intrested cells need to worry about this function
extension DynamicRow {
    func didSelectRow() {
        
    }
}
