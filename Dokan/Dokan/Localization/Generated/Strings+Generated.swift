// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum Strings {

  public enum ProfileAndPassword {
    /// Full Name
    public static let fullName = Strings.tr("Localizable", "ProfileAndPassword.fullName")
    /// Password
    public static let password = Strings.tr("Localizable", "ProfileAndPassword.password")
    /// Referal Code (Optional)
    public static let referalCode = Strings.tr("Localizable", "ProfileAndPassword.referalCode")
    /// Profile & Password
    public static let title = Strings.tr("Localizable", "ProfileAndPassword.title")
    public enum Button {
      /// Confirmation
      public static let confirmation = Strings.tr("Localizable", "ProfileAndPassword.button.confirmation")
    }
  }

  public enum App {
    /// Mega Mall
    public static let title = Strings.tr("Localizable", "app.title")
  }

  public enum Login {
    /// Sign In
    public static let button = Strings.tr("Localizable", "login.button")
    /// Welcome back to Mega Mall
    public static let title = Strings.tr("Localizable", "login.title")
    public enum Button {
      /// Forgot Password
      public static let forgotPassword = Strings.tr("Localizable", "login.button.forgotPassword")
      /// Sign Up
      public static let signUp = Strings.tr("Localizable", "login.button.signUp")
    }
    public enum Email {
      /// Email/ Phone
      public static let title = Strings.tr("Localizable", "login.email.title")
    }
    public enum Password {
      /// Password
      public static let title = Strings.tr("Localizable", "login.password.title")
    }
  }

  public enum ProductDetails {
    public enum Button {
      /// See All
      public static let seeAll = Strings.tr("Localizable", "productDetails.button.seeAll")
      /// See All News
      public static let seeAllNews = Strings.tr("Localizable", "productDetails.button.seeAllNews")
    }
    public enum PlaceHolder {
      /// Search Product Name
      public static let search = Strings.tr("Localizable", "productDetails.placeHolder.search")
    }
    public enum Title {
      /// Best Sellers
      public static let bestSellers = Strings.tr("Localizable", "productDetails.title.bestSellers")
      /// Categories
      public static let categories = Strings.tr("Localizable", "productDetails.title.categories")
      /// Featured Product
      public static let featuredProduct = Strings.tr("Localizable", "productDetails.title.featuredProduct")
      /// Latest News
      public static let latestNews = Strings.tr("Localizable", "productDetails.title.latestNews")
      /// New Arrivals
      public static let newArrivals = Strings.tr("Localizable", "productDetails.title.newArrivals")
      /// Special Offers
      public static let specialOffers = Strings.tr("Localizable", "productDetails.title.specialOffers")
      /// Top Rated Product
      public static let topRated = Strings.tr("Localizable", "productDetails.title.topRated")
    }
  }

  public enum Register {
    /// Have an Account?
    public static let haveAccount = Strings.tr("Localizable", "register.haveAccount")
    /// Register Account
    public static let title = Strings.tr("Localizable", "register.title")
    public enum Button {
      /// Continue
      public static let `continue` = Strings.tr("Localizable", "register.button.continue")
      /// Sign In
      public static let signIn = Strings.tr("Localizable", "register.button.signIn")
    }
  }

  public enum ResetPassword {
    /// Reset
    public static let button = Strings.tr("Localizable", "resetPassword.button")
    /// Reset Password
    public static let title = Strings.tr("Localizable", "resetPassword.title")
  }

  public enum Verification {
    /// Verification
    public static let title = Strings.tr("Localizable", "verification.title")
    public enum Button {
      /// Continue
      public static let `continue` = Strings.tr("Localizable", "verification.button.continue")
      /// Re-send Code
      public static let resend = Strings.tr("Localizable", "verification.button.resend")
    }
    public enum Otc {
      /// Verification Code
      public static let title = Strings.tr("Localizable", "verification.otc.title")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
