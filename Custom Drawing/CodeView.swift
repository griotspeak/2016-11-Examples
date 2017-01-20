//
//  CodeView.swift
//  Mastermind
//
//  Created by TJ Usiyan on 2017/01/20.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit

class CodeView: UIView {
    var code: Code? {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {

        guard let context = UIGraphicsGetCurrentContext() else { return }
        let fullRect = CGRect(origin: .zero, size: bounds.size)
        context.saveGState()
        defer { context.restoreGState() }
        context.setFillColor(UIColor.darkGray.cgColor)
        context.fill(fullRect)

        guard let _code = code, _code.length == 4 else {
                return
        }


        let quarterHeight = fullRect.size.height * 0.25
        let eigthHeight = fullRect.size.height * 0.125
        let pegRadius: CGFloat = 25
        let centerX = fullRect.size.width * 0.5

        for i in 0..<4 {
            let iAsFloat = CGFloat(i)
            let pegCenter = CGPoint(x: centerX, y: eigthHeight + (quarterHeight * iAsFloat))
            let pegPath = UIBezierPath()
            pegPath.addArc(withCenter: pegCenter, radius: pegRadius, startAngle: 0, endAngle: 2 * CGFloat(M_PI), clockwise: true)
            context.setFillColor(_code.value[i].cgColor)
            pegPath.fill()
        }


    }

    func fillBlueWithYellowLineTopLeftToCenter(context: CGContext) {
        let fullRect = CGRect(origin: .zero, size: bounds.size)
        context.clear(fullRect)
        context.setFillColor(UIColor.blue.cgColor)

        let topLeft = CGPoint(x: fullRect.minX, y: fullRect.minY)

        context.fill(fullRect)

        let path = UIBezierPath()
        path.move(to: fullRect.center)
        path.addLine(to: topLeft)

        context.setStrokeColor(UIColor.yellow.cgColor)
        path.lineWidth = 10
        path.lineCapStyle = .round

        path.stroke()
    }
}


extension CGRect {
    public var center: CGPoint {
        return CGPoint(x: origin.x + (size.width * 0.5), y: origin.y + (size.height * 0.5))
    }
}

extension Color {
    var cgColor: CGColor {
        switch self {
        case .red:
            return UIColor.red.cgColor
        case .orange:
            return UIColor.orange.cgColor
        case .yellow:
            return UIColor.yellow.cgColor
        case .green:
            return UIColor.green.cgColor
        case .blue:
            return UIColor.blue.cgColor
        case .purple:
            return UIColor.purple.cgColor
        case .magenta:
            return UIColor.magenta.cgColor
        case .lightGrey:
            return UIColor.lightGray.cgColor
        }
    }
}
