//
//  OnBordingView.swift
//  NC2
//
//  Created by Ghalia Mohammed Al Muaddi on 12/06/1445 AH.
//

import SwiftUI

        struct OnBordingView: View {
            @State var current = 0
            //@State var Show_sheet : Bool
           init(){
                UIScrollView.appearance().bounces = false
            }
            
            var body: some View {
                //Text("Hello, World!")
                
                NavigationStack {
                    ZStack{
                        Color("lColor")
                            .edgesIgnoringSafeArea(.all)
                        VStack {
                            
                            HStack {
                                Spacer()
                                Button(action: {
                                    self.current = onBording_set.count-1
                                    
                                    //هنا نخليه يدخل التطبيق مباشرة

                                }){
                                    Text("Skip").padding(14).foregroundColor(.blue)
                                        .offset(x: -25, y: 30)
                                }}
                            TabView(selection: $current) {
                                ForEach(0..<onBording_set.count, id: \.self) { item in
                                    VStack {
                                        Image(onBording_set[item].image).resizable().frame(width: 320 , height: 320)
                                        
                                        Text(onBording_set[item].Title).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                                        
                                        Text(onBording_set[item].description).multilineTextAlignment(.center).padding(.horizontal, 32).padding(.top,16)
                                    }.tag(item)
                                }
                            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                            
                            
                            HStack {
                                ForEach(0..<onBording_set.count, id: \.self) { item in
                                    if (item == current) {
                                        Rectangle().frame(width: 20, height: 10).cornerRadius(10).foregroundColor((Color("gColor")))
                                    }
                                    else {
                                        Circle().frame(width: 10, height: 10).foregroundColor(.gray)
                                    }
                                    
                                    
                                }
                            }.padding(.bottom , 24)
                            
                            Button(action: {
                                if (self.current < onBording_set.count - 1){
                                    self.current+=1
                                }
                                else {
                                    //Start navigation
               
                              //  home()
            
                                }
                                
                            }){
                                Text(current < onBording_set.count-1 ? "Next" : "Get started" ).padding(16).frame(width: 250).background(Color("gColor")).cornerRadius(16).padding(.horizontal, 16).foregroundColor(.white)
                                //background(Color("gColor"))
                                
                            }
                            
                        }.offset(y : -30)
                    }
                    
                }
            }
        }

        struct onBording_Struct {
            let Title : String
            let description : String
            let image : String
          
        }

let onBording_set = [
    onBording_Struct(
        Title: NSLocalizedString("Welcome to Mealanner", comment: ""),
        description: NSLocalizedString("Your hub for healthy meals.\n Plan and savor the wellness!", comment: ""),
        image: "bg"
    ), onBording_Struct(
        Title: NSLocalizedString("Stay remembered", comment: ""),
        description: NSLocalizedString("Let Mlanner's widget simplify your day of vitality with your meal planner.", comment: ""),
        image: "bg"
    ) ]
    
    



#Preview {
    OnBordingView()
}
