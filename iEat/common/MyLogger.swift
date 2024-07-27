//
//  Log.swift
//  iEat
//
//  Created by zhs on 2024/7/22.
//

import Foundation
import Logging

enum IndentStatue {
    case open;
    case close;
    case maintain;
}

class MyLogger {

    private static var _logger: Logger = Logger(label: "")
    
    static var indentLevel = 0
    static var indentStyle = "   |"
    static var closeStyle = "|---"
    static var openStyle = "|___"
    static var hasShownLogLevel = false
    
    init() {
        MyLogger._logger.logLevel = .info
    }
    

    
    static func changeMessage(s: String, indentStatue: IndentStatue) -> Logger.Message {
        
        var ret: Logger.Message
        
        if indentStatue == .close {
            MyLogger.indentLevel -= 1
            if MyLogger.indentLevel <= 0 {
                MyLogger._logger.error("MyLogger.indentStatue 无法再减少")
                MyLogger.indentLevel = 0
            }
            
            ret = "\(String(repeating: MyLogger.indentStyle, count: MyLogger.indentLevel) + MyLogger.closeStyle + s)"
            
        } else if indentStatue == .open {
            MyLogger.indentLevel += 1
            
            ret = "\(String(repeating: MyLogger.indentStyle, count: MyLogger.indentLevel-1) + MyLogger.openStyle + s)"
            
        } else {
            
            ret = "\(String(repeating: MyLogger.indentStyle, count: MyLogger.indentLevel) + s)"
            
        }
        
        
        if !MyLogger.hasShownLogLevel {
            print("Log level: \(MyLogger._logger.logLevel) ")
            MyLogger.hasShownLogLevel = true
        }
        
        
        
        return ret
        
    }
    
    
    static func info(_ message: String, _ indentStatue: IndentStatue = .maintain, _file: String = #file, _line: Int = #line, _function: String = #function) {
        
        let header = "\(URL(fileURLWithPath: _file).deletingPathExtension().lastPathComponent).\(_function):"
        
        let concatedMsg = "\n>>> " + header + "\n\t\t" + message + "\n"
        
        MyLogger._logger.info(MyLogger.changeMessage(s: concatedMsg, indentStatue: indentStatue))
    }
    static func debug(_ message: String, _ indentStatue: IndentStatue, _file: String = #file, _line: Int = #line, _function: String = #function) {
        let header = "\(URL(fileURLWithPath: _file).deletingPathExtension().lastPathComponent).\(_function):"
        
        let concatedMsg = "\n>>> " + header + "\n\t\t" + message + "\n"
        
        MyLogger._logger.debug(MyLogger.changeMessage(s: concatedMsg, indentStatue: indentStatue))
    }
    static func warning(_ message: String, _ indentStatue: IndentStatue, _file: String = #file, _line: Int = #line, _function: String = #function) {
        let header = "\(URL(fileURLWithPath: _file).deletingPathExtension().lastPathComponent).\(_function):"
        
        let concatedMsg = "\n>>> " + header + "\n\t\t" + message + "\n"
        
        MyLogger._logger.warning(MyLogger.changeMessage(s: concatedMsg, indentStatue: indentStatue))
    }
    static func error(_ message: String, _ indentStatue: IndentStatue, _file: String = #file, _line: Int = #line, _function: String = #function) {
        let header = "\(URL(fileURLWithPath: _file).deletingPathExtension().lastPathComponent).\(_function):"
        
        let concatedMsg = "\n>>> " + header + "\n\t\t" + message + "\n"
        
        MyLogger._logger.error(MyLogger.changeMessage(s: concatedMsg, indentStatue: indentStatue))
    }
    
}



