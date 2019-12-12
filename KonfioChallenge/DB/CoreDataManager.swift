//
//  CoreDataManager.swift
//  KonfioChallenge
//
//  Created by Javier on 12/12/19.
//  Copyright © 2019 MrRobot. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager {
    
    class func saveToDB<T>(_ object: T ) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let dogs = object as! [Dog]
        for dog in dogs {
            let newDog = DogModel(context:context)
            newDog.name = dog.dogName
            newDog.age = Int16(dog.age)
            newDog.url = dog.url
            newDog.desc = dog.description
        }
        appDelegate.saveContext()

    }

    class func loadDogsFromDb(_ completion: @escaping completionWithDog) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        var dogsArray = [Dog]()
         do {
            let dogsModel = try context.fetch(DogModel.fetchRequest()) as! [DogModel]
             if dogsModel.count > 0{
                 for dog in dogsModel{
                    let dog = Dog(dogName: dog.name!,
                                    description: dog.desc!,
                                    age: Int(dog.age),
                                    url: dog.url!)
                    dogsArray.append(dog)
                 }
             }
            print(dogsArray)
            completion(dogsArray)
         } catch {
             print("Error fetching data from CoreData")
         }
        
     }
    
}
