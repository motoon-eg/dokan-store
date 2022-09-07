//
//  File.swift
//
//
//  Created by ziad on 04/08/2022.
//

import UIKit

/// This extension implements a Builder pattern to use with the UIAlertViewController.
/// Example:
/// ```
/// UIAlertController.Builder()
///    .withTitle("this_is_a_key_from_localizable.strings")
///    .withMessage("This is a normal message")
///    .addOkAction()
///    .show(in: UIViewController) OR .build() to get back the UIAlertController directly
/// ```
public extension UIAlertController {

    // MARK: - Static function

    static func showOkAlert(withTitle title: String? = nil, withMessage message: String? = nil, viewController: UIViewController) {
        UIAlertController.Builder()
            .title(title)
            .message(message)
            .addOkAction()
            .show(in: viewController, animated: true)
    }

    /// Builder Pattern to show
    class Builder {
        public init() {}
        var preferredStyle: UIAlertController.Style = .alert
        var title: String?
        var message: String?
        var actions: [UIAlertAction] = .init()
        var popoverSourceView: UIView?
        var sourceRect: CGRect?
    }
}

// MARK: - Actions

public extension UIAlertController.Builder {
    func preferredStyle(_ style: UIAlertController.Style) -> Self {
        preferredStyle = style
        return self
    }

    func title(_ title: String?) -> Self {
        self.title = title ?? ""
        return self
    }

    func message(_ message: String?) -> Self {
        self.message = message ?? ""
        return self
    }

    func popoverSourceView(_ view: UIView?) -> Self {
        popoverSourceView = view
        return self
    }

    func addOkAction(handler: ((UIAlertAction) -> Void)? = nil) -> Self {
        return addDefaultActionWithTitle("OK", handler: handler)
    }

    func addDeleteAction(handler: ((UIAlertAction) -> Void)? = nil) -> Self {
        return addDestructiveActionWithTitle("Delete", handler: handler)
    }

    func addCancelAction(handler: ((UIAlertAction) -> Void)? = nil) -> Self {
        return addCancelActionWithTitle("Cancel", handler: handler)
    }

    func addDefaultActionWithTitle(_ title: String, handler: ((UIAlertAction) -> Void)? = nil) -> Self {
        return addActionWithTitle(title, style: .default, handler: handler)
    }

    func addDestructiveActionWithTitle(_ title: String, handler: ((UIAlertAction) -> Void)? = nil) -> Self {
        return addActionWithTitle(title, style: .destructive, handler: handler)
    }

    func addCancelActionWithTitle(_ title: String, handler: ((UIAlertAction) -> Void)? = nil) -> Self {
        return addActionWithTitle(title, style: .cancel, handler: handler)
    }

    func addActionWithTitle(_ title: String, style: UIAlertAction.Style, handler: ((UIAlertAction) -> Void)?) -> Self {
        let action = UIAlertAction(title: NSLocalizedString(title, comment: ""), style: style, handler: handler)
        actions.append(action)
        return self
    }

    func show(in viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        viewController.present(build(), animated: animated, completion: completion)
    }

    private func build() -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)

        if let popoverSourceView = popoverSourceView {
            alert.popoverPresentationController?.sourceView = popoverSourceView
        }

        actions.forEach { action in
            alert.addAction(action)
        }

        return alert
    }
}
