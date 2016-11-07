//
//  MainViewController.swift
//  二次源
//
//  Created by 李建文 on 2016/10/16.
//  Copyright © 2016年 二次源. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UIScrollViewDelegate{

    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var ScrollerView: UIScrollView!
    
    @IBOutlet weak var ScrollerPageControl: UIPageControl!
    
    @IBOutlet weak var leader: UILabel!
    
    var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.tintColor = UIColor.green
        leader.text = "环保节能，从我做起！"
        pictureScroller()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //实现图片滚动播放
    func pictureScroller(){
        //获取ScrollView的宽作为图片的宽；
        let imageW:CGFloat = UIScreen.main.bounds.size.width
        
        //获取屏幕的高的0.25作为图片的高
        let imageH:CGFloat = UIScreen.main.bounds.size.height * 0.3
        
        //图片的Y坐标就在ScrollView的顶端
        let imageY:CGFloat = 0
        
        //轮播的图片数量
        let totalCount:NSInteger = 3
        
        //设置图片的大小，注意Image和ScrollView的关系，其实几张图片是按顺序从左向右依次放置在ScrollView中的，但是ScrollView在界面中显示的只是一张图片的大小，效果类似与画廊；
        //不设置水平滚动条；
        
        self.ScrollerView.showsHorizontalScrollIndicator = false
        self.ScrollerView.showsVerticalScrollIndicator = false
        
        for index in 0 ..< totalCount{
            
            let imageView:UIImageView = UIImageView()
            
            let imageX:CGFloat = CGFloat(index) * imageW

            imageView.frame = CGRect(x: imageX, y: imageY, width: imageW, height: imageH)
            let name:String = String(format: "MainScroller%d", index+1)
            
            imageView.image = UIImage(named: name)
            
            //把图片加入到ScrollView中去，实现轮播的效果；
            self.ScrollerView.addSubview(imageView)
        }
        
        
        
        //需要非常注意的是：ScrollView控件一定要设置contentSize;包括长和宽；
        let contentW:CGFloat = imageW * CGFloat(totalCount);//这里的宽度就是所有的图片宽度之和；
        //self.ScrollerView.contentSize = CGSizeMake(contentW, 0);
        self.ScrollerView.contentSize = CGSize(width: contentW, height: 0)
        self.ScrollerView.isPagingEnabled = true;
        self.ScrollerView.delegate = self;
        self.ScrollerView.contentMode = .scaleAspectFit
        self.ScrollerPageControl.numberOfPages = totalCount;//下面的页码提示器；
        self.addTimer()
        
    }
    
    func nextImage(sender:AnyObject!){//图片轮播；
        var page:Int = self.ScrollerPageControl.currentPage;
        if(page == 2){   //循环；
            page = 0;
        }else{
            page += 1;
        }
        let x:CGFloat = CGFloat(page) * self.ScrollerView.frame.size.width;
        //contentOffset就是设置ScrollView的偏移；
         self.ScrollerView.contentOffset = CGPoint(x: x, y: 0)
    }
    
    //UIScrollViewDelegate中重写的方法；
    //处理所有ScrollView的滚动之后的事件，注意 不是执行滚动的事件；
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //这里的代码是在ScrollView滚动后执行的操作，并不是执行ScrollView的代码；
        //这里只是为了设置下面的页码提示器；该操作是在图片滚动之后操作的；
        let scrollviewW:CGFloat = ScrollerView.frame.size.width;
        let x:CGFloat = ScrollerView.contentOffset.x;
        let page:Int = (Int)((x + scrollviewW/2)/scrollviewW);
        self.ScrollerPageControl.currentPage = page;
        
    }
    
    func addTimer(){
        //图片轮播的定时器；
        self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.nextImage(sender:)), userInfo: nil, repeats: true);
    }
    
    //点击跳转事件
    //func did(){
    
    //}

}
