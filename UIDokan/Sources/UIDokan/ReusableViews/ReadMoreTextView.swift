// Credits to https://github.com/ilyapuchka/ReadMoreTextView
//  ReadMoreTextView.swift
//
//
//  Created by Ahmad Yasser on 22/07/2022.
//

import UIKit

/**
 UITextView subclass that adds "read more"/"read less" capabilities.
 Disables scrolling and editing, so do not set these properties to true.
 */
@IBDesignable
public class ReadMoreTextView: UITextView {

    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        readMoreTextPadding = .zero
        readLessTextPadding = .zero
        super.init(frame: frame, textContainer: textContainer)
        setupDefaults()
    }

    public convenience init(frame: CGRect) {
        self.init(frame: frame, textContainer: nil)
    }

    public convenience init() {
        self.init(frame: CGRect.zero, textContainer: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        readMoreTextPadding = .zero
        readLessTextPadding = .zero
        super.init(coder: aDecoder)
        setupDefaults()
    }

    func setupDefaults() {
        let defaultReadMoreText = NSLocalizedString("ReadMoreTextView.readMore", value: "more", comment: "")
        let attributedReadMoreText = NSMutableAttributedString(string: "... ")

        readMoreTextPadding = .zero
        readLessTextPadding = .zero
        isScrollEnabled = false
        isEditable = false

        // MARK: Customize "read more..." option

        let attributedDefaultReadMoreText = NSAttributedString(string: defaultReadMoreText, attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.lightGray,
            NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: 14),
        ])
        attributedReadMoreText.append(attributedDefaultReadMoreText)

        self.attributedReadMoreText = attributedReadMoreText
    }

    /** Block to be invoked when text view changes its content size. */
    public var onSizeChange: (ReadMoreTextView) -> Void = { _ in }

    /**
     The maximum number of lines that the text view can display. If text does not fit that number it will be trimmed.
     Default is `0` which means that no text will be never trimmed.
     */
    @IBInspectable
    public var maximumNumberOfLines: Int = 0 {
        didSet {
            _originalMaximumNumberOfLines = maximumNumberOfLines
            setNeedsLayout()
        }
    }

    /** The text to trim the original text. Setting this property resets `attributedReadMoreText`. */
    @IBInspectable
    public var readMoreText: String? {
        get {
            return attributedReadMoreText?.string
        }
        set {
            if let text = newValue {
                attributedReadMoreText = attributedStringWithDefaultAttributes(from: text)
            } else {
                attributedReadMoreText = nil
            }
        }
    }

    /** The attributed text to trim the original text. Setting this property resets `readMoreText`. */
    public var attributedReadMoreText: NSAttributedString? {
        didSet {
            setNeedsLayout()
        }
    }

    /**
     The text to append to the original text when not trimming.
     */
    @IBInspectable
    public var readLessText: String? {
        get {
            return attributedReadLessText?.string
        }
        set {
            if let text = newValue {
                attributedReadLessText = attributedStringWithDefaultAttributes(from: text)
            } else {
                attributedReadLessText = nil
            }
        }
    }

    /**
     The attributed text to append to the original text when not trimming.
     */
    public var attributedReadLessText: NSAttributedString? {
        didSet {
            setNeedsLayout()
        }
    }

    /**
     A Boolean that controls whether the text view should trim it's content to fit the `maximumNumberOfLines`.
     The default value is `false`.
     */
    @IBInspectable
    public var shouldTrim: Bool = false {
        didSet {
            guard shouldTrim != oldValue else { return }

            if shouldTrim {
                maximumNumberOfLines = _originalMaximumNumberOfLines
            } else {
                let _maximumNumberOfLines = maximumNumberOfLines
                maximumNumberOfLines = 0
                _originalMaximumNumberOfLines = _maximumNumberOfLines
            }
            cachedIntrinsicContentHeight = nil
            setNeedsLayout()
        }
    }

    /**
     Force to update trimming on the next layout pass. To update right away call `layoutIfNeeded` right after.
     */
    public func setNeedsUpdateTrim() {
        _needsUpdateTrim = true
        setNeedsLayout()
    }

    /**
     A padding around "read more" text to adjust touchable area.
     If text is trimmed touching in this area will change `shouldTream` to `false` and remove trimming.
     That will cause text view to change it's content size. Use `onSizeChange` to adjust layout on that event.
     */
    public var readMoreTextPadding: UIEdgeInsets

    /**
     A padding around "read less" text to adjust touchable area.
     If text is not trimmed and `readLessText` or `attributedReadLessText` is set touching in this area
     will change `shouldTream` to `true` and cause trimming. That will cause text view to change it's content size.
     Use `onSizeChange` to adjust layout on that event.
     */
    public var readLessTextPadding: UIEdgeInsets

    override public var text: String! {
        didSet {
            if let text = text {
                _originalAttributedText = attributedStringWithDefaultAttributes(from: text)
            } else {
                _originalAttributedText = nil
            }
        }
    }

    override public var attributedText: NSAttributedString! {
        willSet {
            if #available(iOS 9.0, *) { return }
            // on iOS 8 text view should be selectable to properly set attributed text
            if newValue != nil {
                isSelectable = true
            }
        }
        didSet {
            _originalAttributedText = attributedText
        }
    }

    override public func layoutSubviews() {
        super.layoutSubviews()

        if _needsUpdateTrim {
            // reset text to force update trim
            attributedText = _originalAttributedText
            _needsUpdateTrim = false
        }
        needsTrim() ? showLessText() : showMoreText()
    }

    override public var intrinsicContentSize: CGSize {
        textContainer.size = CGSize(width: bounds.size.width, height: CGFloat.greatestFiniteMagnitude)
        var intrinsicContentSize = layoutManager.boundingRect(forGlyphRange: layoutManager.glyphRange(for: textContainer), in: textContainer).size
        intrinsicContentSize.width = UIView.noIntrinsicMetric
        intrinsicContentSize.height += (textContainerInset.top + textContainerInset.bottom)
        intrinsicContentSize.height = ceil(intrinsicContentSize.height)
        return intrinsicContentSize
    }

    private var intrinsicContentHeight: CGFloat {
        return intrinsicContentSize.height
    }

    private var cachedIntrinsicContentHeight: CGFloat?

    override public func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        return hitTest(pointInGlyphRange: point, event: event) { _ in
            guard pointIsInReadMoreOrReadLessTextRange(point: point) != nil else { return nil }
            return self
        }
    }

    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let point = touches.first?.location(in: self) {
            shouldTrim = pointIsInReadMoreOrReadLessTextRange(point: point) ?? shouldTrim
        }
        super.touchesEnded(touches, with: event)
    }

    // MARK: Private methods

    private var _needsUpdateTrim = false
    private var _originalMaximumNumberOfLines: Int = 0
    private var _originalAttributedText: NSAttributedString!
    private var _originalTextLength: Int {
        return _originalAttributedText?.string.dataLength ?? 0
    }

    private func attributedStringWithDefaultAttributes(from text: String) -> NSAttributedString {
        return NSAttributedString(string: text, attributes: nil)

        // MARK: Attributes

        //        replace nil with these attributes
        //        NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: 14),
        //        NSAttributedString.Key.foregroundColor: textColor ?? UIColor.black
    }

    private func needsTrim() -> Bool {
        return shouldTrim && readMoreText != nil
    }

    private func showLessText() {
        if let readMoreText = readMoreText, text.hasSuffix(readMoreText) { return }

        shouldTrim = true
        textContainer.maximumNumberOfLines = maximumNumberOfLines

        layoutManager.invalidateLayout(forCharacterRange: layoutManager.characterRangeThatFits(textContainer: textContainer), actualCharacterRange: nil)
        textContainer.size = CGSize(width: bounds.size.width, height: CGFloat.greatestFiniteMagnitude)

        if let text = attributedReadMoreText {
            let range = rangeToReplaceWithReadMoreText()
            guard range.location != NSNotFound else { return }

            textStorage.replaceCharacters(in: range, with: text)
        }

        invalidateIntrinsicContentSize()
        invokeOnSizeChangeIfNeeded()
    }

    private func showMoreText() {
        if let readLessText = readLessText, text.hasSuffix(readLessText) { return }

        shouldTrim = false
        textContainer.maximumNumberOfLines = 0

        if let originalAttributedText = _originalAttributedText?.mutableCopy() as? NSMutableAttributedString {
            attributedText = _originalAttributedText
            let range = NSRange(location: 0, length: text.dataLength)
            if let attributedReadLessText = attributedReadLessText {
                originalAttributedText.append(attributedReadLessText)
            }
            textStorage.replaceCharacters(in: range, with: originalAttributedText)
        }

        invalidateIntrinsicContentSize()
        invokeOnSizeChangeIfNeeded()
    }

    private func invokeOnSizeChangeIfNeeded() {
        if let cachedIntrinsicContentHeight = cachedIntrinsicContentHeight {
            if intrinsicContentHeight != cachedIntrinsicContentHeight {
                self.cachedIntrinsicContentHeight = intrinsicContentHeight
                onSizeChange(self)
            }
        } else {
            cachedIntrinsicContentHeight = intrinsicContentHeight
            onSizeChange(self)
        }
    }

    private func rangeToReplaceWithReadMoreText() -> NSRange {
        let rangeThatFitsContainer = layoutManager.characterRangeThatFits(textContainer: textContainer)
        if NSMaxRange(rangeThatFitsContainer) == _originalTextLength {
            return NSMakeRange(NSNotFound, 0)
        } else {
            let lastCharacterIndex = characterIndexBeforeTrim(range: rangeThatFitsContainer)
            if lastCharacterIndex > 0 {
                return NSMakeRange(lastCharacterIndex, textStorage.string.dataLength - lastCharacterIndex)
            } else {
                return NSMakeRange(NSNotFound, 0)
            }
        }
    }

    private func characterIndexBeforeTrim(range rangeThatFits: NSRange) -> Int {
        if let text = attributedReadMoreText {
            let readMoreBoundingRect = attributedReadMoreText(text: text, boundingRectThatFits: textContainer.size)
            let lastCharacterRect = layoutManager.boundingRectForCharacterRange(
                range: NSMakeRange(NSMaxRange(rangeThatFits) - 1, 1),
                inTextContainer: textContainer
            )
            var point = lastCharacterRect.origin
            point.x = textContainer.size.width - ceil(readMoreBoundingRect.size.width)
            let glyphIndex = layoutManager.glyphIndex(for: point, in: textContainer, fractionOfDistanceThroughGlyph: nil)
            let characterIndex = layoutManager.characterIndexForGlyph(at: glyphIndex)
            return characterIndex - 1
        } else {
            return NSMaxRange(rangeThatFits) - readMoreText!.dataLength
        }
    }

    private func attributedReadMoreText(text aText: NSAttributedString, boundingRectThatFits size: CGSize) -> CGRect {
        let textContainer = NSTextContainer(size: size)
        let textStorage = NSTextStorage(attributedString: aText)
        let layoutManager = NSLayoutManager()
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        let readMoreBoundingRect = layoutManager.boundingRectForCharacterRange(range: NSMakeRange(0, text.dataLength), inTextContainer: textContainer)
        return readMoreBoundingRect
    }

    private func readMoreTextRange() -> NSRange {
        var readMoreTextRange = rangeToReplaceWithReadMoreText()
        if readMoreTextRange.location != NSNotFound {
            readMoreTextRange.length = readMoreText!.dataLength + 1
        }
        return readMoreTextRange
    }

    private func readLessTextRange() -> NSRange {
        return NSRange(location: _originalTextLength, length: readLessText!.dataLength + 1)
    }

    private func pointIsInReadMoreOrReadLessTextRange(point aPoint: CGPoint) -> Bool? {
        if needsTrim(), pointIsInTextRange(point: aPoint, range: readMoreTextRange(), padding: readMoreTextPadding) {
            return false
        } else if readLessText != nil, pointIsInTextRange(point: aPoint, range: readLessTextRange(), padding: readLessTextPadding) {
            return true
        }
        return nil
    }
}

