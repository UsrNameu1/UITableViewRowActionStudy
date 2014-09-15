//
//  MYViewController.swift
//  UITableViewRowActionStudy
//
//  Created by adachi.yuichi on 2014/09/05.
//  Copyright (c) 2014年 adachi.yuichi. All rights reserved.
//

import UIKit

class MYViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let contents = ["aa", "bb", "cc"] // 表示するコンテンツ
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // コンテンツ内容よりも多くのCellのセパレータを表示しないための処理
        tableView.tableFooterView = UIView()
    }

}

extension MYViewController: UITableViewDelegate {
    
    // こちらのメソッドでindexPathで指定されたCell毎のRowAction配列を設定します
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath)
        -> [AnyObject]? {
        let editAction =
            UITableViewRowAction(style: .Normal, // 削除等の破壊的な操作を示さないスタイル
            title: "edit"){(action, indexPath) in println("\(indexPath) edited")}
        editAction.backgroundColor = UIColor.greenColor()
        let deleteAction =
            UITableViewRowAction(style: .Default, // 標準のスタイル
                title: "delete"){(action, indexPath) in println("\(indexPath) deleted")}
        deleteAction.backgroundColor = UIColor.redColor()
        return [editAction, deleteAction]
    }
    
}

extension MYViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            // モジュール名.クラス名をCellIdentifierとして使用しているため、MYTableViewCell.self.description()でその文字列を取得
            var cell =
            tableView.dequeueReusableCellWithIdentifier(MYTableViewCell.self.description(),
                forIndexPath: indexPath) as MYTableViewCell
            cell.nameLabel.text = contents[indexPath.row]
            return cell
    }
    
    // エディット機能の提供に必要なメソッド
    func tableView(tableView: UITableView,
        commitEditingStyle editingStyle: UITableViewCellEditingStyle,
        forRowAtIndexPath indexPath: NSIndexPath) {
            
    }
}