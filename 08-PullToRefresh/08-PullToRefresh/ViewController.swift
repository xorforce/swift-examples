//
//  ViewController.swift
//  08-PullToRefresh
//
//  Created by Bhagat  Singh on 26/05/19.
//  Copyright © 2019 Bhagat Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // The tableview data
    let tableViewData = [
        "hello",
        "world",
        "this is",
        "a tutorial",
        "on pull",
        "to refresh"
    ]
    
    //table view iboutlet
    @IBOutlet weak var tableView: UITableView!
    
    //initiate the
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setup the datasource and delegate of the tableview
        //you can also do it via storyboard
        tableView.delegate = self
        tableView.dataSource = self
        
        //helper method to setup the refresh control
        setupRefreshControl()
    }
}

//It is a good idea to migrate logically similar methods to
//an extension. This one contains code related to refresh control
extension ViewController {
    
    fileprivate func setupRefreshControl() {
        //add the method that is going to run on pull of refresh control
        refreshControl.addTarget(self,
                                 action: #selector(refreshControlHandler),
                                 for: .valueChanged)
        //finally add the refresh control to tablview's subviews
        tableView.addSubview(refreshControl)
    }
    
    @objc func refreshControlHandler() {
        //since we don't have actual data right now, this function
        //just delays the reload by 5 seconds to emulate a network request.
        //in prod apps, you'd actually want to call your network
        //request helper method
        DispatchQueue.main.asyncAfter(deadline: .now() +  5 , execute: {
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        })
    }
}

//It is a good idea to migrate logically similar methods to
//an extension. This one contains code related Table view data source and
//delegates
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tableViewData[indexPath.row]
        return cell
    }
}
