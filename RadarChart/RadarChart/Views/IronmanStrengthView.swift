//
// RadarChart
// Created by Chetan Aggarwal.


import SwiftUI

struct IronmanStrengthView: View {
    
    @State private var durabilityValue: Double = 3
    @State private var energyValue: Double = 2
    @State private var fightingSkillValue: Double = 2
    @State private var intelligenceValue: Double = 3
    @State private var speedValue: Double = 2
    @State private var strengthValue: Double = 3
    
    let labels: [String] =
    ["Durability", "Energy", "Fighting Skill", "Intelligence", "Speed", "Strength"]
    let maxValues: [Double] = [4, 3, 6, 4 , 7, 9]
    let designInterval: Double = 50
    let shapeColor: Color = .yellow
    
    var data: [Double] {
        [durabilityValue, energyValue, fightingSkillValue, intelligenceValue, speedValue, strengthValue]
    }
    
    private func binding(forIndex index: Int) -> Binding<Double> {
        switch index {
        case 0:
            return $durabilityValue
        case 1:
            return $energyValue
        case 2:
            return $fightingSkillValue
        case 3:
            return $intelligenceValue
        case 4:
            return $speedValue
        case 5:
            return $strengthValue
        default:
            fatalError("Index out of range")
        }
    }
    
    var body: some View {
        ZStack {
            Color.black.opacity(1).edgesIgnoringSafeArea(.all)
                        
            VStack {
                HStack {
                    Rectangle()
                        .foregroundStyle(.yellow)
                    .frame(width: 300, height: 600)
                    .rotationEffect(.degrees(45), anchor: .center)
                    .position(x: 50, y: 0)
                    Spacer()
                }
                Spacer()
            }
            
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
                                .foregroundStyle(.yellow)
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
                            .foregroundStyle(.yellow)
                            .frame(height: 1)
                        Spacer()
                    }
                    Spacer()
                }
                Spacer().frame(height: 50)
                
                VStack {
                    
                    ForEach(0..<labels.count) { index in
                        HStack{
                            Text(labels[index])
                                .foregroundColor(.red)
                                .font(.title3)
                            Spacer()
                        }
                        Slider(value: binding(forIndex: index), in: 0...maxValues[index])
                            .accentColor(shapeColor)
                       
                    }
                }.padding(20)
            }.padding(20)
        }
    }
}

#Preview {
    IronmanStrengthView()
}
