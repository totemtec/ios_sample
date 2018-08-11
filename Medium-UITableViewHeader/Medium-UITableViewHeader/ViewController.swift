//
//  ViewController.swift
//  Medium-UITableViewHeader
//
//  Created by Yevhenii Veretennikov on 8/27/17.
//  Copyright © 2017 Yevhenii Veretennikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var containerScrollView: UIScrollView!
    @IBOutlet weak var rootContainerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pageControllerContainerView: UIView!
    
    @IBOutlet weak var pageControllerContainerTopAnchor: NSLayoutConstraint!
    @IBOutlet weak var rootContainerHeightAnchor: NSLayoutConstraint!
    
    var pageContainerInitialHeight = CGFloat()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        containerScrollView.delegate = self
        tableView.delegate = self
        tableView.dataSource = self

        // add a top edge inset for table view.
        tableView.contentInset = UIEdgeInsets(top: pageControllerContainerView.frame.height, left: 0, bottom: 0, right: 0)

        pageContainerInitialHeight = pageControllerContainerView.frame.height

        // update table view content height
        tableView.layoutIfNeeded()

        // adjust scroll view content height using rootContainer height anchor
        rootContainerHeightAnchor.constant = tableView.contentSize.height + pageContainerInitialHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30 // random number of cells
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let y = scrollView.contentOffset.y - tableView.contentOffset.y

        pageControllerContainerTopAnchor.constant = y - pageContainerInitialHeight

        if pageControllerContainerTopAnchor.constant > 0 || pageControllerContainerTopAnchor.constant == -pageContainerInitialHeight {
            pageControllerContainerTopAnchor.constant = 0
        }
    }
    
}

