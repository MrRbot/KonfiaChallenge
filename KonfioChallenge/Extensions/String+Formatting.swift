//
//  String+Formatting.swift
//  KonfioChallenge
//
//  Created by Javier on 12/12/19.
//  Copyright © 2019 MrRobot. All rights reserved.
//

import Foundation

extension String {
    func removeEmptySpaces() -> String {
        return self.replacingOccurrences(of: " ", with: "")
    }
}
