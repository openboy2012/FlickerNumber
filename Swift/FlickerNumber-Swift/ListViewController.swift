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
        dataList.addObject("Flicker An Integer Number")
        dataList.addObject("Flicker A Float Number")
        dataList.addObject("Flicker A Format Number")
        dataList.addObject("Flicker An Attribute Number")
        dataList.addObject("Flicker An All Number")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        segue.destinationViewController.title = (sender as! String);
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("typeCell");
        cell?.textLabel?.text = (dataList.objectAtIndex(indexPath.row) as! String)
        return cell!;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("go2FlickerNumber", sender: dataList.objectAtIndex(indexPath.row))
    }
}