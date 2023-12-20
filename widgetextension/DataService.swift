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
    
    @AppStorage(
        "breakfast",
        store: UserDefaults(
            suiteName: "group.a.NC2"
        )
    ) private var breakfast = ""
    
    @AppStorage(
        "lunch",
        store: UserDefaults(
            suiteName: "group.a.NC2"
        )
    ) private var lunch = ""
    
    @AppStorage(
        "dinner",
        store: UserDefaults(
            suiteName: "group.a.NC2"
        )
    ) private var dinner = ""
    
    @AppStorage(
        "snack",
        store: UserDefaults(
            suiteName: "group.a.NC2"
        )
    ) private var snack = ""
    
    func log(){
        streak += 10
    }
    func getBreakfast() -> String{
        return breakfast
    }
    func getLunch() -> String{
        return lunch
    }
    func getDinner() -> String{
        return dinner
    }
    func getSnack() -> String{
        return snack
    }
}
