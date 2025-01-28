import SwiftUI

@main
struct SwiftUILoginScreenFlowApp: App {
    @StateObject var authentication = Authentication()
    
    
    var body: some Scene {
        WindowGroup {
            if authentication.isValidated {
                ContentView()
                    .environmentObject(authentication)
            } else {
                LoginView()
                    .environmentObject(authentication)
            }
        }
    }
}
