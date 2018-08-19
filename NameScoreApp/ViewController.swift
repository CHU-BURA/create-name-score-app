//
//  ViewController.swift
//  NameScoreApp
//
//  Created by Sho Nozaki on 2018/03/25.
//  Copyright © 2018年 Sho Nozaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // Text Field 入る値を変数として定義
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // テキストフィールド周りの処理を書く場所を指定する
        nameText.delegate = self // クラス内に指定
    }
    
    // delegate → ViewControllerクラスにUITextFieldDelegate追加
    // キーボードのreturnキー（今回だとsendキー）押下時の処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // ボタンを押した時の処理
        self.sendButton.sendActions(for: .touchUpInside)
        return true
    }
    
    // Topへ戻った場合において入力された値が保持されたままのため、これを消す処理を追加する → viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // セットされている値を空にする処理
        self.nameText.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 入力した名前が空だった場合のエラー表示 → shouldPerformSegueメソッドは、真偽値を返し、falseの場合は画面が遷移しない仕組み
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // 入力された名前をチェック
        if identifier == "showResult" {
            guard self.nameText.text != "" else {
                // 入力された名前が空文字の場合 → アラートを表示(UIAlertController)
                let alertController = UIAlertController(title: "Error", message: "Please enter your name", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
                return false
            }
            return true
        }
        return true
    }
    
    // 画面遷移する前の処理 → Segueで画面遷移する前に実行される prepare というメソッドに記述する
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // showResult の segue に対してのチェック処理
        // segue の identifier がセットされているかのチェック処理
        guard let identifier = segue.identifier else {
            // セットされていな場合
            return
        }
        
        // identifier が showResult であるかどうかのチェック処理
        if identifier == "showResult" {
            // showResult である場合
            // nameText の中身を ResultViewController の myName にセットする
            let resultVC = segue.destination as! ResultViewController // segue.destination で 遷移先の画面を取り、ResultViewController に合わせるため型キャストをする
            resultVC.myName = self.nameText.text! // text はオプショナル型のため、text! としてunwrapする
            
            // 画面遷移時にキーボードの表示を消す処理 → Text Field からフォーカスを外す
            self.nameText.resignFirstResponder()
        }
    }


}

