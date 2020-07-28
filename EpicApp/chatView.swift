//
//  chatView.swift
//  EpicApp
//
//  Created by Tello on 18/01/2020.
//  Copyright © 2020 Tello. All rights reserved.
//
//

import SwiftUI

struct chatView: View {
    var body: some View {
        
        
        NavigationView{
  
            chatHome()
            .navigationBarTitle("",displayMode: .inline)
            .navigationBarHidden(true)
            
// App is crashing When tab view inside navigation View
// especially when pop up to previous controller using isActive......
            

//            TabView{
//
//                Home()
//                .navigationBarTitle("",displayMode: .inline)
//                .navigationBarHidden(true)
//                .tabItem {
//
//                    Image(systemName: "message.fill").font(.title)
//                }
//
//                Text("Person").tabItem {
//
//                    Image(systemName: "person.fill").font(.title)
//                }
//
//            }.edgesIgnoringSafeArea(.top)
//            .accentColor(Color("bg"))
        }

    }
}

struct chatView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct chatHome : View {
    
    @EnvironmentObject var data : msgDatas
    
    var body : some View{
        
        ZStack{
            
            Color("Color").edgesIgnoringSafeArea(.top)
            
            NavigationLink(destination: ChatView(), isActive: $data.show) {
            
                Text("")
            }
            VStack{
                
                topView()
            }
        }
    }
}

struct topView : View {
    
    var body : some View{
        
        VStack{
            
            HStack(spacing: 15){
                
                Text("Chats").fontWeight(.heavy).font(.system(size: 23))
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image(systemName: "magnifyingglass").resizable().frame(width: 20, height: 20)
                }
                
                Button(action: {
                    
                }) {
                    
                    Image("menu").resizable().frame(width: 20, height: 20)
                }
                
            }
            .foregroundColor(Color.white)
            .padding()
            
            GeometryReader{_ in
                
                MainView().clipShape(Rounded())
            }
        }
        

    }
}

struct MainView : View {
    
    @EnvironmentObject var data : msgDatas
    
    var body : some View{
        
        List(msgs){i in
            
            cellView(pic: i.pic, name: i.name, msg: i.msg, time: i.time, msgs: i.msgs).onTapGesture {
                
                self.data.selectedData = i
                self.data.show.toggle()
            }
        }
    }
}

struct cellView : View {
    
    var pic : String
    var name : String
    var msg : String
    var time : String
    var msgs : String
    
    var body : some View{
        
        HStack(spacing: 15){
            
            Image(pic).resizable().frame(width: 50, height: 50).clipShape(Circle())
            
            VStack(alignment:.leading,spacing: 5){
                
                Text(name)
                Text(msg).lineLimit(2)
            }
            
            Spacer()
            
            VStack(spacing: 10){
                
                Text(time)
                if msgs != ""{
                    
                    Text(msgs).padding(8).background(Color("Color")).foregroundColor(.white).clipShape(Circle())
                }
                else{
                    
                    Spacer()
                }
            }
            
        }.padding(9)
    }
}

struct Rounded : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: .topLeft, cornerRadii: CGSize(width: 55, height: 55))
        return Path(path.cgPath)
    }
}


struct msgType : Identifiable {
    
    var id : Int
    var msg : String
    var time : String
    var msgs : String
    var name : String
    var pic : String
}

// I already made a sample data....

var msgs : [msgType] = [
    
    msgType(id: 0, msg: "Andela mission is to train aspiring developers !!!!", time: "14:32", msgs: "2", name: "Vp Global Ops", pic: "S.Seni")
    ,msgType(id: 1, msg: "SwiftUI is Awesome and makes life easy!!!", time: "14:35", msgs: "2", name: "Temmy", pic: "J .Jeremy")
    ,msgType(id: 2, msg: "I do Node on the Backend and Angular on the FrontEnd!!!", time: "14:39", msgs: "1", name: "Olaide", pic: "header")
    ,msgType(id: 3, msg: "Andela is a great place to be", time: "14:50", msgs: "", name: "Intern", pic: "lunch")
    ,msgType(id: 4, msg: "Writing code in C# is just fun !!!", time: "15:00", msgs: "", name: "john", pic: "I.Aboyeji"),
     msgType(id: 5, msg: "Debugging is just not for me!!!", time: "14:50", msgs: "", name: "Temiloluwa", pic: "B.Laaro"),
     msgType(id: 6, msg: "JavaScript is just not for me", time: "14:39", msgs: "1", name: "Ebuka", pic: "andela logo"),
     msgType(id: 7, msg: "When is Hackathon4Justice program !!!", time: "14:32", msgs: "2", name: "Ibrahim", pic: "Discussion")
     
     
]


// chat view starts from here.....

