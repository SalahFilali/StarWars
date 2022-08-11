// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {

  internal enum TotalMovies {
    /// Total %d movies
    internal static func format(_ p1: Int) -> String {
      return Strings.tr("Localizable", "Total-Movies.format", p1)
    }
  }

  internal enum BackButton {
    /// Back
    internal static let title = Strings.tr("Localizable", "back-button.title")
  }

  internal enum CreatedAt {
    /// Created
    internal static let title = Strings.tr("Localizable", "created-at.title")
  }

  internal enum Director {
    /// Director
    internal static let title = Strings.tr("Localizable", "director.title")
  }

  internal enum EditedAt {
    /// Edited
    internal static let title = Strings.tr("Localizable", "edited-at.title")
  }

  internal enum InternalError {
    /// Sorry, we ran into an unexpected error.
    /// Please try again.
    internal static let text = Strings.tr("Localizable", "internal-error.text")
    /// Oups!
    internal static let title = Strings.tr("Localizable", "internal-error.title")
  }

  internal enum MoviesScreen {
    /// Star Wars
    internal static let title = Strings.tr("Localizable", "movies-screen.title")
  }

  internal enum NetworkError {
    /// Please check your network connection.
    internal static let text = Strings.tr("Localizable", "network-error.text")
    /// Network Problem
    internal static let title = Strings.tr("Localizable", "network-error.title")
  }

  internal enum OkButton {
    /// Ok
    internal static let title = Strings.tr("Localizable", "ok-button.title")
  }

  internal enum OpeningCraw {
    /// Opening craw
    internal static let title = Strings.tr("Localizable", "opening-craw.title")
  }

  internal enum Producer {
    /// Producer
    internal static let title = Strings.tr("Localizable", "producer.title")
  }

  internal enum RefreshLoading {
    /// Loading...
    internal static let title = Strings.tr("Localizable", "refresh-loading.title")
  }

  internal enum ReleaseDate {
    /// Release date
    internal static let title = Strings.tr("Localizable", "release-date.title")
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
