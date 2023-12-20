//
//  widgetextension.swift
//  widgetextension
//
//  Created by Lujain Abdullah Halabi Almeri on 05/06/1445 AH.
//

import WidgetKit
import SwiftUI

/* supplies the data
 
 */
struct Provider: TimelineProvider {
    //create a snapshot with data
    
    @AppStorage(
        "breakfast",
        store: UserDefaults(
            suiteName: "group.a.NC2"
        )
    ) private var breakfast = ""
    
    @AppStorage(
        "lunch",
        store: UserDefaults(
            suiteName: "group.a.NC2"
        )
    ) private var lunch = ""
    
    @AppStorage(
        "dinner",
        store: UserDefaults(
            suiteName: "group.a.NC2"
        )
    ) private var dinner = ""
    
    @AppStorage(
        "snack",
        store: UserDefaults(
            suiteName: "group.a.NC2"
        )
    ) private var snack = ""
    
    let data = DataService()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), breakfast: breakfast, lunch: lunch, dinner: dinner, snack: snack)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), breakfast: breakfast, lunch: lunch, dinner: dinner, snack: snack)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            
            //MARK: HERE
            let breakfast = breakfast
            let lunch = lunch
            let dinner = dinner
            let snack = snack
            
            let entry = SimpleEntry(date: entryDate, breakfast: breakfast, lunch: lunch, dinner: dinner, snack: snack)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
//data
struct SimpleEntry: TimelineEntry {
    let date: Date
    let breakfast: String
    let lunch: String
    let dinner: String
    let snack: String
}

struct widgetextensionEntryView : View {
    var entry: Provider.Entry
    
    let data = DataService()
    //UI
    var body: some View {
        ZStack {
            Color("lColor")
                .edgesIgnoringSafeArea(.all)
            
//            Rectangle()
//                .frame(width: 331, height: 333)
//                .foregroundColor(Color("lColor"))
//                .cornerRadius(30)
//                .shadow(radius: 10)
            Text(data.getBreakfast())
           
            VStack {
            }
            
        }.padding()
        .containerBackground(.white, for: .widget)
    }
}

//actual widget
struct widgetextension: Widget {
    //widget id
    let kind: String = "widgetextension"
    
    var body: some WidgetConfiguration {
        //type of widget - pass id to deal with the widget, provider: supplier of widget data, after provider: actual view
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                widgetextensionEntryView(entry: entry)// background color
                    .containerBackground(.white, for: .widget)
            } else {
                widgetextensionEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        
        // added
        .supportedFamilies([.systemMedium])
    }
}

#Preview(as: .systemSmall) {
    widgetextension()
} timeline: {
    SimpleEntry(date: .now, breakfast: "", lunch: "", dinner: "", snack: "")
    SimpleEntry(date: .now, breakfast: "", lunch: "", dinner: "", snack: "")
}
