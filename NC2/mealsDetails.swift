//
//  mealsDetails.swift
//  NC2
//
//  Created by Lujain Abdullah Halabi Almeri on 06/06/1445 AH.
//

import SwiftUI

struct mealsDetails: View {
    @AppStorage("Breakfast") var breakfast = ""
    @AppStorage("lunch") var lunch = ""
    @AppStorage("dinnewr") var dinnwer = ""
    @AppStorage("snack") var snack = ""
    
    var body: some View {
        ZStack{
            Color("lColor")
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .frame(width: 331, height:333)
                .foregroundColor(.white)
                .cornerRadius(30)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            VStack{
                
                Image(systemName: "square.and.pencil").resizable().frame(width: 28, height: 28).padding(.bottom, -30).padding(.leading, 250).padding(.top, -20)
                    .foregroundColor(Color(.blue))
                //Breakfast
                HStack() {
                    Image("breakfast").resizable()
                        .frame(width: 38, height: 38)
                    VStack(alignment: .leading) {
                        Text("Breakfast")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("gColor"))
                        
                        TextField("Type your breakfast", text: $breakfast)
                            .frame(width: 240 , height: 0, alignment: .leading  )
                            .fontWeight(.regular)
                            .foregroundColor(Color("bColor"))
                        
                    }
                }.padding(.bottom, 17)
                //Lunch
                HStack() {
                    Image("lunch").resizable()
                        .frame(width: 38, height: 38)
                    VStack(alignment: .leading) {
                        Text("Lunch")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("gColor"))
                        
                        TextField("Type your lunch", text: $lunch)
                            .frame(width: 240 , height: 0, alignment: .leading  )
                            .fontWeight(.regular)
                            .foregroundColor(Color("bColor"))
                        
                    }
                }.padding(.bottom, 17)
                //Dinner
                HStack() {
                    Image("dinner").resizable()
                        .frame(width: 38, height: 38)
                    VStack(alignment: .leading) {
                        Text("Dinner")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("gColor"))
                        TextField("Type your dinner", text: $dinnwer)
                            .frame(width: 240 , height: 0, alignment: .leading  )
                            .fontWeight(.regular)
                            .foregroundColor(Color("bColor"))
                    }
                }.padding(.bottom, 17)
                HStack() {
                    Image("snack").resizable()
                        .frame(width: 38, height: 38).padding(.top, 10)
                    VStack(alignment: .leading) {
                        Text("Snack")
                            .fontWeight(.semibold)
                            .foregroundColor(Color("gColor"))
//                        TextField("Type your snacks", text: $snack)
                        TextField("Address", text: $snack, axis: .vertical)
                            .frame(width: 240, alignment: .leading).padding(.top, -12)
                            .fontWeight(.regular)
                            .foregroundColor(Color("bColor"))
                        
                    }
                }.padding(.top, 10)
            }
            Divider().frame(width: 270, height: 0.4)
                .overlay(Color("bColor")).padding(.top, 140)
        }
    }
}

#Preview {
    mealsDetails()
}
