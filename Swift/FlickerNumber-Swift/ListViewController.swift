//
//  ListViewController.swift
//  FlickerNumber
//
//  Created by DeJohn Dong on 15/11/9.
//  Copyright © 2015年 DDKit. All rights reserved.
//

import UIKit

class ListViewController : UITableViewController {
    
    var dataList = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dataList.add("Flicker An Integer Number")
        dataList.add("Flicker A Float Number")
        dataList.add("Flicker A Format Number")
        dataList.add("Flicker An Attribute Number")
        dataList.add("Flicker An All Number")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.title = (sender as! String);
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "typeCell");
        cell?.textLabel?.text = (dataList.object(at: indexPath.row) as! String)
        return cell!;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "go2FlickerNumber", sender: dataList.object(at: indexPath.row))
    }
}
