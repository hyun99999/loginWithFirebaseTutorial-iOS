//
//  MainVC.swift
//  loginWithFirebaseTutorial-iOS
//
//  Created by kimhyungyu on 2021/06/28.
//

import UIKit

class MainVC: UIViewController {
    // MARK: - Properties
    var id: String = ""
    
    // MARK: - @IBOutlet Properties
    @IBOutlet weak var mainLabel: UILabel!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    func setUI() {
        mainLabel.text = "로그인에 성공했습니다! 환영합니다 \(id)님"
    }
}
