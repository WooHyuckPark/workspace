//
//  ViewController.swift
//  oddEvenGame
//
//  Created by 박우혁 on 2022/03/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var computerBallCountLbl: UILabel!
    @IBOutlet weak var userBallCountLbl: UILabel!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var fistImage: UIImageView!
    
    
    var comBallsCount: Int = 20
    var userBallsCount: Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        computerBallCountLbl.text = String(comBallsCount)
        userBallCountLbl.text = String(userBallsCount)
        self.imageContainer.isHidden = true
    }

    @IBAction func gameStartButton(_ sender: Any) {
        self.imageContainer.isHidden = false
        UIView.animate(withDuration: 3.0) {
           
        }
        
        UIView.animate(withDuration: 3.0) {
            self.fistImage.transform = CGAffineTransform(scaleX: 5, y: 5)
            self.fistImage.transform = CGAffineTransform(scaleX: 1, y: 1)
        } completion: { _ in
            self.imageContainer.isHidden = true
            self.showalert()
        }

        
        self.showalert()
       
    }
    
    func showalert() {
        let alert = UIAlertController.init(title: "GAME START", message: "홀/짝을 선택해주세요.", preferredStyle: .alert
        )
        
        let oddBtn = UIAlertAction.init(title: "홀", style: .default) { _ in
            print("홀 버튼을 클릭했습니다.")
           
            guard let input = alert.textFields?.first?.text, let value = Int(input) else{
                return
            }
            
            self.getWinner(count: value, select: "홀")
        }
        
        let evenBtn = UIAlertAction.init(title: "짝", style: .default) { _ in
            print("짝 버튼을 클릭했습니다.")
           
            guard let input = alert.textFields?.first?.text else{
                return
            }
            
            guard let value = Int(input) else{
                return
            }
            self.getWinner(count: value, select: "짝")
        }
        
        alert.addTextField { textField in
            textField.placeholder = "베팅할 구슬의 개수를 입력해주세요."
        }
         
        
        alert.addAction(oddBtn)
        alert.addAction(evenBtn)
        
        self.present(alert, animated: true) {
            print("화면이 띄워졌습니다.")
        }
    }
    
    
    func getWinner(count: Int, select: String){
        
        let com = self.getRandom()
        let comType = com % 2 == 0 ? "짝" : "홀"
        
        var result = comType
        if comType == select {
            print("User Win")
            result = result + "(User Win)"
            self.resultLbl.text = result
            self.calculateBalls(winner: "user", count: count)
        }else{
            result = result + "(Computer Win)"
            print("Computer Win")
            self.resultLbl.text = result
            self.calculateBalls(winner: "com", count: count)
        }
        
        
    }
    
    func checkAccountEmpty(balls:Int) -> Bool {
        return balls == 0
    }
    
    
    func calculateBalls(winner: String, count: Int){
        if winner == "com" {
            self.userBallsCount = self.userBallsCount - count
            self.comBallsCount = self.comBallsCount + count
            
            if self.checkAccountEmpty(balls: self.userBallsCount) {
                self.resultLbl.text = "컴퓨터 최종승리"
            }
        }else {
            self.userBallsCount = self.userBallsCount + count
            self.comBallsCount = self.comBallsCount - count
       
            if self.checkAccountEmpty(balls: self.comBallsCount){
                self.resultLbl.text = "사용자 최종승리"
                
            }
        
        }
        
        self.userBallCountLbl.text =  "\(self.userBallsCount)"
        self.computerBallCountLbl.text =  "\(self.comBallsCount)"
    }
    
    
    func getRandom() -> Int{
        return Int(arc4random_uniform(10) + 1)
    }
}

