import SwiftUI
import DesignSystem

struct ServicesView: View {
  var body: some View {
    NavigationView {
      ScrollView {
        VStack(alignment: .leading, spacing: 24) {
          Text("Usługi")
            .font(.largeTitle.weight(.bold))
            .foregroundColor(.white)
            .padding(.horizontal)
            .padding(.top, 10)

          // Favorite Services grid
          VStack(alignment: .leading, spacing: 14) {
            Text("Ulubione")
              .font(.headline)
              .foregroundColor(.neutral200)
              .padding(.horizontal)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
              ServiceGridItem(title: "Punkty karne", systemIcon: "exclamationmark.triangle.fill", color: .orange100)
              ServiceGridItem(title: "ePłatności", systemIcon: "creditcard.fill", color: .blue100)
              ServiceGridItem(title: "Bezpieczny autobus", systemIcon: "bus.fill", color: .green100)
              ServiceGridItem(title: "Historia pojazdu", systemIcon: "clock.arrow.2.circlepath", color: .purple100)
              ServiceGridItem(title: "Zastrzeż PESEL", systemIcon: "lock.shield.fill", color: .red100)
              ServiceGridItem(title: "eRecepta", systemIcon: "pills.fill", color: .pink100)
            }
            .padding(.horizontal)
          }

          // Categories section
          VStack(alignment: .leading, spacing: 14) {
            Text("Wszystkie usługi według kategorii")
              .font(.headline)
              .foregroundColor(.neutral200)
              .padding(.horizontal)

            VStack(spacing: 12) {
              CategoryRow(title: "Zdrowie", icon: "heart.text.square.fill")
              CategoryRow(title: "Kierowca i pojazdy", icon: "car.2.fill")
              CategoryRow(title: "Finanse", icon: "dollarsign.circle.fill")
              CategoryRow(title: "Bezpieczeństwo", icon: "shield.righthalf.filled")
              CategoryRow(title: "Sprawy urzędowe", icon: "doc.plaintext.fill")
            }
            .padding(.horizontal)
          }

          Spacer()
        }
        .padding(.vertical)
      }
      .background(Color.black.ignoresSafeArea())
      .navigationBarHidden(true)
    }
  }
}

struct ServiceGridItem: View {
  let title: String
  let systemIcon: String
  let color: Color

  var body: some View {
    VStack(spacing: 8) {
      ZStack {
        RoundedRectangle(cornerRadius: 16)
          .fill(color.opacity(0.12))
          .frame(width: 80, height: 80)

        Image(systemName: systemIcon)
          .resizable()
          .scaledToFit()
          .frame(width: 32, height: 32)
          .foregroundColor(color)
      }

      Text(title)
        .font(.system(size: 11, weight: .semibold))
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .lineLimit(2)
        .frame(height: 32, alignment: .top)
    }
    .frame(maxWidth: .infinity)
  }
}

struct CategoryRow: View {
  let title: String
  let icon: String

  var body: some View {
    HStack(spacing: 16) {
      Image(systemName: icon)
        .font(.title3)
        .foregroundColor(.blue100)
        .frame(width: 28, height: 28)

      Text(title)
        .font(.body.weight(.medium))
        .foregroundColor(.white)

      Spacer()

      Image(systemName: "chevron.right")
        .font(.footnote)
        .foregroundColor(.neutral200)
    }
    .padding()
    .background(Color.neutral500.opacity(0.1))
    .cornerRadius(12)
  }
}
