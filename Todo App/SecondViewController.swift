//
//  SecondViewController.swift
//  Todo App
//
//  Created by admin on 26/01/2020.
//  Copyright © 2020 AM Kirsch. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController , UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var newItemTextField: UITextField!
    
    
    @IBAction func addNewItem(_ sender: Any) {
        if !newItemTextField.text!.isEmpty{
            if let newTodoText = newItemTextField.text{
                MyDataRepository.shared.setData(data: newTodoText)
                
            }
        }
        newItemTextField.text = nil
        newItemTextField.resignFirstResponder()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) // closes keyboard when touch on screen
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addNewItem(textField)
        return true
    }

}

