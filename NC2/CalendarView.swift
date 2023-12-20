import SwiftUI

struct CalendarView: View {
    @State private var currentDate = Date()
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(Color("bColor"))
                }
                
                Text("\(currentDate, formatter: DateFormatter.fullDate)")
                    .font(.title)
                    .foregroundColor(Color("bColor"))
                
                Button(action: {
                    currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
                }) {
                    Image(systemName: "chevron.right")
                        .font(.title)
                        .foregroundColor(Color("bColor"))
                }
            }
            .padding()
            
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
