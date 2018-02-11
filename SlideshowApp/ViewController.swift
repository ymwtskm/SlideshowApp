//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 小西椋磨 on 2018/02/05.
//  Copyright © 2018年 ryoma.konishi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let picture = ["image_1.jpg","image_2.jpg","image_3.jpg"]
    
    //数
    var number = 0
    var timer: Timer!
    @objc func update(){
        number += 1
        if number > 2 {
            number = 0
        }
        let pictureView: String = picture[number]
        imageView.image = UIImage(named: pictureView)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stopButtonLabel: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //進む
    @IBAction func nextButton(_ sender: Any) {
        if timer == nil {
            number += 1
            if number > 2 {
                number = 0
            }
            let pictureView: String = picture[number]
            imageView.image = UIImage(named: pictureView)
        }
    }
    
    //戻る
    @IBAction func backButton(_ sender: Any) {
        if timer ==  nil {
            number -= 1
            if number < 0 {
                number = 2
            }
            let pictureView: String = picture[number]
            imageView.image = UIImage(named: pictureView)
        }
    }

    //スライドを始める/止める
    @IBAction func stopButton(_ sender: Any) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
            stopButtonLabel.setTitle("停止", for: .normal)
        }else{
            timer.invalidate()
            stopButtonLabel.setTitle("再生", for: .normal)
            timer = nil
        }
    }
    
    //戻ってくる
    @IBAction func back(_ segue: UIStoryboardSegue){
        
    }
    
    //画面変遷の時にスライドを止める
    override func viewDidDisappear(_ animated: Bool) {
        if timer != nil {
            timer.invalidate()
            stopButtonLabel.setTitle("再生", for: .normal)
            timer = nil
        }
    }

    
    //データを渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondViewController:SecondViewController = segue.destination as! SecondViewController
        secondViewController.number = number
        
    }
    
    
    
}

