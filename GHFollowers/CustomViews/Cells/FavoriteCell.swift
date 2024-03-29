//
//  FavoriteCell.swift
//  GHFollowers
//
//  Created by Aruuke Turgunbaeva on 28/3/24.
//

import UIKit
import SnapKit

class FavoriteCell: UITableViewCell {

    static let reuseID = "favorite_cell"
    let avatarImgView  = GFAvatarImageView(frame: .zero)
    let userNameLabel  = GFTitleLabel(textAlignment: .left, fontsize: 26)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(favorite: Follower) {
        avatarImgView.downloadImage(fromURL: favorite.avatarUrl)
        userNameLabel.text = favorite.login
    }
    
    
    private func configure() {
        addSubviews(avatarImgView, userNameLabel)
        
        accessoryType        = .disclosureIndicator
        let padding: CGFloat = 12
        
        avatarImgView.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalTo(self.snp.leading).offset(padding)
            make.height.width.equalTo(60)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalTo(avatarImgView.snp.trailing).offset(24)
            make.trailing.equalTo(self.snp.trailing).offset(-padding)
            make.height.equalTo(40)
        }
    }
}
