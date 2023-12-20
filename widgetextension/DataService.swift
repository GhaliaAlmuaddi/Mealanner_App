//
//  DataService.swift
//  widgetextensionExtension
//
//  Created by Lujain Abdullah Halabi Almeri on 05/06/1445 AH.
//

import Foundation
import SwiftUI

struct DataService{
    @AppStorage(
        "streak",
        store: UserDefaults(
            suiteName: "group.a.NC2"
        )
    ) private var streak = 0
    
    func log(){
        streak += 10
    }
    func progress() -> Int{
        return streak
    }
}
