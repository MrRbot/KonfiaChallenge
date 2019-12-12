//
//  DogModel+CoreDataClass.swift
//  KonfioChallenge
//
//  Created by Javier on 12/12/19.
//  Copyright © 2019 MrRobot. All rights reserved.
//
//

import Foundation
import CoreData

@objc(DogModel)
public class DogModel: NSManagedObject {
    func parseWith(dog: Dog) {
        self.name = dog.dogName
        self.age = dog.age
        self.url = dog.url
        self.desc = dog.description
    }

}
