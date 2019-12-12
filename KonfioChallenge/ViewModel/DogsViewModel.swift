//
//  DogsViewModel.swift
//  KonfioChallenge
//
//  Created by Javier on 11/12/19.
//  Copyright © 2019 MrRobot. All rights reserved.
//

import Foundation
import UIKit

class DogsViewModel {
    var dogs:[Dog]?
    
    func fetchDogs(completed: @escaping ()->()) {
        CoreDataManager.loadDogsFromDb { (dogs) in
            guard !dogs.isEmpty else {
                APIClient.getDogs { [weak self] (dogs) in
                    self?.dogs = dogs
                    completed()
                }
                return
            }
            self.dogs = dogs
            completed()
        }

    }
    
}
