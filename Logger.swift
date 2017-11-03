//
//  Logger.swift
//  Logger_proj
//
//  Created by Uldis on 03/11/2017.
//  Copyright © 2017 Uldis Zingis. All rights reserved.
//

import Foundation

enum LogEvent: String {
    case error = "[‼️]" // error
    case info = "[ℹ️]" // info
    case debug = "[💬]" // debug
    case verbose = "[🔬]" // verbose
    case warning = "[⚠️]" // warning
    case severe = "[🔥]" // severe
}

class Logger {
    class func log(message: String,
                   event: LogEvent,
                   fileName: String = #file,
                   line: Int = #line,
                   column: Int = #column,
                   funcName: String = #function) {
        #if DEBUG
            print("\(Logger.currentDateAsString()) \(event.rawValue)[\(sourceFileName(filePath: fileName))]:\(line) \(column) \(funcName) -> \(message)")
        #endif
    }
    
    private class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
    
    static func currentDateAsString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy hh:mm:ssSSS"
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter.string(from: Date())
    }
}
