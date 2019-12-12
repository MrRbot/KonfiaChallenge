//
//  APIClient.swift
//  Created by Javier on 11/12/19.
//  Copyright © 2019 MrRobot. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    
    static func getDogs(completion:@escaping completionWithDog){
        // Call the API Router
        AF.request(APIRouter.getDogs).responseJSON { (response) in
            do {
                let dogs = try JSONDecoder().decode([Dog].self, from: response.data!)
                CoreDataManager.saveToDB(dogs)
                completion(dogs)
            } catch {
                print(error.localizedDescription)
            }

        }

    }
    
    static func validateCode(code:Int,context: UIViewController) {
        switch code {
        case 200:
            break
        case 401:
            Utils.alert(message:"", context: context)
        case 404:
            Utils.alert(message:"",context: context)
        default:
            break
        }
    }
    
}


