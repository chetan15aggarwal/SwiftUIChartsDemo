//
// RadarChart
// Created by Chetan Aggarwal.


import SwiftUI

struct RadarChartShape: View {
    let data: [Double]
    let maxValues: [Double]
    let frameSize: CGSize
    let shapeColor: Color
    
    var body: some View {
        ZStack {
            Path { path in
                let radius = min(frameSize.width, frameSize.height) / 2
                let center = CGPoint(x: frameSize.width / 2, y: frameSize.height / 2)
                let angle = 2 * .pi / Double(data.count)
                
                for i in 0..<data.count {
                    let currentAngle = Double(i) * angle - .pi / 2
                    let x = center.x + CGFloat(radius * cos(currentAngle))
                    let y = center.y + CGFloat(radius * sin(currentAngle))
                    
                    if i == 0 {
                        path.move(to: CGPoint(x: x, y: y))
                    } else {
                        path.addLine(to: CGPoint(x: x, y: y))
                    }
                }
                path.closeSubpath()
            }
            .stroke(Color.white.opacity(0.5), lineWidth: 2)
            
            
            
            // Lines from vertices to center
            let radius = min(frameSize.width, frameSize.height) / 2
            let center = CGPoint(x: frameSize.width / 2, y: frameSize.height / 2)
            let angle = 2 * .pi / Double(data.count)
            ForEach(0..<data.count, id: \.self) { i in
                let currentAngle = Double(i) * angle - .pi / 2
                let x = center.x + CGFloat(radius * cos(currentAngle))
                let y = center.y + CGFloat(radius * sin(currentAngle))
                
                Path { path in
                    path.move(to: center)
                    path.addLine(to: CGPoint(x: x, y: y))
                }
                .stroke(Color.white.opacity(0.5), lineWidth: 1)
            }
            
            
            ForEach(0..<data.count, id: \.self) { index in
                let radius = min(frameSize.width, frameSize.height) / 2
                let center = CGPoint(x: frameSize.width / 2, y: frameSize.height / 2)
                let angle = 2 * .pi / Double(data.count)
                
                let currentAngle = Double(index) * angle - .pi / 2
                let currentRadius = (data[index] / maxValues[index]) * radius
                let x = center.x + CGFloat(currentRadius * cos(currentAngle))
                let y = center.y + CGFloat(currentRadius * sin(currentAngle))
                
                Circle()
                    .fill(shapeColor)
                    .frame(width: 10, height: 10)
                    .position(x: x, y: y)
            }
            
            Path { path in
                let radius = min(frameSize.width, frameSize.height) / 2
                let center = CGPoint(x: frameSize.width / 2, y: frameSize.height / 2)
                let angle = 2 * .pi / Double(data.count)
                
                for i in 0..<data.count {
                    let currentAngle = Double(i) * angle - .pi / 2
                    let currentRadius = (data[i] / maxValues[i]) * radius
                    let x = center.x + CGFloat(currentRadius * cos(currentAngle))
                    let y = center.y + CGFloat(currentRadius * sin(currentAngle))
                    
                    if i == 0 {
                        path.move(to: CGPoint(x: x, y: y))
                    } else {
                        path.addLine(to: CGPoint(x: x, y: y))
                    }
                }
                path.closeSubpath()
            }
            .fill(shapeColor.opacity(0.3))
            .stroke(shapeColor.opacity(0.5), lineWidth: 1)
        }
    }
}

#Preview {
    RadarChartShape(data: [100.0, 200.0, 100.0, 200.0], maxValues: [200.0, 300.0, 200.0, 300.0], frameSize: CGSizeMake(300, 400), shapeColor: .blue)
}