// MARK: - String Private Helpers

private extension String {

    var dataLength: Int {
        return utf16.count
    }
}

// MARK: - NSLayoutManager Private Helpers

public extension NSLayoutManager {

    /**
     Returns characters range that completely fits into container.
     */
    func characterRangeThatFits(textContainer container: NSTextContainer) -> NSRange {
        var rangeThatFits = glyphRange(for: container)
        rangeThatFits = characterRange(forGlyphRange: rangeThatFits, actualGlyphRange: nil)
        return rangeThatFits
    }

    /**
     Returns bounding rect in provided container for characters in provided range.
     */
    func boundingRectForCharacterRange(range aRange: NSRange, inTextContainer container: NSTextContainer) -> CGRect {
        let glyphRange = glyphRange(forCharacterRange: aRange, actualCharacterRange: nil)
        let boundingRect = boundingRect(forGlyphRange: glyphRange, in: container)
        return boundingRect
    }
}

// MARK: - UITextView Private Helpers

private extension UITextView {

    /**
     Calls provided `test` block if point is in glyph range and there is no link detected at this point.
     Will pass in to `test` a character index that corresponds to `point`.
     Return `self` in `test` if text view should intercept the touch event or `nil` otherwise.
     */
    func hitTest(pointInGlyphRange aPoint: CGPoint, event: UIEvent?, test: (Int) -> UIView?) -> UIView? {
        guard let charIndex = charIndexForPointInGlyphRect(point: aPoint) else {
            return super.hitTest(aPoint, with: event)
        }
        guard textStorage.attribute(NSAttributedString.Key.link, at: charIndex, effectiveRange: nil) == nil else {
            return super.hitTest(aPoint, with: event)
        }
        return test(charIndex)
    }

