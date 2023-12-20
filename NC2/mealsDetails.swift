//
//  mealsDetails.swift
//  NC2
//
//  Created by Lujain Abdullah Halabi Almeri on 06/06/1445 AH.
//

import SwiftUI

struct mealsDetails: View {
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
                
                HStack() {
                    Image("breakfast").resizable()
                        .frame(width: 38, height: 38)
                    VStack(alignment: .leading) {
                        Text("Breakfast")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("gColor"))
                            
                        Text("Breakfast")
                            .font(.title2)
                            .fontWeight(.regular)
                            .foregroundColor(Color("bColor"))
                            
                    }
                }
//                .alignmentGuide(.leading) { dimension in
//                    dimension[.leading]
//                }
                
                
//                HStack() {
//                    Image("lunch")
//                        .resizable()
//                        .frame(width: 38, height: 38)
//                    
//                    VStack(alignment: .leading) {
//                        Text("Lunch")
//                            .font(.title2)
//                            .fontWeight(.semibold)
//                            .foregroundColor(Color("gColor"))
//                            .fixedSize(horizontal: true, vertical: true)
//                        
//                        Text("Lunch")
//                            .font(.title2)
//                            .fontWeight(.regular)
//                            .foregroundColor(Color("bColor"))
//                            .fixedSize(horizontal: true, vertical: true)
//                    }
//                }
//                .alignmentGuide(.leading) { dimension in
//                    dimension[.leading]
//                }
//                HStack{
//                    Image("dinner").resizable().frame(width: 38, height: 38)
//                    VStack{
//                        Text(" Dinner").font(.title2).fontWeight(.semibold).foregroundColor(Color("gColor"))
//                        
//                        Text("Dinner").font(.title2).foregroundColor(Color("bColor"))
//                    }
//                }/*.offset(x: -78, y:-10)*/
            }
            Divider().frame(width: 270, height: 0.4)
                .overlay(Color("bColor")).padding(.top, 200)
            
        }
    }
}

#Preview {
    mealsDetails()
}
