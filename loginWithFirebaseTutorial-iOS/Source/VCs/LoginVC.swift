//
//  LoginVC.swift
//  loginWithFirebaseTutorial-iOS
//
//  Created by kimhyungyu on 2021/06/28.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {

    // MARK: - Properties
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var pwdLabel: UILabel!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    
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
        
        signUpBtn.setTitle("회원가입", for: .normal)
        signUpBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        signUpBtn.setTitleColor(.white, for: .normal)
        signUpBtn.backgroundColor = UIColor.systemBlue
        signUpBtn.layer.cornerRadius = 10
        
        logInBtn.setTitle("로그인", for: .normal)
        logInBtn.setTitleColor(.white, for: .normal)
        logInBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        logInBtn.backgroundColor = UIColor.systemBlue
        logInBtn.layer.cornerRadius = 10
    }
    
    func login(id: String, pw: String){
        Auth.auth().signIn(withEmail: id, password: pw) {
            (user, error) in
            if user != nil{
                print("login success")
                
                guard let nextVC = UIStoryboard(name: Const.Storyboard.Name.Main, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.Name.Main) as? MainVC else {
                    return
                }
                nextVC.id = (user?.user.email!)!
                self.present(nextVC, animated: true, completion: nil)
            }
            else{
                print("login fail")
            }
        }
    }
    
    // MARK: - @IBAction Properties
    @IBAction func presentToSignup(_ sender: Any) {
        guard let nextVC = UIStoryboard(name: Const.Storyboard.Name.Signup, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.Name.Signup) as? SignupVC else {
            return
        }
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func presentToMain(_ sender: Any) {
        guard let id = idTextField.text else {
            return
        }
        guard let pwd = pwdTextField.text else {
            return
        }
        login(id: id, pw: pwd)
        
    }
    

}
