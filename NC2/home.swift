//
//  home.swift
//  NC2
//
//  Created by Lujain Abdullah Halabi Almeri on 06/06/1445 AH.
//

import SwiftUI

struct home: View {
    var body: some View {
        ZStack{
            
            Color("lColor")
                .edgesIgnoringSafeArea(.all)
            VStack{
                ScrollView{
                    CalendarView()
                    MealsDetails()
                        .ignoresSafeArea(.keyboard)
                    Image("bg").resizable().frame(width: 450, height: 450).opacity(0.2)
                        .padding(.top, -20).padding(.bottom, -80).accessibilityLabel("Background")
                }
            }
        }
    }
}




#Preview {
    home()
}
