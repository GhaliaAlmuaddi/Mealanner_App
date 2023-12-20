////
////  mealsDetails.swift
////  NC2
////
////  Created by Lujain Abdullah Halabi Almeri on 06/06/1445 AH.
////
//

import SwiftUI
import WidgetKit

struct MealsDetails: View {
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
    
    @State private var isButtonClicked = false
    
    var body: some View {
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
                    print("Button Tapped...")
                    isButtonClicked.toggle()
                    
                    WidgetCenter.shared.reloadTimelines(ofKind:"widgetextension")
                }) {
                    if isButtonClicked {
                        Text("Done")
                            .bold()
                            .padding(.vertical, 5)
                            .foregroundColor(.blue)
                            .padding(.top, -20)
                            .padding(.leading, 235)
                    } else {
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .padding(.leading, 245)
                            .foregroundColor(.blue)
                            .cornerRadius(8)
                            .foregroundColor(.white)
                            .padding(.top, -20)
                    }
                }.padding(.bottom, -25)

                HStack() {
                    Image("breakfast").resizable()
                        .frame(width: 38, height: 38)
                    VStack(alignment: .leading) {
                        Text("Breakfast")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("gColor"))
                        
                        TextField("Type your breakfast", text: $breakfast)
                            .textFieldStyle(CustomTextFieldStyle(isButtonClicked: isButtonClicked)).disabled(!isButtonClicked)
                            .padding(.top, -14)
                    }
                }.padding(.bottom, 5)
                
                HStack() {
                    Image("lunch").resizable()
                        .frame(width: 38, height: 38)
                    VStack(alignment: .leading) {
                        Text("Lunch")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("gColor"))
                        
                        TextField("Type your lunch", text: $lunch)
                            .textFieldStyle(CustomTextFieldStyle(isButtonClicked: isButtonClicked))   
                            .disabled(!isButtonClicked).padding(.top, -14)
                    }
                }.padding(.bottom, 5)
                
                HStack() {
                    Image("dinner").resizable()
                        .frame(width: 38, height: 38)
                    VStack(alignment: .leading) {
                        Text("Dinner")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("gColor"))
                        TextField("Type your dinner", text: $dinner)
                            .textFieldStyle(CustomTextFieldStyle(isButtonClicked: isButtonClicked))   
                            .disabled(!isButtonClicked).padding(.top, -14)
                    }
                }.padding(.bottom, 5)
                
                HStack() {
                    Image("snack").resizable()
                        .frame(width: 38, height: 38).padding(.top, 10)
                    VStack(alignment: .leading) {
                        Text("Snack")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("gColor"))
                        TextField("Type your snacks", text: $snack)
                            .textFieldStyle(CustomTextFieldStyle(isButtonClicked: isButtonClicked)).disabled(!isButtonClicked)
                            .padding(.top, -14)
                    }
                }.padding(.top, 10)
            }
            
                Divider().frame(width: 270, height: 0.4)
                    .overlay(Color("bColor")).padding(.top, 135)

        }
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

struct MealsDetails_Previews: PreviewProvider {
    static var previews: some View {
        MealsDetails()
    }
}
