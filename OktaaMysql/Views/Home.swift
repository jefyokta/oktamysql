import SwiftUI

struct Home: View {
    struct LogEntry: Identifiable {
        let id = UUID()
        let message: String
        let error: Bool
    }
    var window = NSScreen.main?.visibleFrame ?? NSRect()
 
    @StateObject var service = ServicesCommand()
    @StateObject var logService = LogService()
    @State  var mysqlPower: Bool = false
    @State  var phpMyAdminPower: Bool = false


    var body: some View {
     
        HStack {
            SideBar(mysqlPower: $mysqlPower, phpMyAdminPower: $phpMyAdminPower).environmentObject(service).environmentObject(logService)
            
            Log().environmentObject(logService)
 
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity).background(BlurUi())
        
    }


}



#Preview {
    Home()
}
