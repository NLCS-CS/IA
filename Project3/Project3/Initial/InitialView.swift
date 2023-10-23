//
//  InitialView.swift
//  Project3
//
//  Created by 이명서 on 10/22/23.
//

import SwiftUI

struct InitialView: View {
    
    @State private var goLoginView = false//로그인 버튼을 눌렀는지 체크 //private는 이 뷰에서만 goLoginView을 쓸숫잇음
    
    var body: some View {
        
        NavigationStack{ //뷰를 푸시하는 용도
            
            VStack{ // 뷰를 세로로 쌓는 형태로 배치하는 용도
                Text("Stock Management System")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.headline)
                    .safeAreaPadding(.top)
                
                Spacer()
                
                Image("logoimage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:250, height:250)
                
                Spacer()
                //login button
                Button(action:{
                    //눌렀을때 할 액션
                    goLoginView = true //set push to loginview flag true  // flag=boolean
                    
                }, label:{
                    Text("Login") //button label text
                        .fontWeight(.semibold)
                        .frame(maxWidth:.infinity)
                    
                }).foregroundStyle(.white)
                    .tint(Color("ButtonColor"))
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                    .safeAreaPadding(16)
            }.navigationDestination(isPresented: $goLoginView) {
                LoginView() //push to login view when goLoginview flag set true
            }
            
        }
    }
}
