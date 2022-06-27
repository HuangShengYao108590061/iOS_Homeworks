//
//  ContentView.swift
//  myLab10
//
//  Created by Starvian Wibowo on 6/1/22.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

public class AppViewModel: ObservableObject{
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    @Published var list = [Datas]()
    
    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password) {[weak self] result, error in guard result != nil, error == nil else {return}
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signUp(name: String, email: String, password: String){
        
//        let db = Firestore.firestore()
//        let doc = db.collection("username").document(name)
//        doc.setData(["name":name]){error in
//            if let error = error {
//                print("error")
//            }
//            else{
//                print(name)
//            }
//        }
//
        auth.createUser(withEmail: email, password: password){[weak self] result, error in guard result != nil, error == nil else {return}
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    func signOut() {
        try? auth.signOut()
        self.signedIn = false
    }
//    func getUserName() -> String{
//        let userName = Auth.auth().currentUser
//        if (self.signedIn == true){
//            return userName?.displayName ?? "name"
//        }
//        return userName?.displayName ?? "name"
//    }
//
    let userInfo = Auth.auth().currentUser?.email
    
    func getName(){
        let db = Firestore.firestore()
        db.collection("un").getDocuments{snapshot, error in
            if error == nil {
                if let snapshot = snapshot{
                    DispatchQueue.main.async {
                        self.list = snapshot.documents.map{ d in
                            return Datas(id:d.documentID, name: d["name"] as? String ?? "")
                        }
                    }
                }
            }
        }
    }
    func updName(){
        let db = Firestore.firestore()
        db.collection("un").document("uname").setData(["name":"William"])
    }
}

struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    @ObservedObject var model = AppViewModel()
    var body: some View {
        NavigationView{
            if viewModel.signedIn{
                VStack{
                    Text("You are signed in")
                    List (model.list) {item in
                        Text("Email:")
                        Text(viewModel.userInfo ?? "email")
                        Text("Username:")
                        Text(item.name)}
                    //Text(viewModel.getUserName())
                    Button(action:{
                        viewModel.signOut()
                    }, label: {
                        Text("Sign Out").foregroundColor(Color.blue).padding()
                    })
                    
                    NavigationLink("Change Name", destination: changeName()).padding()
                    
                }
            }
            else{
                SignInView()
                
            }
        }
        .onAppear{
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
    init(){
        model.getName()
    }
}

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
            VStack{
                TextField("Email Address", text: $email).disableAutocorrection(true).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/).padding().background(Color(.secondarySystemBackground))
                SecureField("Password", text:$password).disableAutocorrection(true).autocapitalization(.none).padding().background(Color(.secondarySystemBackground))
                Button(action:{
                    guard !email.isEmpty, !password.isEmpty else {return}
                    viewModel.signIn(email: email, password: password)
                }, label: {
                    Text("Sign In").frame(width:200, height:50).background(Color.blue).cornerRadius(8)
                        .foregroundColor(Color.white)
                })
                NavigationLink("Create Account", destination: SignUpView()).padding()
            }
            .padding()
        .navigationTitle("Sign In")
    }
}

struct SignUpView: View {
    @State var name = ""
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
            VStack{
                TextField("Name", text: $name).disableAutocorrection(true).autocapitalization(.none).padding().background(Color(.secondarySystemBackground))
                TextField("Email Address", text: $email).disableAutocorrection(true).autocapitalization(.none).padding().background(Color(.secondarySystemBackground))
                SecureField("Password", text:$password).padding().background(Color(.secondarySystemBackground))
                Button(action:{
                    guard !email.isEmpty, !password.isEmpty else {return}
                    viewModel.signUp(name: name,email: email, password: password)
                }, label: {
                    Text("Create Account").frame(width:200, height:50).background(Color.blue).cornerRadius(8)
                        .foregroundColor(Color.white)
                })
            }
            .padding()
        .navigationTitle("Sign Up")
    }
}

struct changeName: View {
    @State var name = ""
    @State var sAlert = false
    @EnvironmentObject var viewModel: AppViewModel
    @ObservedObject var model = AppViewModel()
    var body: some View {
        NavigationView{
            VStack{
                TextField("New Name", text: $name).padding().background(Color(.secondarySystemBackground))
                Button(action:{
                    viewModel.updName()
                    name = ""
                    self.sAlert = true
                }, label: {
                    Text("Change name").frame(width:200, height:50).background(Color.blue).cornerRadius(8)
                        .foregroundColor(Color.white)
                }).alert(isPresented: $sAlert,
                         content:{
                            Alert(title: Text("Username Changed"), message: Text("Username changed successfully"), dismissButton: .default(Text("Ok")))
                         })
            }
            .padding()
        .navigationTitle("Update user info")
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

