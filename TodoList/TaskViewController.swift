//
//  TaskViewController.swift
//  TodoList
//
//  Created by Decagon on 15/05/2021.
//

import UIKit

class TaskViewController: UIViewController {

    @IBOutlet var label:UILabel!
    
    var task:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = task
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc func deleteTask(){
        //UserDefaults.setValue(newCount, forKey: "count")
    }
}
