//
//  Counter.swift
//  Counter
//
//  Created by HakiMaki on 21.06.2023.
//

import Foundation

extension Date {
    func digitFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        dateFormatter.setLocalizedDateFormatFromTemplate("MdyHH:mm:ss")
        let formattedDate = dateFormatter.string(from: self)
        
        return formattedDate
    }
}

