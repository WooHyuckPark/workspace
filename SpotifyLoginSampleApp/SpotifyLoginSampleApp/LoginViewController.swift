//
//  LoginViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 박우혁 on 2022/03/08.
//

import UIKit

class LoginViewController: UIViewController{
    
    @IBOutlet weak var emailLoginBtn: UIButton!
    @IBOutlet weak var googleLoginBtn: UIButton!
    @IBOutlet weak var appleLoginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [emailLoginBtn, googleLoginBtn, appleLoginBtn].forEach {
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.cornerRadius = 30
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    @IBAction func googleLoginBtnPressed(_ sender: UIButton) {
    }
    @IBAction func appleLoginBtnPressed(_ sender: UIButton) {
    }
}
