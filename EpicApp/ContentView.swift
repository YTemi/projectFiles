//
//  ContentView.swift
//  EpicApp
//
//  Created by Tello on 16/01/2020.
//  Copyright © 2020 Tello. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var selected = "Home"
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                if self.selected == "Home" {
                    
                    Home()
                }
                else if self.selected == "Trainings" {
                    
                    GeometryReader { _ in
                        
                       
                        Text("Trainings")
                        
                    }
                    
                }
                else {
                    
                    GeometryReader {_ in
                        
                         chatView()
                    }
                    
                }
                CustomtabView(selected: $selected)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomtabView : View {
    @Binding var selected : String
    var body : some View {
        
        HStack {
            
            ForEach(tabs,id: \.self) { i in
                
                VStack(spacing: 10) {
                    
                    Capsule()
                        .fill(Color.clear)
                        .frame(height: 5)
                        .overlay(
                            
                            Capsule().fill(self.selected == i ? Color("Color") : Color.clear).frame(width: 55, height: 5)
                    )
                    
                    Button(action: {
                        
                        self.selected = i
                        
                    }) {
                        
                        VStack{
                            
                            Image(i).renderingMode(.original)
                            Text(i).foregroundColor(.black)
                        }
                    }
                }
            }
        }.padding(.horizontal)
    }
}
struct Home: View {
    
    
    @State var txt = ""
    
    var body : some View {
        
        VStack(spacing: 15){
            
            HStack(spacing: 12) {
                
                Image("seni").renderingMode(.original).resizable().frame(width: 30, height: 30).cornerRadius(20)
                
                Text("Andela Nigeria")
                
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image(systemName: "bell").renderingMode(.original)
                    
                }
                
                
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                
                
                
                VStack(spacing: 15) {
                    
                    HStack(spacing: 15){
                        
                        HStack {
                            
                            Image(systemName: "magnifyingglass").font(.body)
                            
                            TextField("search Andela", text: $txt)
                            
                        }.padding(10)
                            .background(Color("Color1"))
                            .cornerRadius(20)
                        
                        Button(action: {
                            
                        }) {
                            
                            Image(systemName: "mic").renderingMode(.original)
                            
                        }
                        
                    }
                    
                    
                    Image("downloadfile-2").resizable().overlay(
            
                        
                        VStack {
                            
                            Spacer()
                            
                            HStack(alignment: .lastTextBaseline, spacing: 5) {
                                
                            Spacer(minLength: 24)
                            Text("NG").font(.title).foregroundColor(Color("Color"))
                                
                                
                                
                            }.padding()
                        }
                        
                    ).cornerRadius(19).aspectRatio(contentMode: .fill).animation(.easeOut(duration: 3)).background(Color("Color"))
                  
                    
                    HStack {
                        
                        Text("People").font(.largeTitle)
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("More")
                            
                        }.foregroundColor(Color("Color"))
                        
                    }.padding(.vertical, 15)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            
                            ForEach(categories,id: \.self) { i in
                                
                                VStack {
                                    
                                    Image(i).renderingMode(.original).resizable().frame(width: 78, height: 60).cornerRadius(10)
                                    Text(i)
                                }
                                
                            }
                        }
                        
                    }
                    
                    HomeBottomView()
                    
                }
                
            }
        }.padding(.horizontal)
        
    }
}

struct HomeBottomView: View {
    
    var body : some View {
        
        VStack(spacing: 15) {
            
            HStack {
                
                Text("Life At Andela").font(.largeTitle)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Text("More")
                    
                }.foregroundColor(Color("Color"))
                
            }.padding(.vertical, 15)
            
            ScrollView(.horizontal ,showsIndicators: false) {
                
                HStack(spacing: 15) {
                    
                    ForEach(freshitems){ i in
                        
                        
                        FreshCellView(data: i)
                    }
                }
            }
            
            HStack {
                
                Text("Epic Tower Events").font(.largeTitle)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Text("More")
                    
                }.foregroundColor(Color("Color"))
                
            }.padding(.vertical, 15)
            
            ScrollView(.horizontal ,showsIndicators: false) {
                
                HStack(spacing: 15) {
                    
                    ForEach(recipeitems){ i in
                        
                        
                        RecipeCellView(data: i)
                    }
                }
            }
        }
    }
}
struct FreshCellView: View {
    var data : fresh
    @State  var show = false
    var body : some View {
        
        ZStack{
            
            NavigationLink(destination: Detail(show: self.$show), isActive: self.$show) {
                
                Text("")
            }
            VStack(spacing: 10){
                
                Image(data.image).renderingMode(.original).resizable().frame(width: 150, height: 150).cornerRadius(10)
                Text(data.name).fontWeight(.bold)
                
                //Text(data.price)
            }.onTapGesture {
                
                self.show.toggle()
                
            }
        }
        
        
    }
}

struct RecipeCellView: View {
    var data : recipe
    var body : some View {
        
        VStack(spacing: 10){
            
            Image(data.image).renderingMode(.original).resizable().frame(width: 150, height: 150).cornerRadius(10)
            
            
            HStack {
                
                Image(data.authorpic)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(data.name).fontWeight(.bold)
                    Text(data.author).foregroundColor(.green).fontWeight(.semibold)
                    
                    
                }
                
                
            }
            
        }
    }
}


struct Detail : View {
    
    @Binding var show : Bool
    @State var top = UIApplication.shared.windows.last?.safeAreaInsets.top
    @State var count = 0
    
