//
//  FollowerCell.swift
//  GHFollowers
//
//  Created by Aruuke Turgunbaeva on 25/3/24.
//

import UIKit
import SnapKit

class FollowerCell: UICollectionViewCell {
    
    static let reuseID = "follower_cell"
    let avatarImgView = GFAvatarImageView(frame: .zero)
    let userNameLabel = GFTitleLabel(textAlignment: .center, fontsize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower: Follower) {
        userNameLabel.text = follower.login
        avatarImgView.downloadImage(from: follower.avatarUrl)
    }
    
    private func configure() {
        let padding: CGFloat = 8
        addSubview(avatarImgView)
        avatarImgView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(padding)
            make.leading.equalToSuperview().offset(padding)
            make.trailing.equalToSuperview().offset(-padding)
            make.height.equalTo(avatarImgView.snp.width)
        }
        
        addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImgView.snp.bottom).offset(padding)
            make.leading.equalToSuperview().offset(padding)
            make.trailing.equalToSuperview().offset(-padding)
            make.bottom.equalToSuperview().offset(-padding)
        }
    }
}
