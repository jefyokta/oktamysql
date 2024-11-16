//
//  Log.swift
//  OktaaMysql
//
//  Created by mac on 20/09/24.
//

import SwiftUI

struct Log: View {
    @EnvironmentObject var logStore: LogService
    var body: some View {
        VStack{
            HStack {
                Text("Logs")
                    .foregroundColor(.white).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.bold)
               
            
            }
            List(logStore.logs) {
               log in
                    HStack {
                        Text(log.message)
                            .foregroundColor(.white)
                        Spacer()
                        Circle()
                            .fill(log.error ? Color.red : Color.green)
                            .frame(width: 10, height: 10)
                    }
            }
            .frame(maxWidth: .infinity)
        }.padding()
    }
}

//#Preview {
//    Log()
//}
