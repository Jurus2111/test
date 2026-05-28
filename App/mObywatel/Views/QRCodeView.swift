import SwiftUI
import DesignSystem

struct QRCodeView: View {
  var body: some View {
    NavigationView {
      VStack(spacing: 32) {
        VStack(spacing: 8) {
          Text("Kod QR")
            .font(.largeTitle.weight(.bold))
            .foregroundColor(.white)
          Text("Potwierdź swoją tożsamość")
            .font(.subheadline)
            .foregroundColor(.neutral200)
        }
        .padding(.top, 40)

        Spacer()

        // QR Code Box Placeholder
        ZStack {
          RoundedRectangle(cornerRadius: 24)
            .fill(Color.white)
            .frame(width: 260, height: 260)
            .shadow(radius: 10)

          // QR styling
          VStack(spacing: 12) {
            Image(systemName: "qrcode")
              .resizable()
              .scaledToFit()
              .frame(width: 180, height: 180)
              .foregroundColor(.black)

            Text("SKANUJ KOD")
              .font(.caption.weight(.bold))
              .foregroundColor(.neutral300)
              .tracking(2)
          }
        }

        Text("Skieruj aparat na kod QR, aby zalogować się do systemów rządowych lub udostępnić dane.")
          .font(.subheadline)
          .foregroundColor(.neutral200)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 40)

        Spacer()

        // Action button
        Button {
          // Scanner action
        } label: {
          HStack {
            Image(systemName: "camera.fill")
            Text("Otwórz skaner")
          }
          .font(.headline)
          .foregroundColor(.white)
          .frame(maxWidth: .infinity)
          .frame(height: 56)
          .background(Color.blue100)
          .cornerRadius(12)
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 24)
      }
      .background(Color.black.ignoresSafeArea())
      .navigationBarHidden(true)
    }
  }
}
