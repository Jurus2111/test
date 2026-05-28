import SwiftUI
import DesignSystem

struct mDowodView: View {
  @Environment(\.presentationMode) var presentationMode
  @State private var currentTimeString = ""
  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

  var body: some View {
    ZStack {
      // Very dark navy-black background matching the screenshot
      Color(red: 0.03, green: 0.05, blue: 0.08)
        .ignoresSafeArea()

      VStack(spacing: 0) {
        // Navigation bar
        HStack {
          Button {
            presentationMode.wrappedValue.dismiss()
          } label: {
            HStack(spacing: 4) {
              Image(systemName: "chevron.left")
              Text("Wróć")
            }
            .font(.body)
            .foregroundColor(Color(red: 0.2, green: 0.55, blue: 0.95))
          }

          Spacer()

          Text("mDowód")
            .font(.headline.weight(.semibold))
            .foregroundColor(.white)

          Spacer()

          Button {
            // Info action
          } label: {
            Image(systemName: "questionmark.circle")
              .font(.title3)
              .foregroundColor(.neutral200)
          }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)

        ScrollView {
          VStack(spacing: 20) {
            // Live clock label
            Text("Czas: \(currentTimeString)")
              .font(.system(size: 13, weight: .medium))
              .foregroundColor(.neutral200)
              .padding(.top, 4)
              .onAppear { updateTime() }
              .onReceive(timer) { _ in updateTime() }

            // Document Details Panel
            VStack(alignment: .leading, spacing: 0) {
              HStack(alignment: .top, spacing: 18) {
                // Large white profile picture placeholder
                RoundedRectangle(cornerRadius: 12)
                  .fill(Color.white)
                  .frame(width: 120, height: 156)
                  .shadow(radius: 4)

                // Detail columns
                VStack(alignment: .leading, spacing: 12) {
                  VStack(alignment: .leading, spacing: 2) {
                    Text("JAN")
                      .font(.system(size: 16, weight: .bold))
                      .foregroundColor(.white)
                    Text("Imię (imiona)")
                      .font(.system(size: 11))
                      .foregroundColor(.neutral200)
                  }

                  VStack(alignment: .leading, spacing: 2) {
                    Text("KOWALSKI")
                      .font(.system(size: 16, weight: .bold))
                      .foregroundColor(.white)
                    Text("Nazwisko")
                      .font(.system(size: 11))
                      .foregroundColor(.neutral200)
                  }

                  VStack(alignment: .leading, spacing: 2) {
                    Text("POLSKIE")
                      .font(.system(size: 16, weight: .bold))
                      .foregroundColor(.white)
                    Text("Obywatelstwo")
                      .font(.system(size: 11))
                      .foregroundColor(.neutral200)
                  }
                }
              }
              .padding(.bottom, 16)

              // Flag + Emblem Row
              HStack(alignment: .center, spacing: 20) {
                // Red/White flag with rounded corners
                VStack(spacing: 0) {
                  Rectangle()
                    .fill(Color.white)
                    .frame(height: 18)
                  Rectangle()
                    .fill(Color.red100)
                    .frame(height: 18)
                }
                .frame(width: 52, height: 36)
                .cornerRadius(4)
                .overlay(
                  RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.white.opacity(0.15), lineWidth: 1)
                )

                // Eagle crest + Rzeczpospolita Polska
                HStack(spacing: 8) {
                  // Small Eagle Placeholder
                  ZStack {
                    Circle()
                      .fill(Color.white)
                      .frame(width: 24, height: 24)
                    Image(systemName: "bird.fill")
                      .resizable()
                      .scaledToFit()
                      .frame(width: 14, height: 14)
                      .foregroundColor(.black)
                  }

                  VStack(alignment: .leading, spacing: 0) {
                    Text("Rzeczpospolita")
                      .font(.system(size: 10, weight: .bold))
                    Text("Polska")
                      .font(.system(size: 10, weight: .bold))
                  }
                  .foregroundColor(.white)
                }

                Spacer()
              }
              .padding(.bottom, 20)

              // Remaining profile elements
              VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 2) {
                  Text("15.05.2007")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                  Text("Data urodzenia")
                    .font(.system(size: 11))
                    .foregroundColor(.neutral200)
                }

                VStack(alignment: .leading, spacing: 2) {
                  Text("07251512344")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                  Text("Numer PESEL")
                    .font(.system(size: 11))
                    .foregroundColor(.neutral200)
                }
              }
            }
            .padding(20)
            .background(
              RoundedRectangle(cornerRadius: 16)
                .fill(Color.neutral500.opacity(0.08))
            )
            .padding(.horizontal, 16)

            // Green "Dokument ważny" status box
            HStack(spacing: 12) {
              ZStack {
                Circle()
                  .fill(Color.green100.opacity(0.2))
                  .frame(width: 24, height: 24)
                Image(systemName: "checkmark")
                  .font(.system(size: 12, weight: .bold))
                  .foregroundColor(.green100)
              }

              Text("Dokument ważny")
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.green100)

              Spacer()
            }
            .padding(.horizontal, 20)
            .frame(height: 54)
            .background(
              RoundedRectangle(cornerRadius: 12)
                .fill(Color.neutral500.opacity(0.1))
            )
            .padding(.horizontal, 16)

            // Shortcuts Row (4 icons)
            HStack(alignment: .top, spacing: 0) {
              ShortcutItem(iconName: "person.badge.shield.checkmark.fill", text: "Potwierdź swoje dane")
              Spacer()
              ShortcutItem(iconName: "doc.text.fill", text: "Dane dowodu osobistego")
              Spacer()
              ShortcutItem(iconName: "lock.shield.fill", text: "Zastrzeż PESEL")
              Spacer()
              ShortcutItem(iconName: "ellipsis", text: "Pozostałe skróty")
            }
            .padding(.horizontal, 16)
            .padding(.top, 10)

            Spacer(minLength: 40)
          }
        }
      }
    }
  }

  private func updateTime() {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm:ss dd.MM.yyyy"
    currentTimeString = formatter.string(from: Date())
  }
}

struct ShortcutItem: View {
  let iconName: String
  let text: String

  var body: some View {
    VStack(spacing: 8) {
      ZStack {
        Circle()
          .fill(Color.neutral500.opacity(0.15))
          .frame(width: 52, height: 52)

        Image(systemName: iconName)
          .resizable()
          .scaledToFit()
          .frame(width: 24, height: 24)
          .foregroundColor(Color(red: 0.2, green: 0.55, blue: 0.95))
      }

      Text(text)
        .font(.system(size: 11, weight: .medium))
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .lineLimit(2)
        .frame(width: 84)
    }
  }
}
