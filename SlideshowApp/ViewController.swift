//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 里舘 徹 on 2016/09/02.
//  Copyright © 2016年 tooru.satodate. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nextImage: UIImageView!
    
    @IBOutlet weak var prveButton: UIButton!
 
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var startButton: UIButton!
    
    var timer: NSTimer!
    
    // 表示している画像の番号
    var dispImageNo = 0

    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "sample")
        
        nextImage.image = image
        
        startButton.addTarget(self, action: #selector(ViewController.onMyButtonClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        // タイマーを設定
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.onTimer(_:)), userInfo: nil, repeats: true)
        timer.invalidate()
        
        startButton.setTitle("再生", forState: UIControlState.Normal)
    }
    
    override func didReceiveMemoryWarning(){
        
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Image
    
    // 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 画像の名前の配列
        let imageNameArray = [
            "sample",
            "sample2",
            "sample3",
            ]
        
        // 画像の番号が正常な範囲を指しているかチェック
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2{
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        nextImage.image = image
    }


    // MARK: - Timer
    
    func onMyButtonClick(sender : UIButton){
        
        if timer.valid == false {
            
            timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.onTimer(_:)), userInfo: nil, repeats: true)
            
            sender.setTitle("停止", forState: UIControlState.Normal)
            prveButton.enabled = false
            nextButton.enabled = false
        }
            
        else  {
            
            // タイマーストップ
            timer.invalidate()
            
            sender.setTitle("再生", forState: UIControlState.Normal)
            
            prveButton.enabled = true
            nextButton.enabled = true
        }
    }
    
    /**
      * NSTimerによって、一定の間隔で呼び出される関数
      */
    
    func onTimer(timer: NSTimer) {
        
        // 関数が呼ばれていることを確認
        print("onTimer")
        
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
        
        print(dispImageNo)
    }
    
  
    
    // MARK: - Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let nextViewController:NextViewController = segue.destinationViewController as! NextViewController
        
        nextViewController.resultImgs = nextImage.image
        
        // タイマーストップ
        timer.invalidate()
    }
    
    //  MARK: - Action
    
    @IBAction func onTapimage(sender: AnyObject) {
        
        // セグエを使用して画面を遷移
        performSegueWithIdentifier("segue", sender: nil)
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue){
        
        // 他の画面から　segue を使って戻ってきた時に呼ばれる
        startButton.setTitle("再生", forState: UIControlState.Normal)
    }
    
    @IBAction func nextButton(sender: AnyObject) {
        
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
        
    }
    
    @IBAction func prevButton(sender: AnyObject) {
        
        // 表示している画像の番号を1減らす
        dispImageNo -= 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
}

