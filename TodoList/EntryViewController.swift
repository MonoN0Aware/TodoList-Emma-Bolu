//
//  EntryViewController.swift
//  TodoList
//
//

import UIKit

class EntryViewController: UIViewController, UITextViewDelegate {
  //  @IBOutlet var field : UITextField!
    @IBOutlet var textView :UITextView!
    
    var update:(()->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   field.delegate = self
        textView.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "save", style: .done, target: self, action: #selector(saveTask))
        
    }
    func textViewShouldReturn ( _ textView: UITextView ) -> Bool {
        saveTask()
        
        return true
    }
    
    
    
    @objc func saveTask(){
        guard let text = textView.text, !text.isEmpty else {
            return
        }
        
        guard let count = UserDefaults.standard.value(forKey: "count")as? Int else {
            return
        }
        
        let newCount = count + 1
        
        UserDefaults.standard.set(newCount,forKey: "count")
        UserDefaults.standard.set(text,forKey: "task_\(newCount)")
        update?()
        navigationController?.popViewController(animated: true)
    }
}
