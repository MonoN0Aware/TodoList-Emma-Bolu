//
//  TaskViewController.swift
//  TodoList
//
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
       // guard let item = self.task else{return}
        
      //   task?.remove(at:indexPath.row)
        
    }
}
