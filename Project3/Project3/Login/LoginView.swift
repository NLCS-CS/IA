//
//  LoginView.swift
//  Project3
//
//  Created by 이명서 on 10/22/23.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel = LoginViewModel() //LoginView's ViewModel
    
    @State var userName: String = "" //binding to username textfield's input text
    @State var password: String = "" //binding to password textfield's input text
    @State var errorMessage: String = "" //error message text
    @State var showErrorMessage: Bool = false //error message text view를 보여줄지 말지 결정한 불린 타입 변수
    @State var goHomeView: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                
                //title text
                Text("Welcome\nPlease Login:")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                //userName text field
                TextField("enter username", text: $userName)
                    .padding(28)
                    .overlay{
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                    }
                
                //password text field
                TextField("enter password", text: $password)
                    .padding(28)
                    .overlay{
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                    }
                //error message text
                Text(errorMessage)
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color("ButtonColor"))
                    .padding(.vertical, 16)
                    .opacity(showErrorMessage ? 1 : 0)//if문을 한줄에 씀 //show text when showErrorMessage flag set true
                
                //Next button
                Button(action:{
                    //버튼 눌렀을때 할 액션
                    //VALIDATION check
                    self.checkLoginUserInfo()//함수 만들기 initialization
                    
                }, label:{
                    Text("Next") //button label text
                        .fontWeight(.semibold)
                        .frame(maxWidth:.infinity)
                    
                }).foregroundStyle(.white)
                    .tint(Color("ButtonColor"))
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                    .safeAreaPadding(16)
                
            }.padding(30)
                .navigationDestination(isPresented: $goHomeView){
                    //push to homeview when goHomeView flag set true
                    HomeView()
                    
                }
        }
    }
    ///textfield에 입력한 username, password validation 체크를 진행하는 함수
    private func checkLoginUserInfo(){
        /*
         1. username이 비어있는지
         2. password가 비어있는지
         3. 서버에 저장된 정보와 일치하는지
         */
        
        goHomeView = false//변수 초기화
        
        if self.userName.isEmpty{
            //userName textfield에 입력한 내용이 없다
            errorMessage = "Check Username"
            showErrorMessage = true
            
            return
        }
        if self.password.isEmpty || (password.count < 8 || password.count > 12){
            //password textfield에 입력한 내용이 없고, 8-12자 안에 없다
            errorMessage = "Check Password"
            showErrorMessage = true
            
            return
        }
        
        //db서버에 저장된 유저 정보와 입력한 정보가 일치하는지 체크
        if self.userName.lowercased() == viewModel.user.userName.lowercased() &&
            self.password.lowercased() == viewModel.user.password.lowercased() {
            //일치하는 경우 -> 로그인 성공
            errorMessage = ""
            showErrorMessage = false
            //
            goHomeView = false
        }else{
            //일치하지 않는 경우 -> username이나 password 둘중 하나라도 틀렸을떄
            errorMessage = "check input info"
            showErrorMessage = true
        }
    }

}
#Preview {
    LoginView()
}
