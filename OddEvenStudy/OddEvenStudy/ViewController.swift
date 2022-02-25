//
//  ViewController.swift
//  OddEvenStudy
//
//  Created by 박우혁 on 2022/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userBallcountLbl: UILabel!
    @IBOutlet weak var computerBallcountLbl: UILabel!
    @IBOutlet weak var resultLbl: UILabel!
   
    var comBallscount: Int = 20
    var userBallscount: Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        computerBallcountLbl.text = String(comBallscount)
        userBallcountLbl.text = String(userBallscount)
       
    }
    @IBAction func gameStartPressed(_ sender: Any) {
        print("게임시작!!")
        print(self.getRandom())
       
        let alert = UIAlertController.init(title:  "GAME START", message: "홀 짝을 선택해주세요", preferredStyle: .alert)
      
        let oddBtn = UIAlertAction.init(title:  "홀", style: .default) { _ in
            print("홀버튼을 클릭했습니다")
            
            guard let input = alert.textFields?.first?.text, let value = Int(input) else {
                return
            }
            print("입력한 값은 \(input)입니다.")
            
            self.getWinner(count: value, select: "홀")
        }
        let evenBtn = UIAlertAction.init(title:  "짝", style: .default) { _ in
            print("짝버튼을 클릭했습니다")
            
            guard let input = alert.textFields?.first?.text else {
                return
            }
            guard let value = Int(input) else {
                return
            }
            self.getWinner(count: value, select: "짝")
        }
        
        alert.addTextField{ textField in
            textField.placeholder = "베팅할 구슬의 개수를 입력해주세요"
        }
        
        alert.addAction(oddBtn)
        alert.addAction(evenBtn)
        
        self.present(alert, animated: true) {
            print("화면이 띄워졌습니다.")
        }
    }
    
    func getWinner(count: Int, select: String) {
     
        let com = self.getRandom()
        let comType = com % 2 == 0 ? "짝" : "홀"
        
        var result = comType
        if comType == select {
            print("user win")
            result = result + "(User Win)"
            self.calculateBalls(winner: "user", count: count)
        }else {
            print("computer win")
            result = result + "(Computer Win)"
            self.calculateBalls(winner: "com", count: count)
        }
        
        self.resultLbl.text = result
    }
    
    func calculateBalls(winner: String, count: Int){
        if winner == "com" {
            self.userBallscount = self.userBallscount - count
            self.comBallscount = self.comBallscount + count
        }else {
            self.userBallscount = self.userBallscount + count
            self.comBallscount = self.comBallscount - count
        }
        
        self.userBallcountLbl.text = "\(self.userBallscount)"
        self.computerBallcountLbl.text = "\(self.comBallscount)"
    }
    
    
    func getRandom() -> Int {
        return Int(arc4random_uniform(10) + 1)
    }
}

