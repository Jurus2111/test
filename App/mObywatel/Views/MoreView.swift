import SwiftUI
import DesignSystem

struct MoreView: View {
  var body: some View {
    NavigationView {
      ScrollView {
        VStack(alignment: .leading, spacing: 24) {
          Text("Więcej")
            .font(.largeTitle.weight(.bold))
            .foregroundColor(.white)
            .padding(.horizontal)
            .padding(.top, 10)

          // Menu groups
          VStack(spacing: 12) {
            MoreMenuRow(title: "Wygląd aplikacji", subtitle: "Zmień motyw na jasny lub ciemny", systemIcon: "paintpalette.fill")
            MoreMenuRow(title: "Bezpieczeństwo", subtitle: "Zmień kod PIN lub biometrię", systemIcon: "lock.shield.fill")
            MoreMenuRow(title: "Pomoc", subtitle: "Najczęściej zadawane pytania, kontakt", systemIcon: "questionmark.circle.fill")
            MoreMenuRow(title: "O aplikacji mObywatel", subtitle: "Licencje, twórcy, regulamin", systemIcon: "info.circle.fill")
          }
          .padding(.horizontal)

          // Red Logout Button
          Button {
            // Log out action - since we are doing visual shell, simple dismiss
          } label: {
            HStack {
              Image(systemName: "power")
              Text("Wyloguj się")
            }
            .font(.headline.weight(.bold))
            .foregroundColor(.red100)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(Color.red100.opacity(0.12))
            .cornerRadius(12)
            .overlay(
              RoundedRectangle(cornerRadius: 12)
                .stroke(Color.red100.opacity(0.3), lineWidth: 1)
            )
          }
          .padding(.horizontal)
          .padding(.top, 16)

          Spacer()
        }
        .padding(.vertical)
      }
      .background(Color.black.ignoresSafeArea())
      .navigationBarHidden(true)
    }
  }
}

struct MoreMenuRow: View {
  let title: String
  let subtitle: String
  let systemIcon: String

  var body: some View {
    HStack(spacing: 16) {
      ZStack {
        Circle()
          .fill(Color.neutral500.opacity(0.15))
          .frame(width: 40, height: 40)
        Image(systemName: systemIcon)
          .foregroundColor(.blue100)
      }

      VStack(alignment: .leading, spacing: 2) {
        Text(title)
          .font(.body.weight(.semibold))
          .foregroundColor(.white)
        Text(subtitle)
          .font(.caption)
          .foregroundColor(.neutral200)
      }

      Spacer()

      Image(systemName: "chevron.right")
        .font(.footnote)
        .foregroundColor(.neutral200)
    }
    .padding()
    .background(Color.neutral500.opacity(0.08))
    .cornerRadius(12)
  }
}
