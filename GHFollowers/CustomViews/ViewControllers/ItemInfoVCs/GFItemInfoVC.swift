//
//  GFItemInfoVC.swift
//  GHFollowers
//
//  Created by Aruuke Turgunbaeva on 27/3/24.
//

import UIKit
import SnapKit

protocol ItemInfoVCDelegate: AnyObject {
    
    func didTapGithubProfile(for user: User)
    func didTapGetFollowers(for user: User)
}

class GFItemInfoVC: UIViewController {

    let stackView       = UIStackView()
    let itemInfoViewOne = GFItemInfoView()
    let itemInfoViewTwo = GFItemInfoView()
    let actionButton    = GFButton()
    
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
        configureBackgroundView()
        configureActionButton()
        layoutUI()
        configureStackView()
    }
    
    func configureBackgroundView() {
        view.layer.cornerRadius = 18
        view.backgroundColor    = .secondarySystemBackground
    }
    
    private func configureStackView() {
        stackView.axis         = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(itemInfoViewOne)
        stackView.addArrangedSubview(itemInfoViewTwo)
    }
    
    private func layoutUI() {
        view.addSubviews(stackView, actionButton)
        
        let padding: CGFloat = 20
        
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(padding)
            make.leading.equalToSuperview().offset(padding)
            make.trailing.equalToSuperview().offset(-padding)
            make.height.equalTo(50)
        }
        
        actionButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-padding)
            make.leading.equalToSuperview().offset(padding)
            make.trailing.equalToSuperview().offset(-padding)
            make.height.equalTo(44)
        }
    }
    
    private func configureActionButton() {
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    
    @objc func actionButtonTapped() { }
}
