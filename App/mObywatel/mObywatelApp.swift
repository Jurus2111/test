import SwiftUI
import DesignSystem

@main
struct mObywatelApp: App {
  init() {
    setupAppearance(appTheme: AppTheme())
  }

  var body: some Scene {
    WindowGroup {
      LoginView()
        .environment(\.appTheme, AppTheme())
        .preferredColorScheme(.dark)
    }
  }
}
