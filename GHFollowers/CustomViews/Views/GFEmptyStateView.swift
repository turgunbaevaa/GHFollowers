//
//  GFEmptyStateView.swift
//  GHFollowers
//
//  Created by Aruuke Turgunbaeva on 26/3/24.
//

import UIKit
import SnapKit

class GFEmptyStateView: UIView {
    
    let messageLabel = GFTitleLabel(textAlignment: .center, fontsize: 28)
    let logoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   convenience init(message: String) {
        self.init(frame: .zero)
        messageLabel.text = message
    }
    
    private func configure() {
        addSubviews(messageLabel, logoImageView)
        configureMessageLabel()
        configureLogoImageView()
    }
    
    private func configureMessageLabel() {        
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        
        let messageCenterYConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? -80 : -150
        
        messageLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(messageCenterYConstant)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.height.equalTo(200)
        }
    }
    
    private func configureLogoImageView() {
        let logoBottomConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 80 : 40
        
        logoImageView.image = Images.emptyStateLogo
        
        logoImageView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(1.3)
            make.height.equalTo(self.snp.width).multipliedBy(1.3)
            make.trailing.equalToSuperview().offset(170)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(logoBottomConstant)
        }
    }
}
