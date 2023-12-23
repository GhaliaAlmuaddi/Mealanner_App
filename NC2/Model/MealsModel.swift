//
//  MealsModel.swift
//  NC2
//
//  Created by Ghalia Mohammed Al Muaddi on 09/06/1445 AH.
//

import Foundation
import SwiftData
@Model

class MealsModel {
    var breakfast : String = ""
    var lunch : String  = ""
    var dinner : String  = ""
    var snack : String  = ""
    var MealDay = Date()
    
    init(breakfast : String , lunch : String , dinner : String , snack : String , MealDay : Date ) {
        self.breakfast = breakfast
        self.lunch = lunch
        self.dinner = dinner
        self.snack = snack
        self.MealDay = MealDay
    }
}
