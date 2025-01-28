import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authentication: Authentication
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Authorized... You are in!!")
                    .font(.largeTitle)
                
                Image("Inside")
            }
            .padding()
            .navigationTitle("My Secure App")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Log out") {
                        authentication.updateValidation(success: false)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
