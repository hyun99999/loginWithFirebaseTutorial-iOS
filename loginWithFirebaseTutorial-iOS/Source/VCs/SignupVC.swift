//
//  SignInVC.swift
//  loginWithFirebaseTutorial-iOS
//
//  Created by kimhyungyu on 2021/06/28.
//

import UIKit
import FirebaseAuth

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
    
    // MARK: - @IBAction Properties
    @IBAction func touchSignupBtn(_ sender: Any) {
        guard let id = idTextField.text else {
            return
        }
        guard let pwd = pwdTextField.text else {
            return
        }
        Auth.auth().createUser(withEmail: id, password: pwd) {(authResut, error) in
            print(error?.localizedDescription as Any)
        
        guard let user = authResut?.user else {
            return
        }

        print(user)
        self.dismiss(animated: true, completion: nil)
        }
    }
}
extension SignupVC {
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
}
