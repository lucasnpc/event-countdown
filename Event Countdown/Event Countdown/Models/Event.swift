//
//  Event.swift
//  Event Countdown
//
//  Created by Lucas Lopes on 27/12/25.
//

import SwiftUI
import UIKit

struct Event: Identifiable, Comparable, Hashable, Equatable, Codable {
    let id: UUID
    var title: String
    var date: Date
    var textColor: CodableColor
    
    init(id: UUID = UUID(), title: String, date: Date, textColor: Color) {
        self.id = id
        self.title = title
        self.date = date
        self.textColor = CodableColor(color: textColor)
    }
    
    static func < (lhs: Event, rhs: Event) -> Bool {
        lhs.date < rhs.date
    }
    
    var color: Color {
        textColor.color
    }
}

// Wrapper para Color que é Codable, Hashable e Equatable
struct CodableColor: Codable, Hashable, Equatable {
    var red: Double
    var green: Double
    var blue: Double
    var alpha: Double
    
    init(color: Color) {
        let uiColor = UIColor(color)
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        self.red = Double(r)
        self.green = Double(g)
        self.blue = Double(b)
        self.alpha = Double(a)
    }
    
    var color: Color {
        Color(red: red, green: green, blue: blue, opacity: alpha)
    }
}

