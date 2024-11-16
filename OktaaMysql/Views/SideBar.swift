//
//  SideBar.swift
//  OktaaMysql
//
//  Created by mac on 20/09/24.
//

import SwiftUI

struct SideBar: View {
    @Binding  var mysqlPower: Bool
    @Binding  var phpMyAdminPower: Bool
    @EnvironmentObject var service: ServicesCommand
    @EnvironmentObject var logService: LogService

    var window = NSScreen.main?.visibleFrame ?? NSRect()
    

    var body: some View {
        VStack {
            HStack {
                Text("Okta")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.trailing, -5)                       
                    .foregroundStyle(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255),
                                Color(red: 152 / 255, green: 150 / 255, blue: 152 / 255)
                            ]),
                            startPoint: .trailing,
                            endPoint:  .leading
                        )
                    )
                    .shadow(color: Color.black.opacity(0.2), radius: 5)

                Text("Mysql")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.trailing, -5)                        .foregroundStyle(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(red: 240 / 255, green: 84 / 255, blue: 106 / 255),
                                Color(red: 185 / 255, green: 10 / 255, blue: 100 / 255)
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .shadow(color: Color.black.opacity(0.2), radius: 5)
            }

            List {
                serviceToggle(name: "Mysql", isOn: $mysqlPower)
                serviceToggle(name: "PhpMyAdmin", isOn: $phpMyAdminPower)
                VStack{
                    Link("PhpMyAdmin", destination: URL(string: "http://mysql.okta:8080")!)
                        .padding(10)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 20 / 255, green: 154 / 255, blue: 166 / 255),
                                    Color(red: 25 / 255, green: 100 / 255, blue: 100 / 255)
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )



                        )
                        .foregroundColor(.black)
                        .shadow(color: Color.black.opacity(0.2), radius: 5)
                        .cornerRadius(8)
                    
                }.padding(.top,20)
            }.cornerRadius(15)
                .shadow(color: Color.black.opacity(0.2), radius: 5)
            


        }
        .frame(maxWidth: window.width / 6, maxHeight: .infinity)
        .padding()
    }
    func serviceToggle(name: String, isOn: Binding<Bool>) -> some View {
        HStack {
            VStack(alignment: .leading){
                Text(name)
                    .foregroundColor(.white)
                Text(isOn.wrappedValue ? "Connected" : "Not connected")
                    .font(.system(size: 8)).foregroundColor( isOn.wrappedValue ? .green : .white)
            }
            Toggle("", isOn: isOn)
                .toggleStyle(SwitchToggleStyle(tint: .blue))
                .onChange(of: isOn.wrappedValue) {o, newValue in
                    service.handleToggle(value: newValue, service: name,logStore: self.logService )
                }
        }
        .padding(.vertical)
        
    }
    
}

//#Preview {
//    SideBar()
//}
