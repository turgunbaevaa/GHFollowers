//
//  GFItemInfoView.swift
//  GHFollowers
//
//  Created by Aruuke Turgunbaeva on 27/3/24.
//

import UIKit
import SnapKit

enum ItemInfoType {
    case repos, gists, followers, following
}

class GFItemInfoView: UIView {

    let symbolImgView = UIImageView()
    let titleLabel = GFTitleLabel(textAlignment: .left, fontsize: 14)
    let countLabel = GFTitleLabel(textAlignment: .center, fontsize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(symbolImgView)
        addSubview(titleLabel)
        addSubview(countLabel)
        
        symbolImgView.contentMode = .scaleAspectFill
        symbolImgView.tintColor = .label
        symbolImgView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.height.width.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(symbolImgView.snp.centerY)
            make.leading.equalTo(symbolImgView.snp.trailing).offset(12)
            make.trailing.equalTo(self.snp.trailing)
            make.height.equalTo(18)
        }
        
        countLabel.snp.makeConstraints { make in
            make.top.equalTo(symbolImgView.snp.bottom).offset(4)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.height.equalTo(18)
        }
    }
    
    func set(itemInfoType: ItemInfoType, withCount count: Int) {
        switch itemInfoType {
        case .repos:
            symbolImgView.image = UIImage(systemName: SFSymbols.repos)
            titleLabel.text = "Public Repos"
        case .gists:
            symbolImgView.image = UIImage(systemName: SFSymbols.gists)
            titleLabel.text = "Public Gists"
        case .followers:
            symbolImgView.image = UIImage(systemName: SFSymbols.followers)
            titleLabel.text = "Followers"
        case .following:
            symbolImgView.image = UIImage(systemName: SFSymbols.following)
            titleLabel.text = "Following"
        }
        countLabel.text = String(count)
    }
}
