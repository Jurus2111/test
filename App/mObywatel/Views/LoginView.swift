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
      // Dark background
      Color.black.ignoresSafeArea()

      VStack(alignment: .leading, spacing: 0) {
        // Logo + app name
        HStack(spacing: 12) {
          // Eagle icon in red rounded square
          ZStack {
            RoundedRectangle(cornerRadius: 12)
              .fill(Color.red100)
              .frame(width: 48, height: 48)

            Image(systemName: "bird.fill")
              .resizable()
              .scaledToFit()
              .frame(width: 28, height: 28)
              .foregroundColor(.white)
          }

          Text("mObywatel")
            .font(.title2.weight(.bold))
            .foregroundColor(.white)
        }
        .padding(.bottom, 32)

        // Time-based greeting
        Text(greetingText)
          .font(.largeTitle.weight(.bold))
          .foregroundColor(.white)
          .padding(.bottom, 4)

        Text("Zaloguj się do aplikacji.")
          .font(.body)
          .foregroundColor(.neutral200)
          .padding(.bottom, 32)

        // Password card
        VStack(alignment: .leading, spacing: 8) {
          Text("Hasło")
            .font(.footnote)
            .foregroundColor(.neutral200)

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
                .foregroundColor(.neutral200)
                .frame(width: 24, height: 24)
            }
          }
          .padding(16)
          .frame(height: 56)
          .background(
            RoundedRectangle(cornerRadius: 12)
              .fill(Color.neutral500.opacity(0.15))
          )
          .overlay(
            RoundedRectangle(cornerRadius: 12)
              .stroke(Color.neutral200.opacity(0.3), lineWidth: 1)
          )
        }
        .padding(20)
        .background(
          RoundedRectangle(cornerRadius: 16)
            .fill(Color.neutral500.opacity(0.1))
        )

        // Forgot password link
        Button {
          // No-op
        } label: {
          Text("Nie pamiętasz hasła?")
            .font(.subheadline.weight(.medium))
            .foregroundColor(.blue100)
        }
        .padding(.top, 12)
        .padding(.leading, 20)

        Spacer()

        // Login button
        Button {
          withAnimation {
            isLoggedIn = true
          }
        } label: {
          Text("Zaloguj się")
            .font(.headline.weight(.semibold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(
              RoundedRectangle(cornerRadius: .radius300)
                .fill(Color(red: 0.2, green: 0.55, blue: 0.95))
            )
        }
        .padding(.bottom, 16)

        // Footer
        HStack {
          HStack(spacing: 8) {
            Text("COI")
              .font(.caption.weight(.bold))
              .foregroundColor(.white)

            VStack(alignment: .leading, spacing: 0) {
              Text("Ministerstwo")
                .font(.system(size: 8, weight: .medium))
              Text("Cyfryzacji")
                .font(.system(size: 8, weight: .medium))
            }
            .foregroundColor(.white)
          }

          Spacer()

          Text("wersja 4.63.0 (17)")
            .font(.caption2)
            .foregroundColor(.neutral200)
        }
        .padding(.bottom, 8)
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
