//
//  UITableView+Ext.swift
//  GHFollowers
//
//  Created by Aruuke Turgunbaeva on 28/3/24.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
