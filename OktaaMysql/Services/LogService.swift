//
//  LogService.swift
//  OktaaMysql
//
//  Created by mac on 20/09/24.
//

import Foundation

class LogService: ObservableObject {
    struct LogEntry: Identifiable {
        let id = UUID()
        let message: String
        let error: Bool
    }

    @Published var logs: [LogEntry] = []
    
    func addLog(message: String, isError: Bool) {
        let log = LogEntry(message: message, error: isError)
        logs.append(log)
    }
}
