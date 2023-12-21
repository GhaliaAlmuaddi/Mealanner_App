////
////  view.swift
////  NC2
////
////  Created by Lujain Abdullah Halabi Almeri on 08/06/1445 AH.
////
//
//import SwiftUI
//import WidgetKit
//
//struct view: View {
//    
//    @State private var currentDate = Date()
//    @State private var isButtonClicked = false
//    
//    @AppStorage(
//        "breakfast",
//        store: UserDefaults(
//            suiteName: "group.a.NC2"
//        )
//    ) private var breakfast = ""
//    
//    @AppStorage(
//        "lunch",
//        store: UserDefaults(
//            suiteName: "group.a.NC2"
//        )
//    ) private var lunch = ""
//    
//    @AppStorage(
//        "dinner",
//        store: UserDefaults(
//            suiteName: "group.a.NC2"
//        )
//    ) private var dinner = ""
//    
//    @AppStorage(
//        "snack",
//        store: UserDefaults(
//            suiteName: "group.a.NC2"
//        )
//    ) private var snack = ""
//    
//    
//    var body: some View {
//        ZStack {
//            Color("lColor")
//                .edgesIgnoringSafeArea(.all)
//            
//            VStack {
//                HStack {
//                    Button(action: {
//                        currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!
//                    }) {
//                        Image(systemName: "chevron.left")
//                            .font(.title)
//                            .foregroundColor(Color("bColor"))
//                    } .accessibilityLabel("left arrow")
//                    
//                    Text("\(currentDate, formatter: DateFormatter.fullDate)")
//                        .font(.title)
//                        .foregroundColor(Color("bColor"))
//                    
//                    Button(action: {
//                        currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
//                    }) {
//                        Image(systemName: "chevron.right")
//                            .font(.title)
//                            .foregroundColor(Color("bColor"))
//                    }       .accessibilityLabel("right arrow")
//                }.ignoresSafeArea(.keyboard)
//                    .padding()
//                ZStack{
//                    Rectangle()
//                        .frame(width: 331, height: 333)
//                        .foregroundColor(.white)
//                        .cornerRadius(30)
//                        .shadow(radius: 10)
//                    
//                    VStack{
//                        Button(action: {
//                            isButtonClicked.toggle()
//                            WidgetCenter.shared.reloadTimelines(ofKind:"widgetextension")
//                        }) {
//                            if isButtonClicked {
//                                Text("Done")
//                                    .bold()
//                                    .padding(.vertical, 5)
//                                    .foregroundColor(.blue)
//                                    .padding(.top, -20)
//                                    .padding(.leading, 235)
//                                    .accessibilityLabel("Done")
//                            } else {
//                                Image(systemName: "square.and.pencil")
//                                    .resizable()
//                                    .frame(width: 28, height: 28)
//                                    .padding(.leading, 245)
//                                    .foregroundColor(.blue)
//                                    .cornerRadius(8)
//                                    .foregroundColor(.white)
//                                    .padding(.top, -20)
//                                    .accessibilityLabel("Edit")
//                            }
//                        }.padding(.bottom, -25)
//                        
//                        HStack() {
//                            Image("breakfast").resizable()
//                                .frame(width: 38, height: 38)
//                            VStack(alignment: .leading) {
//                                Text("Breakfast")
//                                    .fontWeight(.semibold)
//                                    .foregroundColor(Color("gColor"))
//                                
//                                TextField("Type your breakfast", text: $breakfast)
//                                    .textFieldStyle(CustomTextFieldStyle(isButtonClicked: isButtonClicked)).disabled(!isButtonClicked)
//                                    .padding(.top, -14)
//                                    .accessibilityLabel(!isButtonClicked ? "Click edit button to" : "")
//                                    .ignoresSafeArea(.keyboard)
//                            }
//                        }.padding(.bottom, 5)
//                        
//                        HStack() {
//                            Image("lunch").resizable()
//                                .frame(width: 38, height: 38)
//                            VStack(alignment: .leading) {
//                                Text("Lunch")
//                                    .fontWeight(.semibold)
//                                    .foregroundColor(Color("gColor"))
//                                
//                                TextField("Type your lunch", text: $lunch)
//                                    .textFieldStyle(CustomTextFieldStyle(isButtonClicked: isButtonClicked))
//                                    .disabled(!isButtonClicked).padding(.top, -14)
//                                    .accessibilityLabel(!isButtonClicked ? "Click edit button to" : "")
//                                    .ignoresSafeArea(.keyboard)
//                            }
//                        }.padding(.bottom, 5)
//                        
//                        HStack() {
//                            Image("dinner").resizable()
//                                .frame(width: 38, height: 38)
//                            VStack(alignment: .leading) {
//                                Text("Dinner")
//                                    .fontWeight(.semibold)
//                                    .foregroundColor(Color("gColor"))
//                                TextField("Type your dinner", text: $dinner)
//                                    .textFieldStyle(CustomTextFieldStyle(isButtonClicked: isButtonClicked))
//                                    .disabled(!isButtonClicked).padding(.top, -14)
//                                    .accessibilityLabel(!isButtonClicked ? "Click edit button to" : "")
//                                    .ignoresSafeArea(.keyboard)
//                            }
//                        }.padding(.bottom, 5)
//                        
//                        HStack() {
//                            Image("snack").resizable()
//                                .frame(width: 38, height: 38).padding(.top, 10)
//                            VStack(alignment: .leading) {
//                                Text("Snack")
//                                    .fontWeight(.semibold)
//                                    .foregroundColor(Color("gColor"))
//                                TextField("Type your snacks", text: $snack)
//                                    .ignoresSafeArea(.keyboard)
//                                    .textFieldStyle(CustomTextFieldStyle(isButtonClicked: isButtonClicked)).disabled(!isButtonClicked)
//                                    .padding(.top, -14)
//                                    .accessibilityLabel((!isButtonClicked && (snack != "")) ? "Click edit button to" : "")
//                                
//                            }
//                        }.padding(.top, 10)
//                        
//                        
//                    }
//                    Divider().frame(width: 270, height: 0.4)
//                        .overlay(Color("bColor")).padding(.top, 135)
//
//                }
//            }
//        }
//    }
//}
//extension DateFormatter {
//    static var fullDate: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "d MMMM yyyy"
//        return formatter
//    }
//}
//
//struct CalendarView_Previews: PreviewProvider {
//    static var previews: some View {
//        view()
//    }
//}
//
//
//#Preview {
//    view()
//}
