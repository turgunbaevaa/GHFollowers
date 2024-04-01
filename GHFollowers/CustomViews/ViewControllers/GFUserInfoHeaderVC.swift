//
//  GFUserInfoHeaderVC.swift
//  GHFollowers
//
//  Created by Aruuke Turgunbaeva on 27/3/24.
//

import UIKit
import SnapKit

class GFUserInfoHeaderVC: UIViewController {
    
    let avatarImgView = GFAvatarImageView(frame: .zero)
    let userNameLabel = GFTitleLabel(textAlignment: .left, fontsize: 34)
    let nameLabel = GFSecondaryTitleLabel(fontSize: 18)
    let locationImgView = UIImageView()
    let locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    let bioLabel = GFBodyLabel(textAlignment: .left)
    var user: User!
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        layoutUI()
        configureUIElements()
    }
    
    func configureUIElements() {
        avatarImgView.downloadImage(fromURL: user.avatarUrl)
        userNameLabel.text = user.login
        nameLabel.text = user.name ?? ""
        locationLabel.text = user.location ?? "No location"
        bioLabel.text = user.bio ?? ""
        bioLabel.numberOfLines  = 3
        
        locationImgView.image = SFSymbols.location
        locationImgView.tintColor = .secondaryLabel
    }
    
    func addSubViews() {
        view.addSubviews(avatarImgView, userNameLabel, nameLabel, locationImgView, locationLabel, bioLabel)
    }
    
    func layoutUI() {
        let padding: CGFloat = 20
        let textImgPadding: CGFloat = 12
        
        avatarImgView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(padding)
            make.leading.equalToSuperview()
            make.height.width.equalTo(90)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImgView.snp.top)
            make.leading.equalTo(avatarImgView.snp.trailing).offset(textImgPadding)
            make.trailing.equalToSuperview()
            make.height.equalTo(38)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(avatarImgView.snp.centerY).offset(8)
            make.leading.equalTo(avatarImgView.snp.trailing).offset(textImgPadding)
            make.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
        locationImgView.snp.makeConstraints { make in
            make.bottom.equalTo(avatarImgView.snp.bottom)
            make.leading.equalTo(avatarImgView.snp.trailing).offset(textImgPadding)
            make.height.width.equalTo(20)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(locationImgView.snp.centerY)
            make.leading.equalTo(locationImgView.snp.trailing).offset(5)
            make.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
        bioLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImgView.snp.bottom).offset(textImgPadding)
            make.leading.equalTo(avatarImgView.snp.leading)
            make.trailing.equalToSuperview()
            make.height.equalTo(90)
        }
    }
}
