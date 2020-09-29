//
//  FirstViewController.swift
//  Todo App
//
//  Created by admin on 26/01/2020.
//  Copyright © 2020 AM Kirsch. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    private var cellArray:[String] = []

    
    @IBOutlet weak var todoListTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = String(indexPath.row + 1) + ". " + cellArray[ indexPath.row ]
//        cell.detailTextLabel?.text = cellArray[ indexPath.row ]
       
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("dragged row ", indexPath.row)
        
        MyDataRepository.shared.deleteRow(rowIndex: indexPath.row)
        self.cellArray = MyDataRepository.shared.cellArray
        todoListTable.reloadData()
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.cellArray = MyDataRepository.shared.cellArray
        todoListTable.reloadData()

    }
    
    
//    public func newTodo(todoText newText:String){
//        cellArray.append(newText)
//        todoListTable.reloadData()
//        print("FirstViewController newTodo() = ", newText)
//        
//    }


}

