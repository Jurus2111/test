import SwiftUI

extension ToggleStyle where Self == RadioToggleStyle {
  public static var radio: Self {
    .init()
  }
}

public struct RadioToggleStyle: ToggleStyle {
  @Environment(\.isValid) private var isValid
  @Environment(\.isEnabled) private var isEnabled
  @Environment(\.appTheme) private var appTheme

  public init() {}

  public func makeBody(configuration: Configuration) -> some View {
    HStack(alignment: .center, spacing: .spacing200) {
      ZStack {
        Circle()
          .strokeBorder(borderColor, lineWidth: Constants.strokeWidth)
          .frame(size: Constants.outerSize)

        if configuration.isOn {
          Circle()
            .fill(selectedColor)
            .frame(size: Constants.innerSize)
        }
      }
      .frame(size: Constants.outerSize)
      .padding(.spacing25)

      configuration.label
        .foregroundStyle(Color.neutral500)
        .frame(minHeight: .spacing300)

      Spacer(minLength: .zero)
    }
    .frame(maxWidth: .infinity)
    .contentShape(.rect)
    .onTapGesture { configuration.isOn = true }
  }
}

private extension RadioToggleStyle {
  var selectedColor: Color {
    guard isValid else { return .red100 }
    return isEnabled ? appTheme.colors.primary900 : .neutral30
  }

  var borderColor: Color {
    guard isValid else { return .red100 }
    return isEnabled ? (appTheme.colors.primary900) : .neutral30
  }
}

private enum Constants {
  static let strokeWidth = 2.0
  static let outerSize = 20.0
  static let innerSize = 10.0
}
