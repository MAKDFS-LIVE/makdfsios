import SwiftUI

struct HomeView: View {
    @State private var username = "";
    @State private var password = "";
    @State private var wrongUsername = 0;
    @State private var wrongPassword = 0;
    @State private var showingLonginScree = false;
    
    var body: some View {
            NavigationView{
                ZStack{
                    Color.blue.ignoresSafeArea()
                    Circle().scale(1.7).foregroundColor(.white.opacity(0.15))
                    Circle().scale(1.35).foregroundColor(.white)
                    VStack{
                        Text("Login").font(.largeTitle).bold().padding()
                        TextField("Username",text: $username)
                            .padding().frame(width: 300,height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .border(.red,width: CGFloat(wrongPassword))
                        
                        SecureField("Password",text: $password)
                            .padding().frame(width: 300,height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .border(.red,width: CGFloat(wrongPassword))
                        Button("Login"){
                            authenticateUser(username: username, password: password)
                        }
                        .foregroundColor(.white)
                        .frame(width: 300,height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        
                        NavigationLink(destination: SecondView().navigationBarBackButtonHidden(true), isActive: $showingLonginScree) {
                               EmptyView()
                        }
                    }
                }
            }
            .navigationBarHidden(true)
    }
    
    func authenticateUser(username:String,password:String){
        if username.lowercased() == "getege"{
            wrongUsername = 0;
            if password.lowercased() == "1234"{
                wrongUsername = 0;
                showingLonginScree = true
            }
            else{
                wrongUsername = 2;
            }
        }else{
            wrongPassword = 2
        }
    }
}

#Preview {
    HomeView()
}
