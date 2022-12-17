//
//  ViewController.swift
//  TodoList
//
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var tableView : UITableView!
    
    var tasks = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tasks"
        tableView.delegate = self
        tableView.dataSource = self
        
        if  !UserDefaults().bool(forKey: "setup"){
            UserDefaults().set(true,forKey: "setup")
            UserDefaults().set(0,forKey: "count")
        }
        
        updateTasks()
        //print(tasks)
    }
    
    func updateTasks() {
        tasks.removeAll()
        guard let count = UserDefaults.standard.value(forKey: "count")as? Int else{
            return
        }
        for x in 0..<count {
            if let task = UserDefaults.standard.value(forKey: "task_\(x + 1)") as? String  {
                tasks.append(task)
                
            }
             
        }
        tableView.reloadData()
        
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
        
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "task") as! TaskViewController
        vc.title = "New Task"
        vc.task = tasks[indexPath.row ]
        navigationController?.pushViewController(vc, animated: true)
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
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            //UserDefaults.standard.removeObject(forKey: "\(tasks[indexPath.row])")
            //UserDefaults.standard.setValue(, forKey: "tasks")
            
           
            //updateTasks()
            UserDefaults.standard.setValue(tasks, forKey: "tasks")
//            guard let counts = UserDefaults.standard.value(forKey: "count")as? Int else {
//                return
//            }
          //  UserDefaults.standard.set(,forKey: "tasks")
            tableView.reloadData()
            print(tasks)
        }
    }
    
}

