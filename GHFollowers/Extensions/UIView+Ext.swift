//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by Aruuke Turgunbaeva on 28/3/24.
//

import UIKit
import SnapKit

extension UIView {
    
    func pinToEdges(of superview: UIView) {
        self.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
    
}
