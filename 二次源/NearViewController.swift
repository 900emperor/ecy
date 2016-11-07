//
//  NearViewController.swift
//  二次源
//
//  Created by 李建文 on 2016/10/16.
//  Copyright © 2016年 二次源. All rights reserved.
//

import UIKit

class NearViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var itemName:[String] = ["   地址：大连市甘井子区回收站A","大连市甘井子区回收站B","大连市甘井子区回收站C","大连市甘井子区回收站D"]
    
    private var itemImage = [UIImage(named: "shop1")!,
                                 UIImage(named: "shop2")!,
                                 UIImage(named: "shop3")!,
                                 UIImage(named: "shop1")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView!.register(UINib(nibName:"TableViewCell", bundle:nil),
                                    forCellReuseIdentifier:"tabcell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemName.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "tabcell") as! TableViewCell
            cell.Address.text = itemName[indexPath.row]
            cell.infoImage.image = itemImage[indexPath.row]
            return cell
    }
    
    //单元格高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath)
        -> CGFloat {
            return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let temp = indexPath.row
        self.performSegue(withIdentifier: "waitShop", sender: temp)
    }
    
    //在这个方法中给新页面传递参数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "waitShop"{
            let controller = segue.destination as! WaitShopViewController
            controller.temp = sender as? String
        }
    }
}
