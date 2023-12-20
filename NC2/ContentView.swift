//
//  ContentView.swift
//  NC2
//
//  Created by Lujain Abdullah Halabi Almeri on 05/06/1445 AH.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    
    @AppStorage ("streak", store: UserDefaults(suiteName: "group.a.NC2")) var streak = 0
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack {
                ZStack {
                    
                    Spacer()
                    
                    Circle()
                        .stroke(Color.white.opacity(0.1), lineWidth: 20)
                    Circle()
                    
                        .trim(from: 0, to: 0.34)
                        .stroke(.blue, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .rotationEffect(.degrees(-90))
                    VStack{
                        Text("Streak").font(.largeTitle)
                        Text(String(streak))
                            .font(.system(size: 70)).bold().fontDesign(.rounded)
                        
                    }.foregroundColor(.white)
                }.padding(.horizontal, 50)
                
                Spacer()
                
                Button(action: {
                    streak += 1
                    
                    // manually reload the widget
                    WidgetCenter.shared.reloadTimelines(ofKind:"widgetextension")
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.blue)
                            .frame(height: 50)
                        Text("+1")
                            .foregroundStyle(.white)
                    }
                })
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ContentView()
}
