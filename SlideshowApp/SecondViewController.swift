//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by 小西椋磨 on 2018/02/10.
//  Copyright © 2018年 ryoma.konishi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let picture = ["image_1.jpg","image_2.jpg","image_3.jpg"]
    
    @IBOutlet weak var imageView: UIImageView!
    //数
    var number = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let pictureView = picture[number]
        imageView.image = UIImage(named: pictureView)

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
