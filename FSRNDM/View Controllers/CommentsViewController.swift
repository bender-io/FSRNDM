//
//  CommentsViewController.swift
//  FSRNDM
//
//  Created by Brian Hersh on 6/17/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    var thought : Thought?

    // MARK: - IBOutlets
    @IBOutlet weak var commentTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func addButtonTapped(_ sender: Any) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ThoughtsController.shared.comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as? CommentsTableViewCell
        let comment = ThoughtsController.shared.comments[indexPath.row]
        cell?.configureCell(comment: comment)
        
        return cell ?? UITableViewCell()
    }
}
