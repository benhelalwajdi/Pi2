//
//  ListStoreViewController.swift
//  Pi
//
//  Created by Louay Baccary on 11/11/18.
//  Copyright © 2018 Louay Baccary. All rights reserved.
//

import UIKit

class ListStoreViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, {
    
    var feedItems: NSArray = NSArray()
    var selectedLocation : LocationModel = LocationModel()
    @IBOutlet weak var listtableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listtableView.delegate = self
        self.listtableView.dataSource = self
        let ListM
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
