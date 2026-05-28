import SwiftUI
import DesignSystem

struct MainTabView: View {
  @State private var selectedTab = 0

  var body: some View {
    TabView(selection: $selectedTab) {
      DocumentsView()
        .tabItem {
          Label("Dokumenty", image: "IF001_Documents")
        }
        .tag(0)

      ServicesView()
        .tabItem {
          Label("Usługi", image: "IF002_Services")
        }
        .tag(1)

      QRCodeView()
        .tabItem {
          Label("Kod QR", image: "IF004_Scan")
        }
        .tag(2)

      MoreView()
        .tabItem {
          Label("Więcej", image: "IF005_More")
        }
        .tag(3)
    }
    .accentColor(Color.blue100)
  }
}
