import SwiftUI
import DesignSystem

struct mDowodView: View {
  @Environment(\.presentationMode) var presentationMode
  @State private var currentTimeString = ""
  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

  var body: some View {
    ZStack {
      // Very dark navy-black background matching the screenshot
      Color(red: 0.05, green: 0.07, blue: 0.10)
        .ignoresSafeArea()

      VStack(spacing: 0) {
        // Navigation bar
        HStack {
          Button {
            presentationMode.wrappedValue.dismiss()
          } label: {
            HStack(spacing: 4) {
              Image(systemName: "chevron.left")
                .font(.system(size: 20, weight: .bold))
              Text("Wróć")
                .font(.system(size: 17))
            }
            .foregroundColor(Color(red: 0.25, green: 0.56, blue: 0.96))
          }

          Spacer()

          Text("mDowód")
            .font(.system(size: 17, weight: .semibold))
            .foregroundColor(.white)

          Spacer()

          Button {
            // Info action
          } label: {
            Image(systemName: "questionmark.circle")
              .font(.system(size: 20))
              .foregroundColor(Color(red: 0.6, green: 0.63, blue: 0.68))
          }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)

        ScrollView {
          VStack(spacing: 16) {
            // Live clock label matching screenshot: Czas: HH:mm:ss dd.MM.yyyy
            Text("Czas: \(currentTimeString)")
              .font(.system(size: 13, weight: .medium))
              .foregroundColor(Color(red: 0.6, green: 0.63, blue: 0.68))
              .padding(.top, 4)
              .onAppear { updateTime() }
              .onReceive(timer) { _ in updateTime() }

            // Document Details Panel (White/Light-Blue ID Card)
            ZStack {
              // Card base with light blue-white gradient and shadow
              RoundedRectangle(cornerRadius: 16)
                .fill(
                  LinearGradient(
                    gradient: Gradient(colors: [
                      Color.white,
                      Color(red: 0.94, green: 0.96, blue: 0.99)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                  )
                )
                .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 6)

              // Guilloche-like wave pattern overlay
              GuillochePattern()
                .opacity(0.12)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 16))

              // Card content
              HStack(alignment: .top, spacing: 16) {
                // Left Column: Photo + Flag + Eagle Emblem
                VStack(alignment: .leading, spacing: 12) {
                  // White Photo Placeholder
                  RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white)
                    .frame(width: 106, height: 138)
                    .overlay(
                      RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black.opacity(0.08), lineWidth: 1)
                    )

                  // Polish Flag
                  VStack(spacing: 0) {
                    Rectangle()
                      .fill(Color.white)
                      .frame(height: 12)
                    Rectangle()
                      .fill(Color(red: 0.85, green: 0.08, blue: 0.2))
                      .frame(height: 12)
                  }
                  .frame(width: 44, height: 24)
                  .cornerRadius(2)
                  .overlay(
                    RoundedRectangle(cornerRadius: 2)
                      .stroke(Color.black.opacity(0.08), lineWidth: 0.5)
                  )

                  // Eagle + Rzeczpospolita Polska
                  HStack(spacing: 4) {
                    Image("AppLogo", bundle: bundle)
                      .renderingMode(.template)
                      .resizable()
                      .scaledToFit()
                      .frame(width: 22, height: 22)
                      .foregroundColor(Color.black.opacity(0.4))

                    VStack(alignment: .leading, spacing: 0) {
                      Text("Rzeczpospolita")
                        .font(.system(size: 7, weight: .bold))
                      Text("Polska")
                        .font(.system(size: 7, weight: .bold))
                    }
                    .foregroundColor(Color.black.opacity(0.5))
                  }
                }

                // Right Column: Vertical stack of fields
                VStack(alignment: .leading, spacing: 6) {
                  DocumentField(value: "JAN", label: "Imię (imiona)")
                  DocumentField(value: "KOWALSKI", label: "Nazwisko")
                  DocumentField(value: "POLSKIE", label: "Obywatelstwo")
                  DocumentField(value: "15.05.2007", label: "Data urodzenia")
                  DocumentField(value: "98051508432", label: "Numer PESEL")
                }
              }
              .padding(16)
            }
            .padding(.horizontal, 16)

            // Green status row
            HStack(spacing: 12) {
              ZStack {
                Circle()
                  .stroke(Color(red: 0.18, green: 0.70, blue: 0.35), lineWidth: 2)
                  .frame(width: 22, height: 22)

                Image(systemName: "checkmark")
                  .font(.system(size: 10, weight: .bold))
                  .foregroundColor(Color(red: 0.18, green: 0.70, blue: 0.35))
              }

              Text("Dokument ważny")
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(Color(red: 0.18, green: 0.70, blue: 0.35))

              Spacer()
            }
            .padding(.horizontal, 16)
            .frame(height: 52)
            .background(
              RoundedRectangle(cornerRadius: 12)
                .fill(Color(red: 0.08, green: 0.14, blue: 0.10))
            )
            .padding(.horizontal, 16)

            // Shortcuts Grid Row
            HStack(alignment: .top, spacing: 0) {
              ShortcutItem(iconName: "qrcode.viewfinder", text: "Potwierdź\nswoje dane")
              Spacer()
              ShortcutItem(iconName: "person.text.rectangle", text: "Dane\ndowodu")
              Spacer()
              ShortcutItem(iconName: "lock.shield", text: "Zastrzeż\nPESEL")
              Spacer()
              ShortcutItem(iconName: "ellipsis", text: "Pozostałe\nskróty")
            }
            .padding(.horizontal, 24)
            .padding(.top, 14)

            // Lower Section Header Placeholder
            VStack(alignment: .leading, spacing: 0) {
              Text("Seria i numer mDowodu")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(Color(red: 0.6, green: 0.63, blue: 0.68))
                .padding(.horizontal, 24)
                .padding(.top, 20)
            }

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

// Custom view helper for Document fields
struct DocumentField: View {
  let value: String
  let label: String

  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      Text(value)
        .font(.system(size: 15, weight: .bold))
        .foregroundColor(.black)
      Text(label)
        .font(.system(size: 10))
        .foregroundColor(Color.black.opacity(0.4))
    }
    .padding(.bottom, 2)
  }
}

// Custom Guilloche/wave pattern design
struct GuillochePattern: View {
  var body: some View {
    Canvas { context, size in
      let center = CGPoint(x: size.width * 0.7, y: size.height * 0.7)
      let numberOfRings = 20
      let baseRadius: CGFloat = size.width * 0.1
      let spacing: CGFloat = 12

      for i in 0..<numberOfRings {
        let radius = baseRadius + CGFloat(i) * spacing
        var path = Path()
        path.addArc(
          center: center,
          radius: radius,
          startAngle: .degrees(0),
          endAngle: .degrees(360),
          clockwise: false
        )

        // Draw overlapping waves using dash patterns and opacity
        context.stroke(
          path,
          with: .color(Color(red: 0.15, green: 0.45, blue: 0.85).opacity(0.12)),
          lineWidth: 0.6
        )
      }
    }
  }
}

struct ShortcutItem: View {
  let iconName: String
  let text: String

  var body: some View {
    VStack(spacing: 8) {
      ZStack {
        Circle()
          .fill(Color.white.opacity(0.06))
          .frame(width: 56, height: 56)
          .overlay(
            Circle()
              .stroke(Color.white.opacity(0.1), lineWidth: 1)
          )

        Image(systemName: iconName)
          .font(.system(size: 24))
          .foregroundColor(Color(red: 0.35, green: 0.65, blue: 0.98))
      }

      Text(text)
        .font(.system(size: 11, weight: .medium))
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .lineLimit(2)
        .frame(width: 80)
    }
  }
}
