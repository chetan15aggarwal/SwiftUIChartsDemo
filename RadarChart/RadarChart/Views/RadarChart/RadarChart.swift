//
// RadarChart
// Created by Chetan Aggarwal.


import SwiftUI

struct RadarChart: View {
    let data: [Double]
    let labels: [String]
    let maxValues: [Double]
    let designInterval: Double
    let shapeColor: Color
    let frameHeight: CGFloat?
    let frameWidth: CGFloat?
    
    init(data: [Double], labels: [String], maxValues: [Double], designInterval: Double, shapeColor: Color, frameHeight: CGFloat? = nil, frameWidth: CGFloat? = nil) {
        self.data = data
        self.labels = labels
        self.maxValues = maxValues
        self.designInterval = designInterval
        self.shapeColor = shapeColor
        self.frameHeight = frameHeight
        self.frameWidth = frameWidth
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RadarChartShape(data: data, maxValues: maxValues, frameSize: geometry.size, shapeColor: shapeColor)
                RadarChartLabels(labels: labels, frameSize: geometry.size)
            }
        }
        .frame(width: frameWidth, height: frameHeight)
    }
}

#Preview {
    RadarChart(data: [100.0, 200.0, 100.0, 200.0], labels: ["this", "is only", "test"], maxValues: [200.0, 300.0, 200.0, 300.0], designInterval: 200, shapeColor: .blue)
}
