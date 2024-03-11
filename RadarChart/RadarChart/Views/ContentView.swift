//
// RadarChart
// Created by Chetan Aggarwal.


import SwiftUI

struct ContentView: View {
    var body: some View {
        IronmanStrengthView()
    }
}

#Preview {
    ContentView()
}


struct IronmanStrengthView: View {
    var body: some View {
        ZStack {
            Color.yellow.opacity(1).edgesIgnoringSafeArea(.all)
            
            ScrollView{
                Text("IRON MAN")
                    .font(.largeTitle)
                    .foregroundStyle(.red)
                    .italic()
                    .bold()
                
                HStack {
                    Image("ironman")
                        .resizable()
                        .frame(width: 150,height: 200)
                    
                    VStack{
                        HStack{
                            Text("Anthony Edward 'Tony' Stark")
                                .font(.system(size: 25))
                                .foregroundStyle(.red)
                                .bold()
                            Spacer()
                        }
                        
                        Spacer()
                            .frame(height: 10)
                        
                        HStack{
                            Text("My armor, it was never a distraction or a hobby, it was a cocoon. And now, I'm a changed man. You can take away my house, all my tricks and toys. But one thing you can't take away… I am Iron Man. ―Tony Stark"
                                 )
                                .font(.system(size: 15))
                                .foregroundStyle(.red).opacity(0.9)
                                .bold()
                            Spacer()
                        }
                        
                        Spacer()
                           
                        Rectangle()
                            .foregroundStyle(.red)
                            .frame(height: 1)
                        Spacer()
                    }
                    Spacer()
                }
                Spacer().frame(height: 50)
            }
            
        }
    }
}
