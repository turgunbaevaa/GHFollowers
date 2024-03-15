//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Aruuke Turgunbaeva on 24/2/24.
//

import UIKit
import SnapKit

class SearchVC: UIViewController {
    
    let logoImgView = UIImageView()
    
    let userNameTF = GFTextField()
    
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUserNameEntered: Bool { return !userNameTF.text!.isEmpty }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLayouts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func configureLayouts() {
        configureLogoImgView()
        configureTF()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
    }
    
    func createDismissKeyboardTapGesture(){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowerListVC() {
        guard isUserNameEntered else { 
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please, enter a username. We need to know who to look for😀.", buttonTitle: "OK")
            return
        }
        let followerListVC = FollowerListVC()
        followerListVC.userName = userNameTF.text
        followerListVC.title = userNameTF.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    func configureLogoImgView() {
        view.addSubview(logoImgView)
        logoImgView.image = UIImage(named: "gh-logo")
        
        logoImgView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(80)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
    }
    
    func configureTF() {
        view.addSubview(userNameTF)
        userNameTF.delegate = self
        userNameTF.snp.makeConstraints { make in
            make.top.equalTo(logoImgView.snp.bottom).offset(48)
            make.leading.equalTo(view.snp.leading).offset(50)
            make.trailing.equalTo(view.snp.trailing).offset(-50)
            make.height.equalTo(48)
        }
    }
    
    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        callToActionButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-50)
            make.leading.equalTo(view.snp.leading).offset(50)
            make.trailing.equalTo(view.snp.trailing).offset(-50)
            make.height.equalTo(48)
        }
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
