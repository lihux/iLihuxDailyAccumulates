
//
//  SLHMasterTableViewController.swift
//  iLihuxDailyAccumulatesInSwift
//
//  Created by lihux on 14/12/17.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

import UIKit



class SLHMasterTableViewController: UITableViewController {

    var accumulates = [SAccumulate]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.loadAccumulatesFromPlist()
    }
    //NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"OAccumulates" ofType:@"plist"];
    //NSArray *tempArray = [NSArray arrayWithContentsOfFile:plistPath];
    //if (tempArray.count > 0) {
    //    NSMutableArray *tempAccumulates = [NSMutableArray array];
    //    for (NSDictionary* dic in tempArray) {
    //        NSString *title = dic[@"title"];
    //        NSString *content = dic[@"content"];
    //        NSString *storyboardID = dic[@"storyboardID"];
    //        [tempAccumulates addObject:[[AccumulateObject alloc] initWith:title content:content storyboardID:storyboardID]];
    //    }
    //    self.accumulates = [NSArray arrayWithArray:tempAccumulates];
    //}
    //[self.tableView reloadData];

    func loadAccumulatesFromPlist()
    {
        let plistPath = Bundle.main.path(forResource: "SAccumulates", ofType: "plist")
        let tempArray = NSArray(contentsOfFile: plistPath!)
        if let temp = tempArray {
            var tempAccumulates = [SAccumulate]()
            for item in temp {
                let dictionary = item as! Dictionary<String, String>
                let title = dictionary["title"]
                let content = dictionary["content"]
                let storyboardID = dictionary["storyboardID"]
                let accumulate = SAccumulate(title: title!, content: content!, storyboardID: storyboardID!)
                tempAccumulates.append(accumulate)
            }
            self.accumulates = tempAccumulates
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.accumulates.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
        let accumulate = self.accumulates[indexPath.row]
        cell?.textLabel?.text = accumulate.title
        return cell!
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let accumulate = self.accumulates[indexPath.row]
        let accumulateViewController = self.storyboard!.instantiateViewController(withIdentifier: accumulate.storyboardID) as UIViewController
        accumulateViewController.title = accumulate.title
        self.navigationController?.pushViewController(accumulateViewController, animated: true)
    }
}
