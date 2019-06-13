//
//  MainVC.swift
//  FSRNDM
//
//  Created by Brian Hersh on 6/11/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - IBOutlets
    @IBOutlet private weak var segmentControll: UISegmentedControl!
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: - Source of Truth
    private var thoughts : [Thought] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "thoughtCell", for: indexPath) as? ThoughtTableViewCell {
            cell.configureCell(thought: thoughts[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}
