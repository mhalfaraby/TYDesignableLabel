// The Swift Programming Language
// https://docs.swift.org/swift-book


import UIKit

@IBDesignable
public class TYDesignableLabel: UILabel {

    @IBInspectable public var extraLineSpacing: CGFloat = 0 {
        didSet { renderText() }
    }

    @IBInspectable public var extraFirstLineHeadIndent: CGFloat = 0 {
        didSet { renderText() }
    }

    @IBInspectable public var extraHeadIndent: CGFloat = 0 {
        didSet { renderText() }
    }

    @IBInspectable public var extraPadding: String = "" {
        didSet {
            padding = NSCoder.uiEdgeInsets(for: extraPadding)
            invalidateIntrinsicContentSize()
            setNeedsDisplay()
        }
    }

    public var padding: UIEdgeInsets = .zero {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsDisplay()
        }
    }

    public override var text: String? {
        didSet { renderText() }
    }

    public override var textAlignment: NSTextAlignment {
        didSet { renderText() }
    }

    public override func drawText(in rect: CGRect) {
        let insetRect = rect.inset(by: padding)
        super.drawText(in: insetRect)
    }

    public override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.height += padding.top + padding.bottom
        size.width += padding.left + padding.right
        return size
    }

    private func renderText() {
        guard let text = self.text, !text.isEmpty else { return }
        let attrString = NSMutableAttributedString(string: text)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = extraLineSpacing
        style.firstLineHeadIndent = extraFirstLineHeadIndent
        style.headIndent = extraHeadIndent
        style.alignment = textAlignment
        attrString.addAttribute(.paragraphStyle, value: style, range: NSMakeRange(0, text.count))
        attributedText = attrString
        setNeedsDisplay()
    }
}
