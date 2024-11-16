//
//  ServicesCommand.swift
//  OktaaMysql
//
//  Created by mac on 20/09/24.
//

import Foundation
import SwiftUI
class ServicesCommand: ObservableObject {
  
    struct AppCommands {
        let start: String
        let stop: String
    }
    


    private let mysql = AppCommands(start: "brew services start mysql", stop: "brew services stop mysql")
    private let phpmyadmin = AppCommands(
        start: "php -S mysql.okta:8080 -t /Applications/mysql.okta",
        stop: "pkill -f 'php -S mysql.okta:8080'"
    )
    
    func handleToggle(value: Bool, service: String, logStore: LogService) {
        let command: String
        let successMessage: String
        let failureMessage: String
        
        if service == "Mysql" {
            command = value ? mysql.start : mysql.stop
            successMessage = value ? "Mysql service started" : "Mysql service stopped"
            failureMessage = value ? "Failed to start Mysql service" : "Failed to stop Mysql service"
        } else {
            command = value ? phpmyadmin.start : phpmyadmin.stop
            successMessage = value ? "PhpMyAdmin service started on http://mysql.okta:8080" : "PhpMyAdmin service stopped"
            failureMessage = value ? "Failed to start PhpMyAdmin service" : "Failed to stop PhpMyAdmin service"
        }

        let result = runCommand(arg: command, service: service, isOn: value)
        let logMessage = result ? successMessage : failureMessage

        DispatchQueue.main.async {
            logStore.addLog(message: logMessage, isError: !result)
        }
    }
    
    private func runCommand(arg: String, service: String, isOn: Bool) -> Bool {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/bin/bash")
        process.arguments = ["-c", arg]
        process.environment = [
            "PATH": "/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin",
            "HOME": "/Users/mac"
        ]

        let pipe = Pipe()
        process.standardOutput = pipe
        process.standardError = pipe

        do {
            try process.run()

            if arg.starts(with: "php -S") {
                return true
            } else {
                process.waitUntilExit()
                let data = pipe.fileHandleForReading.readDataToEndOfFile()
                let output = String(data: data, encoding: .utf8) ?? ""
                print(output)
                return process.terminationStatus == 0
            }
        } catch {
            print("Error running command: \(error)")
            return false
        }
    }
}
