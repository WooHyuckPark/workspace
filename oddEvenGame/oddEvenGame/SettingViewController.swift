//
//  SettingViewController.swift
//  oddEvenGame
//
//  Created by 박우혁 on 2022/03/04.
//

import UIKit

protocol SettingDelegate {
    func getBallsCount(ballsCount: Int)
}


class SettingViewController: UIViewController {

    @IBOutlet weak var ballsCountTextField: UITextField!
    
    
    
    var settingDelegate: SettingDelegate?
    var defaultBallsCount = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func completeBtnPressed(_ sender: Any) {
        guard let ballsStr = self.ballsCountTextField.text, let balls = Int(ballsStr) else {
            self.settingDelegate?.getBallsCount(ballsCount: self.defaultBallsCount)
            dismiss(animated: true, completion: nil)
            return
        }
        
        self.settingDelegate?.getBallsCount(ballsCount: Int(balls))
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