struct ChatView : View {
    var body : some View{
        
        ZStack{
            
            Color("Color").edgesIgnoringSafeArea(.top)
            
            VStack(spacing: 0){
                
                chatTopview()
                GeometryReader{_ in
                    
                    chatList()
                }
                
                chatBottomView()
                
            }.navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct chatTopview : View {
    
    @EnvironmentObject var data : msgDatas
    
    var body : some View{
        
        
        HStack(spacing : 15){
            
            Button(action: {
                
                self.data.show.toggle()
                
            }) {
                
                Image(systemName: "control").font(.title).rotationEffect(.init(degrees: -90))
            }
            
            Spacer()
            
            VStack(spacing: 5){
                
                Image(data.selectedData.pic).resizable().frame(width: 45, height: 45).clipShape(Circle())
                
                Text(data.selectedData.name).fontWeight(.heavy)
                
            }.offset(x: 25)
            
            
            Spacer()
            
            Button(action: {
                
            }) {
                
                Image(systemName: "phone.fill").resizable().frame(width: 20, height: 20)
                
            }.padding(.trailing, 25)
            
            Button(action: {
                
            }) {
                
                Image(systemName: "video.fill").resizable().frame(width: 23, height: 16)
            }
            
            }.foregroundColor(.white)
            .padding()
    }
}

struct chatBottomView : View {
    
    @State var txt = ""
    
    var body : some View{
        
        
        HStack{
            
            HStack(spacing : 8){
                      
                      Button(action: {
                          
                      }) {
                          
                          Image("emoji").resizable().frame(width: 20, height: 20)
                          
                      }.foregroundColor(.gray)
                      
                      TextField("Type Something", text: $txt)
                      
                      Button(action: {
                          
                      }) {
                          
                          Image(systemName: "camera.fill").font(.body)
                          
                      }.foregroundColor(.gray)
                      
                      Button(action: {
                          
                      }) {
                          
                          Image(systemName: "paperclip").font(.body)
                          
                      }.foregroundColor(.gray)
                      
                  }.padding()
                  .background(Color("Color"))
                  .clipShape(Capsule())
            
            Button(action: {
                
            }) {
                
                Image(systemName: "mic.fill")
                    .resizable()
                    .frame(width: 15, height: 23)
                    .padding(13)
                    .foregroundColor(.white)
                    .background(Color("Color"))
                    .clipShape(Circle())
                
            }.foregroundColor(.gray)
            
        }.padding(.horizontal, 15)
        .background(Color.white)
      
    }
}

struct chatList : View {
    
    var body : some View{
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack{
                
                ForEach(Eachmsg){i in
                    
                    chatCell(data: i)
                }
            }
            
        }.padding(.horizontal, 15)
        .background(Color.white)
        .clipShape(Rounded())

    }
}

struct chatCell : View {
    
    var data : msgdataType
    
    var body : some View{
        
        HStack{
            
            if data.myMsg{
                
                Spacer()
                
                Text(data.msg)
                    .padding()
                    .background(Color("Color"))
                    .clipShape(msgTail(mymsg: data.myMsg))
                    .foregroundColor(.white)
            }
            else{
                
                Text(data.msg)
                    .padding()
                    .background(Color("txtbox"))
                    .clipShape(msgTail(mymsg: data.myMsg))
                
                Spacer()
            }
            
        }.padding(data.myMsg ? .leading : .trailing, 55)
        .padding(.vertical,10)
    }
}


struct msgTail : Shape {
    
    var mymsg : Bool
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight,mymsg ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 25, height: 25))
        return Path(path.cgPath)
    }
}


struct msgdataType : Identifiable, Codable, Hashable {
    
    var id : Int
    var msg : String
    var myMsg : Bool
}

// i have already implemented a sample data model.....

var Eachmsg = [
    
    msgdataType(id: 0, msg: "Andela's Mission is to advance human potencial by powering today's teams and investing in tommorrow's leaders.Andela's mission is  driven by it values which are (E)xcellence, (P)assion, (I)ntergrity and (C)ollarboration. EPIC", myMsg: false),
    
    msgdataType(id: 1, msg: "Jeremy Johnson is co-founder and CEO of Andela, a company that trains young African software developers and matches them with top international companies such as Microsoft. The company has offices in New York and Africa", myMsg: false),
    
    msgdataType(id: 2, msg: "“There are only two things wrong with C++:  The initial concept and the implementation.”— Bertrand Meyer", myMsg: false),
    
    msgdataType(id: 3, msg: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs.", myMsg: true),
    
    msgdataType(id: 4, msg: "What is version Control ?", myMsg: false),
    
    msgdataType(id: 5, msg: "A component of software configuration management, version control, also known as revision control or source control, is the management of changes to documents, computer programs, large web sites, and other collections of information", myMsg: true),
    
    msgdataType(id: 6, msg: "In software engineering, CI/CD or CICD generally refers to the combined practices of continuous integration and either continuous delivery or continuous deployment. In the context of corporate communication, CI/CD can also refer to the overall process of corporate identity and corporate design.", myMsg: true)


]


class msgDatas : ObservableObject{
    
    @Published var show : Bool = false
    @Published var selectedData : msgType = .init(id: -1, msg: "", time: "", msgs: "", name: "", pic: "")
}



// tab view inside a navigation view is crashing without any reason...
// seems to be xcode bug.....
// its working without tab view seems to be bug....


// I already made a sample data....

//var msgs : [msgType] = [
//
//    msgType(id: 0, msg: "!!!!", time: "14:32", msgs: "2", name: "Developer 6", pic: "p0")
//    ,msgType(id: 1, msg: "!!!", time: "13:35", msgs: "2", name: "Olaide", pic: "p1")
//    ,msgType(id: 2, msg: "Am not a fan of JavaScript !!!", time: "15:39", msgs: "1", name: "Developer 4", pic: "p2")
//    ,msgType(id: 3, msg: "!!!!", time: "10:50", msgs: "2", name: "Intern ", pic: "p3")
//    ,msgType(id: 4, msg: " !!!", time: "15:00", msgs: "5", name: "Developer 2", pic: "p4"),
//     msgType(id: 5, msg: "!!!", time: "14:50", msgs: "2", name: "Developer 1", pic: "p5"),
//     msgType(id: 6, msg: "", time: "14:39", msgs: "1", name: "Temmy", pic: "p6"),
//     msgType(id: 7, msg: "Andela mission is to train aspiring developers !!!", time: "14:32", msgs: "2", name: "Vp Clobal Ops", pic: "p7")
//
     
//]

