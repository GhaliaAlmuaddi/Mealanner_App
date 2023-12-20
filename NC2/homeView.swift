//
//  homeView.swift
//  NC2
//
//  Created by Lujain Abdullah Halabi Almeri on 06/06/1445 AH.
//

import SwiftUI

struct homeView: View {
    var body: some View {
        ZStack{
            Color("lColor")
                .edgesIgnoringSafeArea(.all)
            VStack{
                
                mealsDetails()
                Image("bg")
            }
        }
    }
}

#Preview {
    homeView()
}
