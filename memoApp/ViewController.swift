//
//  ViewController.swift
//  memoApp
//
//  Created by Senda Kotaro on 2018/08/04.
//  Copyright © 2018年 xyz. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var memoTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("よばれた")
        
        memoTextView.delegate = self
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memoTextView.text = appDelegate.lastText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let appDelegate = UIApplication.shared.delegate
            as! AppDelegate
        appDelegate.lastText = textView.text
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        let userDefaults = UserDefaults.standard
        
        let text = memoTextView.text
        
        userDefaults.set(text, forKey: "lastText")
    //アラートの処理
        let saveAlertContoroller = UIAlertController(title:"保存しました",message:"メモの内容を保存しました", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ok",style: .default, handler: nil)
        saveAlertContoroller.addAction(okAction)
        
        self.present(saveAlertContoroller, animated: true, completion: nil)
    }
}