    var body : some View{
        
        VStack(spacing: 0){
            
            Image("andela-epic-office-180-of-205")
                .resizable()
                .frame(height: UIScreen.main.bounds.height / 2.5)
                .edgesIgnoringSafeArea(.top)
                .overlay(
                    
                    VStack{
                        
                        HStack(spacing: 12){
                            
                            Button(action: {
                                
                                self.show.toggle()
                                
                            }) {
                                
                                Image("back").renderingMode(.original)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("download").renderingMode(.original)
                            }
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("Wishlist").renderingMode(.original)
                            }
                            
                        }.padding()
                        
                        Spacer()
                    }
                    
            )
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading,spacing: 15){
                    
                    Text("Seni Sulyman").font(.title)
                    
                    Text("VP, Global Operations").foregroundColor(.gray)
                    
                    Divider().padding(.vertical, 15)
                    
                    HStack{
                        
                        Image("Color").renderingMode(.original)
                        
                        Text("Grow With Andela")
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("chat").renderingMode(.original)
                        }
                    }
                    
                    Text("Andela's Mission is to advance human potencial by powering today's teams and investing in tommorrow's leaders.Andela's mission is  driven by it values which are (E)xcellence, (P)assion, (I)ntergrity and (C)ollarboration. EPIC").foregroundColor(.blue)
                    
                    HStack{
                        
                        Text("Reviews (140)")
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("More")
                            
                        }.foregroundColor(Color("Color"))
                        
                    }.padding(.vertical, 10)
                    
                    HStack{
                        
                        Image("Color").renderingMode(.original)
                        
                        VStack(alignment: .leading, spacing: 6){
                            
                            HStack{
                                
                                //Text("4")
                                Image(systemName: "star.fill").foregroundColor(.white)
                                
                                
                                
                                
                                
                            }
                            
                            Text("Temiloluwa")
                            Text("I will be so thrilled if am part of Andela's Ecosystem...").lineLimit(2)
                        }
                        
                    }.padding()
                        .background(Color("Color1"))
                        .cornerRadius(12)
                    
                    HStack(spacing: 20){
                        
                        Spacer(minLength: 12)
                        
                        Button(action: {
                            
                            self.count += 1
                        }) {
                            
                            Image(systemName: "plus.circle").font(.largeTitle)
                            
                        }.foregroundColor(Color("Color"))
                        
                        Text("\(self.count)")
                        
                        Button(action: {
                            
                            if self.count != 0{
                                
                                self.count -= 1
                            }
                            
                        }) {
                            
                            Image(systemName: "minus.circle").font(.largeTitle)
                            
                        }.foregroundColor(Color("Color"))
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("Post Comment").padding()
                            
                        }.foregroundColor(.white)
                            .background(Color("Color"))
                            .cornerRadius(12)
                        
                        Spacer(minLength: 12)
                    }
                }
                
            }.padding()
                .overlay(
                    
                    
                    VStack{
                        
                        HStack{
                            
                            Spacer()
                            
                            HStack{
                                
                                //Text("4").foregroundColor(.white)
                                Image(systemName: "star.fill").foregroundColor(.white)
                                Image(systemName: "star.fill").foregroundColor(.white)
                                Image(systemName: "star.fill").foregroundColor(.white)
                                Image(systemName: "star.fill").foregroundColor(.white)
                                Image(systemName: "star.fill").foregroundColor(.gray)
                                
                                
                            }.padding()
                                .background(Color("Color"))
                                .cornerRadius(12)
                        }
                        .padding(.top,-20)
                        .padding(.trailing)
                        
                        
                        Spacer()
                    }
                    
            )
                .background(RoundedCorner().fill(Color.white))
                .padding(.top, -top! - 25)
                
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct RoundedCorner: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35 ))
        
        return Path(path.cgPath)
    }
}

// sample Data

var tabs = ["Home","Trainings","User"]

var categories = ["J .Jeremy","S.Seni","B.Laaro","I.Aboyeji","Developer"]

struct fresh : Identifiable {
    
    var id : Int
    var name : String
    var price : String
    var image : String
}

struct recipe : Identifiable {
    
    var id : Int
    var name : String
    var author : String
    var image : String
    var authorpic : String
}

var freshitems = [
   
    fresh(id: 0, name: " Enviroment ", price: "30.00 / kg",image: "Enviroment"),
    fresh(id: 1, name: " Discussions ", price: "15.00 / pack",image: "Discussion"),
    fresh(id: 2, name: " Lunch", price: "20.00 / pcs",image: "lunch"),
    fresh(id: 3, name: " Work Hour", price: "20.00 / pcs",image: "Work Hour"),
    fresh(id: 4, name: " Free time", price: "30.00 / kg",image: "Free time"),
    fresh(id: 5, name: " Interns ", price: "15.00 / pack",image: "Interns"),
    fresh(id: 6, name: " Projects", price: "20.00 / pcs",image: "tasks")
    
]

var recipeitems = [
    recipe(id: 0, name: "CodeNaija", author: "Past",image: "codeNaija",authorpic: "rp1"),
    recipe(id: 1, name: "Hackathon4justice", author: "Up Coming",image: "Hackathon4justice",authorpic: "rp2"),
    recipe(id: 2, name: "ALC With Google", author: "Training",image: "ALC With Google",authorpic: "rp3")
]
 
