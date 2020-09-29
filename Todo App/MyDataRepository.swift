//
//  MyDataRepository.swift
//  Todo App
//
//  Created by admin on 26/01/2020.
//  Copyright © 2020 AM Kirsch. All rights reserved.
//

import Foundation

class MyDataRepository{
    
    var cellArray:[String] = []
   
    // UserDefaults.standard.set(cellArray, forKey: "allCellsReal")
    
    
    func getData(){
        if let cellData = UserDefaults.standard.object(forKey:"allCellsReal") as? [String]{
            cellArray = cellData
        }
    }
    func setData(data:String){
        cellArray.append(data)
        UserDefaults.standard.set(cellArray, forKey: "allCellsReal")
    }
    func deleteRow(rowIndex:Int){
        cellArray.remove(at: rowIndex )
        UserDefaults.standard.set(cellArray, forKey: "allCellsReal")
    }

    private static var repository: MyDataRepository?
    class var shared: MyDataRepository {
        if repository == nil {
            repository = MyDataRepository()
        }
        return repository!
    }
    private init(){
        getData()
    }
}
