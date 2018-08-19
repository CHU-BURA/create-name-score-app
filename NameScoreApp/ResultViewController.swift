//
//  ResultViewController.swift
//  NameScoreApp
//
//  Created by Sho Nozaki on 2018/03/25.
//  Copyright © 2018年 Sho Nozaki. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    // TextFieldに入ってきたデータをSegueを通じて渡された値を受け取る変数を定義
    var myName: String = "" // myNameとして空文字で初期化
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        print("TextFieldの入力値 : " + myName) // TextFieldの入力値を確認(debug)
        
        // 名前をラベルに表示
        self.nameLabel.text = "\(self.myName)'s score is ..."
        
        // 点数の生成・表示
        self.scoreLabel.text = String(arc4random_uniform(101)) // 乱数を生成
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
