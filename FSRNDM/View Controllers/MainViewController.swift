//
//  MainVC.swift
//  FSRNDM
//
//  Created by Brian Hersh on 6/11/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit
import FirebaseFirestore

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var segmentControll: UISegmentedControl!
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 80
        ThoughtsController.shared.thoughtsCollectionRef = Firestore.firestore().collection(ReferenceKeys.thoughts)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ThoughtsController.shared.fetchAllThoughts { (success) in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Setup Tables
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ThoughtsController.shared.thoughts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "thoughtCell", for: indexPath) as? ThoughtTableViewCell {
            cell.configureCell(thought: ThoughtsController.shared.thoughts[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}
