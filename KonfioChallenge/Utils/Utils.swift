//
//  Constants.swift
//
//  Created by Javier on 11/12/19.
//  Copyright © 2019 MrRobot. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


class Utils {
    static func alert(message:String,context:UIViewController) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: UIAlertController.Style.alert)
        let accept = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(accept)
        context.present(alert, animated: true, completion: nil)
    }
    
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
