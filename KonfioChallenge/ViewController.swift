//
//  ViewController.swift
//  KonfioChallenge
//
//  Created by Javier on 11/12/19.
//  Copyright © 2019 MrRobot. All rights reserved.
//

import UIKit

class DogViewController: UIViewController {
    
    @IBOutlet private var dogsTableView: UITableView!
    var dogsViewModel = DogsViewModel()
    var dogCellId = "dogCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dogsTableView.delegate = self
        dogsTableView.dataSource = self
        dogsViewModel.fetchDogs { [ unowned self] in
            self.dogsTableView.reloadData()
        }
        
    }
}

extension DogViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        ROW_HEIGHT
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dogsViewModel.dogs?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: DOG_CELL, for: indexPath) as? DogCell {
            let dogs = dogsViewModel.dogs
            let dog = dogs![indexPath.row]
            cell.configCell(dog)

            return cell
        }
        return UITableViewCell()
    }
    
}

