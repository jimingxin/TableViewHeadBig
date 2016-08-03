//
//  ViewController.swift
//  TableViewHeadBig
//
//  Created by 嵇明新 on 16/8/3.
//  Copyright © 2016年 lanhe. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var titleArray: Array<String>?
    var headImageView: UIImageView?
    @IBOutlet var baseTableView: UITableView!
    let kScreenHeight = UIScreen.mainScreen().bounds.size.height
    let kScreenWidth = UIScreen.mainScreen().bounds.size.width

    let imageHeight: CGFloat = 375 * 317 / 633
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleArray = Array()
        titleArray!.append("毛泽东")
        titleArray!.append("周恩来")
        titleArray!.append("邓小平")
        titleArray!.append("朱德")
        titleArray!.append("蒋介石")
        titleArray!.append("刘伯承")
        baseTableView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight)
        
        //:MARK 头部放大 将图片的视图添加到Tableview中，并设置TableView的tableHeaderView的Frame
        
        headImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: imageHeight))
        headImageView?.image = UIImage(named: "wumei.png")
        baseTableView.addSubview(headImageView!)
        baseTableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: imageHeight))
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //:MAKR TableView委托代理的实现
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray!.count;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50;
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CellID = "CellID"
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(CellID)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: CellID)
        }
        
        cell?.textLabel?.text = titleArray![indexPath.row]
        return cell!
    }
    
    //:MARK 头部放大 只要是操作ScrollView的委托代理
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offY: CGFloat = scrollView.contentOffset.y
        
        if offY < 0 {
            headImageView!.frame = CGRect(x: offY/2, y: offY, width: kScreenWidth - offY, height: imageHeight - offY)
        }
        
    }
    
}



