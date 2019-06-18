//
//  MainVC.swift
//  FSRNDM
//
//  Created by Brian Hersh on 6/11/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

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
        
        ThoughtsController.shared.handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == nil {
                print("🐷 User.user.user == nil")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let loginVC = storyboard.instantiateViewController(withIdentifier: "loginVC")
                self.present(loginVC, animated: true, completion: nil)
                
            } else {
                print("🐷 else")
                ThoughtsController.shared.setListenerFor(category: self.selectedCategory) { (success) in
                    if success {
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if ThoughtsController.shared.thoughtsListener != nil {
            ThoughtsController.shared.thoughtsListener?.remove()
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thoughts = ThoughtsController.shared.thoughts[indexPath.row]
        performSegue(withIdentifier: "toCommentsVC", sender: thoughts)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCommentsVC" {
            if let destinationVC = segue.destination as? CommentsViewController {
                if let thought = sender as? Thought {
                    destinationVC.thought = thought
                }
            }
        }
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
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch {
            print(" 🐌 Snail it found in \(#function) : \(error.localizedDescription) : \(error)")
        }
    }
}
