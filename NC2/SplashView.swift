//
//  SplashView.swift
//  NC2
//
//  Created by Ghalia Mohammed Al Muaddi on 12/06/1445 AH.
//


import SwiftUI

struct Splashview : View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            OnBordingView()
        } else {
            
            ZStack{
                Color("lColor")
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    //LOGO START HERE
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .offset(x:0,y:-30)
                        .frame(width: 350,height: 480)
                    
                    
                    
                    // animation starts here
                        .scaleEffect(size)
                        .opacity(opacity)
                        .onAppear{
                            withAnimation(.easeIn(duration: 1.1)){
                                self.size = 1.0
                                self.opacity = 1.00
                            }
                            
                        } // 1st on appear ends here
                    
                } // vstack ends here
                
                
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                            
                        }
                        
                    }
                    
                } // 2nd on appear ends here
                
            } // Zstack ends here
            
        } // end of the else
        
    }
}
                       
                 



 #Preview {
     Splashview()
    }
              

