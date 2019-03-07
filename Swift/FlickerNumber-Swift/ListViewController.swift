//
//  ListViewController.swift
//  FlickerNumber
//
//  Created by DeJohn Dong on 15/11/9.
//  Copyright © 2015年 DDKit. All rights reserved.
//

import UIKit

class ListViewController : UITableViewController {
    
    var dataList = ["Flicker An Integer Number",
                    "Flicker A Float Number",
                    "Flicker A Format Number",
                    "Flicker An Attribute Number",
                    "Flicker An All Number"]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.title = (sender as! String)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "typeCell")!
        cell.textLabel?.text = dataList[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "go2FlickerNumber", sender: dataList[indexPath.row])
    }
}
