import PlaygroundSupport
import UIKit

final class CodeView : UIView {
    var code: Code? {
        didSet {
            if let _code = code {
                for view in stackView.arrangedSubviews {
                    stackView.removeArrangedSubview(view)
                }

                for (_, color) in _code.enumerated() {
//                    let view = PegView(frame: CGRect(origin: CGPoint(x: CGFloat(index) * 25.0, y: 0), size: CGSize(width: 25, height: 25)))
                    let view = PegView(frame: CGRect(origin: .zero, size: CGSize(width: 25, height: 25)))
                    view.color = color
                    stackView.addArrangedSubview(view)
                }
            }
            setNeedsDisplay()
        }
    }
    let stackView: UIStackView

    override init(frame: CGRect) {
        self.code = nil
        self.stackView = UIStackView()
        super.init(frame: frame)
        sharedInit()
    }
    required init?(coder aDecoder: NSCoder) {
        self.code = nil
        self.stackView = UIStackView()
        super.init(coder: aDecoder)
        sharedInit()
    }

    func sharedInit() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        addSubview(stackView)

        let constraints: [NSLayoutConstraint] = [
            leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            topAnchor.constraint(equalTo: stackView.topAnchor),
            bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
        ]
        addConstraints(constraints)
        NSLayoutConstraint.activate(constraints)

        backgroundColor = .black
    }
}

class PegView: UIView {
    var color: Color? {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        let fullRect = CGRect(origin: .zero, size: bounds.size)
        context.saveGState()
        defer { context.restoreGState() }
        context.clear(fullRect)

        guard let _color = color else {
            return
        }

        let path = UIBezierPath()
        path.move(to: fullRect.midXminY)
        path.addCurve(to: fullRect.maxXmidY, controlPoint1: fullRect.maxXminY, controlPoint2: fullRect.maxXminY)
        path.addCurve(to: fullRect.midXmaxY, controlPoint1: fullRect.maxXmaxY, controlPoint2: fullRect.maxXmaxY)
        path.addCurve(to: fullRect.minXmidY, controlPoint1: fullRect.minXmaxY, controlPoint2: fullRect.minXmaxY)
        path.addCurve(to: fullRect.midXminY, controlPoint1: fullRect.minXMinY, controlPoint2: fullRect.minXMinY)
        context.setFillColor(_color.cgColor)
        path.fill()
    }
}

let codeView = CodeView(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 25)))
codeView.backgroundColor = .blue
codeView.code = [.lightGrey, .blue, .green, .orange]
PlaygroundPage.current.liveView = codeView
codeView.code = [.red, .orange, .yellow, .blue]
