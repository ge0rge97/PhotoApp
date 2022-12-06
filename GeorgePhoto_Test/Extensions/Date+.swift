//
//  Date+.swift
//  GeorgePhoto_Test
//
//  Created by Georgiy Groshev on 06.12.2022.
//

import Foundation

extension Date {
    
    static func getFormattedDate(fromDate date: String , withFormatter formatter:String) -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, yyyy"
        
        dateFormatter.locale = Locale(identifier: "en_US")
        
        let date: Date? = dateFormatterGet.date(from: date)
        return dateFormatter.string(from: date!)
    }
}
