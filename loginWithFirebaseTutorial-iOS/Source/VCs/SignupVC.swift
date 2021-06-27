//
//  SignInVC.swift
//  loginWithFirebaseTutorial-iOS
//
//  Created by kimhyungyu on 2021/06/28.
//

import UIKit

class SignupVC: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var pwdLabel: UILabel!
    @IBOutlet weak var signupBtn: UIButton!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    // MARK: - Methods
    func setUI() {
        idLabel.text = "ID"
        idLabel.font = UIFont.systemFont(ofSize: 15)
        
        pwdLabel.text = "PWD"
        pwdLabel.font = UIFont.systemFont(ofSize: 15)
        
        signupBtn.setTitle("회원가입", for: .normal)
        signupBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        signupBtn.setTitleColor(.white, for: .normal)
        signupBtn.backgroundColor = UIColor.systemBlue
        signupBtn.layer.cornerRadius = 10
    }
    

    // MARK: - @IBAction Properties
    @IBAction func touchSignupBtn(_ sender: Any) {
        self.dismiss(animated: true) {
            //회원가입
        }
    }
}
