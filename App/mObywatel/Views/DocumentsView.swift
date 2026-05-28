import SwiftUI
import DesignSystem

struct DocumentsView: View {
  @State private var showingmDowod = false

  var body: some View {
    NavigationView {
      ZStack {
        // Deep black background
        Color.black.ignoresSafeArea()

        ScrollView {
          VStack(alignment: .leading, spacing: 20) {
            // Custom Top Navigation Bar
            HStack(alignment: .center) {
              // Red Polish Eagle Logo
              Image("AppLogo", bundle: bundle)
                .resizable()
                .scaledToFit()
                .frame(width: 38, height: 38)
                .clipShape(RoundedRectangle(cornerRadius: 10))

              Spacer()

              // Notification Bell Icon
              Button {
                // Bell action
              } label: {
                Image(systemName: "bell")
                  .font(.system(size: 22))
                  .foregroundColor(.white)
              }
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)

            // Title and action buttons row
            HStack(alignment: .bottom) {
              Text("Dokumenty")
                .font(.system(size: 34, weight: .bold))
                .foregroundColor(.white)

              Spacer()

              HStack(spacing: 20) {
                Button {
                  // Dostosuj action
                } label: {
                  Text("Dostosuj")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(Color(red: 0.25, green: 0.56, blue: 0.96))
                }

                Button {
                  // Dodaj action
                } label: {
                  Text("Dodaj")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(Color(red: 0.25, green: 0.56, blue: 0.96))
                }
              }
              .padding(.bottom, 4)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 10)

            // Minimal mDowód card matching first screenshot
            Button {
              showingmDowod = true
            } label: {
              ZStack(alignment: .topLeading) {
                // Card background gradient
                RoundedRectangle(cornerRadius: 24)
                  .fill(
                    LinearGradient(
                      gradient: Gradient(colors: [
                        Color(red: 0.06, green: 0.38, blue: 0.88),
                        Color(red: 0.02, green: 0.20, blue: 0.62)
                      ]),
                      startPoint: .topLeading,
                      endPoint: .bottomTrailing
                    )
                  )
                  .frame(height: 210)
                  .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 4)

                // Background watermark eagle hologram
                HStack {
                  Spacer()
                  Image("AppLogo", bundle: bundle)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .opacity(0.08)
                    .scaleEffect(1.3)
                    .offset(x: 20, y: 30)
                }
                .frame(height: 210)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 24))

                // Card contents
                VStack(alignment: .leading, spacing: 0) {
                  HStack(alignment: .top) {
                    Text("mDowód")
                      .font(.system(size: 24, weight: .bold))
                      .foregroundColor(.white)

                    Spacer()

                    // Top-right white eagle emblem hologram
                    ZStack {
                      RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white.opacity(0.15))
                        .frame(width: 32, height: 32)

                      Image("AppLogo", bundle: bundle)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .padding(6)
                    }
                  }
                  Spacer()
                }
                .padding(24)
                .frame(height: 210)
              }
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.horizontal, 16)

            Spacer()
          }
          .padding(.vertical)
        }
      }
      .navigationBarHidden(true)
      .sheet(isPresented: $showingmDowod) {
        mDowodView()
      }
    }
  }
}
