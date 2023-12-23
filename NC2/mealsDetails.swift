//
//  MealsModel.swift
//  NC2
//
//  Created by Ghalia Mohammed Al Muaddi on 09/06/1445 AH.
//
////
////  mealsDetails.swift
////  NC2
////
////  Created by Lujain Abdullah Halabi Almeri on 06/06/1445 AH.
////
//

import SwiftUI
import WidgetKit
import SwiftData

struct MealsDetails: View {
    
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @Binding var currentDate2 : Date
    @State var Breakfast : String = ""
    @State var Lunch : String = ""
    @State var Dinner : String = ""
    @State var Snack : String = ""
    
    
    @State private var isButtonClicked = false
    @State private var Show_Flage = true
    
    
    @Query var Meals : [MealsModel]
    
    var body: some View {
        
        //        @AppStorage("storedMeals") var storedMealsData: Data?
        //
        //            @State var meals: [MealsModel] = []
        //    modelContext.delete(model : MealsModel.self)
        //
        ZStack {
            Color("lColor")
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .frame(width: 331, height: 333)
                .foregroundColor(.white)
                .cornerRadius(30)
                .shadow(radius: 10)
            
            
            
            VStack {
                
                
                Button(action: {
                    // Action for the "Edit" button
                  
                    Show_Flage = false
                    isButtonClicked = true

                    // WidgetCenter.shared.reloadTimelines(ofKind: "widgetextension")
                    
                    
                    
                }) {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .padding(.leading, 245)
                        .foregroundColor(.blue)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .padding(.top, -20)
                        .accessibilityLabel("Edit")
                }.padding(.bottom, -25)
                
                if isButtonClicked {
                    Button(action: {
                        // Action for the "Done" button
                       
                        
                        save()
                        // dismiss()
                        // Other actions specific to the "Done" button
                        
                    }) {
                        Text("Done")
                            .bold()
                            .padding(.vertical, 5)
                            .foregroundColor(.blue)
                            .padding(.top, -20)
                            .padding(.leading, 235)
                            .accessibilityLabel("Done")
                    }
                }
                    
                    if Show_Flage { // هنا بيعرض البيانات المطابقه للتاريخ
                        //Text("\(currentDate2)")
                        //  ForEach(Meals.filter { $0.MealDay == currentDate2 }) { meal in
                        
                        if let lastMeal = Meals.last(where: { Calendar.current.compare($0.MealDay, to: currentDate2, toGranularity: .day) == .orderedSame }) {
                            
                            
                            
                            // Text("\(meal.MealDay)")
                            HStack() {
                                Image("breakfast").resizable()
                                    .frame(width: 38, height: 38)
                                VStack(alignment: .leading) {
                                    Text("Breakfast")
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color("gColor"))
                                    Text(" \(lastMeal.breakfast)")
                                 //.textFieldStyle(CustomTextFieldStyle(isButtonClicked: isButtonClicked)).disabled(!isButtonClicked)
                                        .padding(.top, -14)
                                     .accessibilityLabel(!isButtonClicked ? "Click edit button to" : "")
                                    .ignoresSafeArea(.keyboard)
                                    
                                    
                                }
                            }.padding(.bottom, 5)
                            
                            HStack() {
                                Image("lunch").resizable()
                                    .frame(width: 38, height: 38)
                                VStack(alignment: .leading) {
                                    Text("Lunch")
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color("gColor"))
                               
                                    Text(lastMeal.lunch)
                                 
                                        .padding(.top, -14)
                                        .accessibilityLabel(!isButtonClicked ? "Click edit button to" : "")
                                        .ignoresSafeArea(.keyboard)
                                }
                            }.padding(.bottom, 5)
                            
                            HStack() {
                                Image("dinner").resizable()
                                    .frame(width: 38, height: 38)
                                VStack(alignment: .leading) {
                                    Text("Dinner")
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color("gColor"))
                                    Text(lastMeal.dinner)
                                  
                                        .padding(.top, -14)
                                        .accessibilityLabel(!isButtonClicked ? "Click edit button to" : "")
                                        .ignoresSafeArea(.keyboard)
                                }
                            }.padding(.bottom, 5)
                            
                            HStack() {
                                Image("snack").resizable()
                                    .frame(width: 38, height: 38).padding(.top, 10)
                                VStack(alignment: .leading) {
                                    Text("Snack")
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color("gColor"))
                                    Text(lastMeal.snack)
                                    
                                   
                                        .padding(.top, -14).ignoresSafeArea(.keyboard)
                                        .accessibilityLabel((!isButtonClicked && (Snack != "")) ? "Click edit button to" : "")
                                    
                                }
                            }.padding(.top, 10)
                          
                        } //end of if for the calender condition
                        else {
                            
                            // Handle the case where no matching meal is found
                            Text("No meal available for the selected date")
                            
                        } //End of elase
                        
                    } //end of Show_Flage
                    
                  
                    else { //اذا كان بيدخل بيانات
                        HStack() {
                            Image("breakfast").resizable()
                                .frame(width: 38, height: 38)
                            VStack(alignment: .leading) {
                                Text("Breakfast")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("gColor"))
                                
                                TextField("Type your breakfast", text: $Breakfast)
                                    .textFieldStyle(CustomTextFieldStyle(isButtonClicked: isButtonClicked)).disabled(!isButtonClicked)
                                    .padding(.top, -14)
                                    .accessibilityLabel(!isButtonClicked ? "Click edit button to" : "")
                                    .ignoresSafeArea(.keyboard)
                            }
                        }.padding(.bottom, 5)
                        
                        HStack() {
                            Image("lunch").resizable()
                                .frame(width: 38, height: 38)
                            VStack(alignment: .leading) {
                                Text("Lunch")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("gColor"))
                                
                                TextField("Type your lunch", text: $Lunch)
                                    .textFieldStyle(CustomTextFieldStyle(isButtonClicked: isButtonClicked))
                                    .disabled(!isButtonClicked).padding(.top, -14)
                                    .accessibilityLabel(!isButtonClicked ? "Click edit button to" : "")
                                    .ignoresSafeArea(.keyboard)
                            }
                        }.padding(.bottom, 5)
                        
                        HStack() {
                            Image("dinner").resizable()
                                .frame(width: 38, height: 38)
                            VStack(alignment: .leading) {
                                Text("Dinner")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("gColor"))
                                TextField("Type your dinner", text: $Dinner)
                                    .textFieldStyle(CustomTextFieldStyle(isButtonClicked: isButtonClicked))
                                    .disabled(!isButtonClicked).padding(.top, -14)
                                    .accessibilityLabel(!isButtonClicked ? "Click edit button to" : "")
                                    .ignoresSafeArea(.keyboard)
                            }
                        }.padding(.bottom, 5)
                        
                        HStack() {
                            Image("snack").resizable()
                                .frame(width: 38, height: 38).padding(.top, 10)
                            VStack(alignment: .leading) {
                                Text("Snack")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("gColor"))
                                TextField("Type your snacks", text: $Snack)
                                    .ignoresSafeArea(.keyboard)
                                    .textFieldStyle(CustomTextFieldStyle(isButtonClicked: isButtonClicked)).disabled(!isButtonClicked)
                                    .padding(.top, -14)
                                    .accessibilityLabel((!isButtonClicked && (Snack != "")) ? "Click edit button to" : "")
                                
                            }
                        }.padding(.top, 10)
                        
                    } //End of elas for adding data
                    
                    
                    
                  
                    
                    
                } //End of Vstack
                
                Divider().frame(width: 270, height: 0.4)
                    .overlay(Color("bColor")).padding(.top, 135)
                
            }
            
       
        } //End of view
        
        
        func save()  {
            
            let New_Meal = MealsModel(breakfast: Breakfast, lunch: Lunch, dinner: Dinner, snack: Snack, MealDay: currentDate2)
            context.insert(New_Meal)
            Show_Flage = true
            //return true
        }
    }

    struct CustomTextFieldStyle: TextFieldStyle {
        var isButtonClicked: Bool
        
        func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
                .frame(width: 200, height: 30)
                .background(RoundedRectangle(cornerRadius: 8)
                    .stroke(isButtonClicked ? Color.gray : .clear, lineWidth: 1))
                .foregroundColor(isButtonClicked ? Color.gray : Color("bColor"))
        }
    }

//struct MealsDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        MealsDetails(currentDate2: Binding<Date>)
//    }
//}