    /**
     Returns true if point is in text bounding rect adjusted with padding.
     Bounding rect will be enlarged with positive padding values and decreased with negative values.
     */
    func pointIsInTextRange(point aPoint: CGPoint, range: NSRange, padding: UIEdgeInsets) -> Bool {
        var boundingRect = layoutManager.boundingRectForCharacterRange(range: range, inTextContainer: textContainer)
        boundingRect = boundingRect.offsetBy(dx: textContainerInset.left, dy: textContainerInset.top)
        boundingRect = boundingRect.insetBy(dx: -(padding.left + padding.right), dy: -(padding.top + padding.bottom))
        return boundingRect.contains(aPoint)
    }

    /**
     Returns index of character for glyph at provided point. Returns `nil` if point is out of any glyph.
     */
    func charIndexForPointInGlyphRect(point aPoint: CGPoint) -> Int? {
        let point = CGPoint(x: aPoint.x, y: aPoint.y - textContainerInset.top)
        let glyphIndex = layoutManager.glyphIndex(for: point, in: textContainer)
        let glyphRect = layoutManager.boundingRect(forGlyphRange: NSMakeRange(glyphIndex, 1), in: textContainer)
        if glyphRect.contains(point) {
            return layoutManager.characterIndexForGlyph(at: glyphIndex)
        } else {
            return nil
        }
    }
}
