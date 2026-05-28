import SwiftUI
import DesignSystem

struct LoginView: View {
  @State private var password = ""
  @State private var isLoggedIn = false
  @State private var isSecured = true

  var body: some View {
    if isLoggedIn {
      MainTabView()
    } else {
      loginContent
    }
  }

  private var loginContent: some View {
    ZStack {
      // Dark gradient background matching real mObywatel
      LinearGradient(
        gradient: Gradient(colors: [
          Color(red: 0.08, green: 0.09, blue: 0.12),
          Color(red: 0.04, green: 0.05, blue: 0.07),
          Color.black
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
      )
      .ignoresSafeArea()

      // Concentric curved background lines
      LoginBackgroundWaves()
        .ignoresSafeArea()

      VStack(alignment: .leading, spacing: 0) {
        // Logo + app name
        HStack(spacing: 12) {
          // Eagle icon in red rounded square
          ZStack {
            RoundedRectangle(cornerRadius: 14)
              .fill(Color.red100)
              .frame(width: 48, height: 48)

            // Polish eagle silhouette using SF Symbol
            Image(systemName: "shield.fill")
              .resizable()
              .scaledToFit()
              .frame(width: 26, height: 26)
              .foregroundColor(.white)
              .overlay(
                Image(systemName: "bird.fill")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 18, height: 18)
                  .foregroundColor(.red100)
                  .offset(y: -1)
              )
          }

          Text("mObywatel")
            .font(.system(size: 22, weight: .bold))
            .foregroundColor(.white)
        }
        .padding(.bottom, 28)

        // Time-based greeting
        Text(greetingText)
          .font(.system(size: 32, weight: .bold))
          .foregroundColor(.white)
          .padding(.bottom, 6)

        Text("Zaloguj się do aplikacji.")
          .font(.system(size: 17))
          .foregroundColor(Color(red: 0.6, green: 0.63, blue: 0.68))
          .padding(.bottom, 28)

        // Password card — contains label, field, and forgot link
        VStack(alignment: .leading, spacing: 12) {
          Text("Hasło")
            .font(.system(size: 14))
            .foregroundColor(Color(red: 0.6, green: 0.63, blue: 0.68))

          HStack {
            Group {
              if isSecured {
                SecureField("", text: $password)
              } else {
                TextField("", text: $password)
              }
            }
            .foregroundColor(.white)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)

            Button {
              isSecured.toggle()
            } label: {
              Image(systemName: isSecured ? "eye" : "eye.slash")
                .foregroundColor(Color(red: 0.55, green: 0.58, blue: 0.63))
                .frame(width: 24, height: 24)
            }
          }
          .padding(.horizontal, 16)
          .frame(height: 52)
          .background(
            RoundedRectangle(cornerRadius: 10)
              .fill(Color.white.opacity(0.04))
          )
          .overlay(
            RoundedRectangle(cornerRadius: 10)
              .stroke(Color.white.opacity(0.18), lineWidth: 1)
          )

          // Forgot password link inside the card
          Button {
            // No-op
          } label: {
            Text("Nie pamiętasz hasła?")
              .font(.system(size: 15, weight: .medium))
              .foregroundColor(Color(red: 0.30, green: 0.60, blue: 0.98))
          }
          .padding(.top, 4)
        }
        .padding(20)
        .background(
          RoundedRectangle(cornerRadius: 16)
            .fill(Color.white.opacity(0.04))
        )

        Spacer()

        // Login button
        Button {
          withAnimation {
            isLoggedIn = true
          }
        } label: {
          Text("Zaloguj się")
            .font(.system(size: 17, weight: .semibold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 54)
            .background(
              Capsule()
                .fill(Color(red: 0.25, green: 0.56, blue: 0.96))
            )
        }
        .padding(.bottom, 20)

        // Footer
        HStack(alignment: .bottom) {
          HStack(spacing: 10) {
            // COI logo text
            Text("COI")
              .font(.system(size: 16, weight: .black))
              .foregroundColor(.white)

            // Divider line
            Rectangle()
              .fill(Color.white.opacity(0.3))
              .frame(width: 1, height: 22)

            VStack(alignment: .leading, spacing: 0) {
              Text("Ministerstwo")
                .font(.system(size: 9, weight: .medium))
                .foregroundColor(.white)
              Text("Cyfryzacji")
                .font(.system(size: 9, weight: .medium))
                .foregroundColor(.white)
              // Red underline accent
              Rectangle()
                .fill(Color.red100)
                .frame(width: 44, height: 1.5)
                .padding(.top, 1)
            }
          }

          Spacer()

          Text("wersja 4.63.0 (17)")
            .font(.system(size: 12))
            .foregroundColor(Color(red: 0.45, green: 0.48, blue: 0.52))
        }
        .padding(.bottom, 12)
      }
      .padding(.horizontal, 24)
      .padding(.top, 60)
    }
  }

  private var greetingText: String {
    let hour = Calendar.current.component(.hour, from: Date())
    switch hour {
    case 5..<12:
      return "Dzień dobry!"
    case 12..<18:
      return "Dzień dobry!"
    case 18..<22:
      return "Dobry wieczór!"
    default:
      return "Dobry wieczór!"
    }
  }
}

// MARK: - Background concentric waves

struct LoginBackgroundWaves: View {
  var body: some View {
    Canvas { context, size in
      let center = CGPoint(x: size.width * 0.85, y: -size.height * 0.15)
      let numberOfRings = 12
      let baseRadius: CGFloat = size.height * 0.25
      let ringSpacing: CGFloat = size.height * 0.12

      for i in 0..<numberOfRings {
        let radius = baseRadius + CGFloat(i) * ringSpacing
        let opacity = 0.04 + Double(i) * 0.008

        var path = Path()
        path.addArc(
          center: center,
          radius: radius,
          startAngle: .degrees(30),
          endAngle: .degrees(200),
          clockwise: false
        )

        context.stroke(
          path,
          with: .color(Color.white.opacity(opacity)),
          lineWidth: 0.8
        )
      }
    }
  }
}
