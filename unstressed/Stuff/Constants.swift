//
//  Constants.swift
//  unstressed
//
//  Created by Srinivas Koushik on 5/2/24.
//

import SwiftUI


struct Constants {
    static let COLOR = Color(red: 183/255, green: 165/255, blue: 209/255);

    static let MEDIUM_COLOR = Color(red: 72/255, green: 3/255, blue: 85/255);
    static let DARKER_COLOR = Color(red: 73/255, green: 6/255, blue: 91/255);
    
    static let GRAY_BG = Color(red:254/255,green: 249/255, blue: 255/255)

    static let BTN_BG = Color(red:151/255,green: 71/255, blue: 255/255)

    static let WORK_TAG = "Work"
    static let PERSONAL_TAG = "Personal"
    static let FAMILY_TAG = "Family"
    static let MISC_TAG = "Miscellaneous"
    
    static let selectionItems = [FAMILY_TAG, PERSONAL_TAG, WORK_TAG, MISC_TAG]
    
}
enum Category:String {
    case work = "Work"
    case personal = "Personal"
    case family = "Family"
    case misc = "Miscellaneous"
}


