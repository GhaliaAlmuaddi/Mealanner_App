//
//  NC2App.swift
//  NC2
//
//  Created by Lujain Abdullah Halabi Almeri on 05/06/1445 AH.
//

import SwiftUI
import SwiftData
@main
struct NC2App: App {
    var body: some Scene {
        WindowGroup {
            CalendarView().modelContainer(for: [MealsModel.self])
        }
    }
}
