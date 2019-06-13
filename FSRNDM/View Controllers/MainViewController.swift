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
    
    // MARK: - Properties
    var selectedCategory = ThoughtCategory.funny
    
    //MARK: - IBOutlets
    @IBOutlet private weak var segmentControll: UISegmentedControl!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        ThoughtsController.shared.thoughtsCollectionRef = Firestore.firestore().collection(ReferenceKeys.thoughts)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ThoughtsController.shared.setListenerFor(category: selectedCategory) { (success) in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        ThoughtsController.shared.thoughtsListener?.remove()
    }
    
    // MARK: - TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ThoughtsController.shared.thoughts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "thoughtCell", for: indexPath) as? ThoughtTableViewCell
        let thought = ThoughtsController.shared.thoughts[indexPath.row]
        cell?.configureCell(thought: thought)
        
        return cell ?? UITableViewCell()
    }
    
    // MARK: - IBActions
    @IBAction func segmentTapped(_ sender: Any) {
        
        switch segmentControll.selectedSegmentIndex {
        case 0:
            selectedCategory = ThoughtCategory.funny
        case 1:
            selectedCategory = ThoughtCategory.serious
        case 2:
            selectedCategory = ThoughtCategory.crazy
        default:
            selectedCategory = ThoughtCategory.popular
        }
        
        ThoughtsController.shared.thoughtsListener?.remove()
        ThoughtsController.shared.setListenerFor(category: selectedCategory) { (success) in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}
