//
//  MainViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 박우혁 on 2022/03/08.
//

import UIKit

class MainViewController: UIViewController {
   
    @IBOutlet weak var welcomeLable: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    @IBAction func logOutBtnTapped(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}


