//
//  EnterEmailViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 박우혁 on 2022/03/08.
//

import UIKit

class EnterEmailViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextBtn.layer.cornerRadius = 30
        
        nextBtn.isEnabled = false
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        emailTextField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
    }
    @IBAction func nextBtnTapped(_ sender: UIButton) {
    }
}
extension EnterEmailViewController:
    UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isEmailEmpty = emailTextField.text == ""
        let isPasswordEmpty = passwordTextField.text == ""
        nextBtn.isEnabled = !isEmailEmpty && !isPasswordEmpty
    }
}
