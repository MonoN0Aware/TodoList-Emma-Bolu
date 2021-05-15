//
//  ViewController.swift
//  TodoList
//
//  Created by Decagon on 15/05/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet var tableView : UITableView!
    
    var tasks = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("hello world")
        
        self.title = "Tasks"
        tableView.delegate = self
        tableView.dataSource = self
        
        if  !UserDefaults().bool(forKey: "setup"){
            UserDefaults().set(true,forKey: "setup")
            UserDefaults().set(0,forKey: "count")
        }
        
        updateTasks()
    }
    
    func updateTasks() {
        guard let count = UserDefaults().value(forKey: "count")as? Int else{
            return
        }
    }
    
    @IBAction func didTapAdd(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "entry") as! EntryViewController
        vc.title = "New Task"
        vc.update = {
            DispatchQueue.main.async{
                self.updateTasks()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
}

