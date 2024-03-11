//
// RadarChart
// Created by Chetan Aggarwal.


import SwiftUI

struct RadarChartLabels: View {
    let labels: [String]
    let frameSize: CGSize
    
    var body: some View {
        let radius = min(frameSize.width, frameSize.height) / 2
        let angle = 2 * .pi / Double(labels.count)
        
        ForEach(0..<labels.count, id: \.self) { index in
            let currentAngle = Double(index) * angle - .pi / 2
            let x = frameSize.width / 2 + (radius + 20) * CGFloat(cos(currentAngle))
            let y = frameSize.height / 2 + (radius + 20) * CGFloat(sin(currentAngle))
            
            Text(labels[index])
                .foregroundColor(.white)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .position(x: x, y: y)
        }
    }
}
