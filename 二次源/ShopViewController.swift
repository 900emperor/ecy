//
//  ShopViewController.swift
//  二次源
//
//  Created by 李建文 on 2016/10/17.
//  Copyright © 2016年 二次源. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController {

    @IBOutlet weak var Back: UIButton!
    
    var temp:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(temp)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didBack(_ sender: AnyObject) {
        self.presentingViewController!.dismiss(animated: true, completion: nil)
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
