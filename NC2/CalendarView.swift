import SwiftUI

struct CalendarView: View {
    @State var currentDate = Date()
    
    var body: some View {
        ZStack {
            
            Color("lColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
              //  VStack{
                    ScrollView{
                        HStack {
                            Button(action: {
                                currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!
                            }) {
                                Image(systemName: "chevron.left")
                                    .font(.title)
                                    .foregroundColor(Color("bColor"))
                            } .accessibilityLabel("left arrow")
                            
                            Text("\(currentDate, formatter: DateFormatter.fullDate)")
                                .font(.title)
                                .foregroundColor(Color("bColor"))
                            
                            Button(action: {
                                currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
                            }) {
                                Image(systemName: "chevron.right")
                                    .font(.title)
                                    .foregroundColor(Color("bColor"))
                            }       .accessibilityLabel("right arrow")
                        }.ignoresSafeArea(.keyboard)
                            .padding()
                    }
                    
                    MealsDetails(currentDate2: $currentDate)
                          .ignoresSafeArea(.keyboard)
                      Image("bg").resizable().frame(width: 450, height: 450).opacity(0.2)
                          .padding(.top, -20).padding(.bottom, -80)
               // }
            }
            

        }
        
    }
    
    
    
    
    
    
}
extension DateFormatter {
    static var fullDate: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy"
        return formatter
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
