//
//  DogModel+CoreDataProperties.swift
//  KonfioChallenge
//
//  Created by Javier on 12/12/19.
//  Copyright © 2019 MrRobot. All rights reserved.
//
//

import Foundation
import CoreData


extension DogModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DogModel> {
        return NSFetchRequest<DogModel>(entityName: "DogModel")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var url: String?
    @NSManaged public var desc: String?
    
    func parseWith(dog: Dog) {
        self.name = dog.dogName
        self.age = dog.age
        self.url = dog.url
        self.desc = dog.description
    }

}
