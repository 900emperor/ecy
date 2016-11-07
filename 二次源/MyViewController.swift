//
//  MyViewController.swift
//  二次源
//
//  Created by 李建文 on 2016/10/16.
//  Copyright © 2016年 二次源. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    @IBOutlet weak var headImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        headImage.layer.masksToBounds = true
        headImage.layer.cornerRadius = UIScreen.main.bounds.height * 0.25 * 0.2 * 1.55
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didLogin(_ sender: AnyObject) {
        print("登录")
        self.performSegue(withIdentifier: "login", sender: nil)
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
