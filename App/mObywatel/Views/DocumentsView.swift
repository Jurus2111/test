import SwiftUI
import DesignSystem

struct DocumentsView: View {
  @State private var showingmDowod = false

  var body: some View {
    NavigationView {
      ScrollView {
        VStack(alignment: .leading, spacing: 24) {
          // Greeting & Profile
          HStack {
            VStack(alignment: .leading, spacing: 4) {
              Text("mObywatel")
                .font(.title.weight(.bold))
                .foregroundColor(.white)
              Text("Twój cyfrowy portfel")
                .font(.subheadline)
                .foregroundColor(.neutral200)
            }
            Spacer()

            // Profile photo placeholder
            ZStack {
              Circle()
                .fill(Color.neutral500.opacity(0.2))
                .frame(width: 44, height: 44)
              Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.neutral200)
            }
          }
          .padding(.horizontal)
          .padding(.top, 10)

          // Wavy national card: mDowód
          Button {
            showingmDowod = true
          } label: {
            ZStack(alignment: .topLeading) {
              // Gorgeous custom gradient with white/red flag overlay
              RoundedRectangle(cornerRadius: 20)
                .fill(
                  LinearGradient(
                    gradient: Gradient(colors: [
                      Color(red: 0.1, green: 0.25, blue: 0.55),
                      Color(red: 0.05, green: 0.15, blue: 0.35)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                  )
                )
                .frame(height: 226)
                .shadow(radius: 8)

              // Wavy background element
              VStack {
                Spacer()
                Path { path in
                  path.move(to: CGPoint(x: 0, y: 100))
                  path.addCurve(to: CGPoint(x: 350, y: 60), control1: CGPoint(x: 120, y: 150), control2: CGPoint(x: 240, y: 20))
                  path.addLine(to: CGPoint(x: 350, y: 226))
                  path.addLine(to: CGPoint(x: 0, y: 226))
                  path.closeSubpath()
                }
                .fill(Color.red100.opacity(0.85))
                .frame(height: 120)
              }
              .clipShape(RoundedRectangle(cornerRadius: 20))

              // Card content
              VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .top) {
                  VStack(alignment: .leading, spacing: 4) {
                    Text("mDowód")
                      .font(.title2.weight(.bold))
                      .foregroundColor(.white)
                    Text("DOKUMENT TOŻSAMOŚCI")
                      .font(.caption2.weight(.semibold))
                      .foregroundColor(.white.opacity(0.8))
                  }
                  Spacer()
                  // Eagle emblem hologram
                  Image(systemName: "crown.fill")
                    .foregroundColor(.white.opacity(0.4))
                    .frame(width: 32, height: 32)
                }

                Spacer()

                HStack(alignment: .bottom) {
                  VStack(alignment: .leading, spacing: 4) {
                    Text("JAN KOWALSKI")
                      .font(.body.weight(.bold))
                      .foregroundColor(.white)
                    Text("Imię i nazwisko")
                      .font(.caption2)
                      .foregroundColor(.white.opacity(0.7))
                  }
                  Spacer()
                  // Waving flag
                  Image(systemName: "flag.fill")
                    .foregroundColor(.white)
                }
              }
              .padding(24)
            }
            .frame(height: 226)
          }
          .padding(.horizontal)
          .sheet(isPresented: $showingmDowod) {
            mDowodView()
          }

          // Second Card: Prawo Jazdy
          ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 20)
              .fill(
                LinearGradient(
                  gradient: Gradient(colors: [
                    Color(red: 0.15, green: 0.45, blue: 0.3),
                    Color(red: 0.05, green: 0.25, blue: 0.15)
                  ]),
                  startPoint: .topLeading,
                  endPoint: .bottomTrailing
                )
              )
              .frame(height: 130)
              .shadow(radius: 5)

            VStack(alignment: .leading) {
              HStack {
                VStack(alignment: .leading, spacing: 2) {
                  Text("Prawo jazdy")
                    .font(.headline.weight(.bold))
                    .foregroundColor(.white)
                  Text("KRAJOWE")
                    .font(.system(size: 9, weight: .semibold))
                    .foregroundColor(.white.opacity(0.8))
                }
                Spacer()
                Image(systemName: "car.fill")
                  .foregroundColor(.white.opacity(0.3))
              }
              Spacer()
              Text("JAN KOWALSKI")
                .font(.subheadline.weight(.semibold))
                .foregroundColor(.white)
            }
            .padding(18)
          }
          .frame(height: 130)
          .padding(.horizontal)

          // Add document card button
          Button {
            // No-op
          } label: {
            HStack {
              Image(systemName: "plus")
                .foregroundColor(.blue100)
                .font(.headline.weight(.bold))
              Text("Dodaj dokument")
                .foregroundColor(.blue100)
                .font(.headline.weight(.bold))
            }
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(Color.neutral500.opacity(0.1))
            .cornerRadius(12)
            .overlay(
              RoundedRectangle(cornerRadius: 12)
                .stroke(Color.blue100.opacity(0.3), lineWidth: 1)
            )
          }
          .padding(.horizontal)

          Spacer()
        }
        .padding(.vertical)
      }
      .background(Color.black.ignoresSafeArea())
      .navigationBarHidden(true)
    }
  }
}
