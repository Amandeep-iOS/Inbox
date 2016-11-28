//
//  AllConversationsViewController.swift
//  Inbox
//
//  Created by Mikael Teklehaimanot on 11/28/16.
//  Copyright © 2016 Mikael Teklehaimanot. All rights reserved.
//

import UIKit
import CoreData

class AllConversationsViewController: UIViewController {
    
    var context : NSManagedObjectContext?
    private var fetchedResultsController : NSFetchedResultsController<Conversation>?
    
    private let tableView = UITableView(frame: CGRect.zero, style: .plain)
    private let cellIdentifier = "ConvoCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Messages"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "new-chat"), style: .plain, target: self, action: #selector(AllConversationsViewController.newConvo))
        automaticallyAdjustsScrollViewInsets = false
        
        tableView.register(ConversationCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        let tableViewContstraints = [
            tableView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor)
        ]
        NSLayoutConstraint.activate(tableViewContstraints)
        
        if let context = context {
            
            let request : NSFetchRequest<Conversation> = NSFetchRequest(entityName: "Conversation")
            request.sortDescriptors = [NSSortDescriptor(key: "lastMessage", ascending: false)]
            fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            do {
                try fetchedResultsController?.performFetch()
            } catch let error as NSError {
                print("There was an error performing fetch on AllConversationsVC: \(error)")
            }
        }
        fakeData()
    }
    
    func newConvo() {
        
    }
    
    func fakeData() {
        
        guard let context = context else { return }
        let convo = NSEntityDescription.insertNewObject(forEntityName: "Conversation", into: context) as? Conversation
    }
    
    func configureCell (cell: UITableViewCell, indexPath: IndexPath) {
        
        let cell = cell as! ConversationCell
        guard let convo = fetchedResultsController?.object(at: indexPath) else { return } //not casting necessary b/c fetchResultsVC is generic
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/DD/YY"
        cell.nameLabel.text = "Mitta"
        cell.messageLabel.text = "Hey!"
        cell.dateLabel.text = formatter.string(from: Date())
    }
    
    

}
















































