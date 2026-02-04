# Grand Reserve - Luxury Hotel Management App

**Grand Reserve** is a premium mobile application built with **Flutter**, designed to offer a high-end experience for hotel booking and management. It features a "Dark Luxury" aesthetic and a comprehensive set of features for both guests and administrators.

## 📱 Features

### Guest Experience

- **Authentication**: Secure Login and Signup flows.
- **Home & Explore**:
  - Featured packages carousel.
  - Hotel location details and amenities.
- **Booking Flow**:
  - **Available Rooms**: Filter and browse by room type.
  - **Room Details**: Image carousels, amenity grids, and package selection (Breakfast/All-Inclusive).
  - **Checkout**: Secure form for guest details and payment method selection.
  - **My Bookings**: Manage upcoming, past, and cancelled trips.
- **Profile**: User stats (Loyalty Points), settings, and Admin access.

### 🛡️ Admin Panel

- **Dashboard**: Real-time metrics (Revenue, Occupancy), Revenue Trend Chart, and Recent Activity logs.
- **Room Management**: View all rooms, filter by floor, and toggle availability status instantly.
- **Bookings Management**: Search guests, view booking details, and manage check-ins/check-outs.

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/) (Dart)
- **Typography**: [Google Fonts](https://pub.dev/packages/google_fonts) (Playfair Display, Lato)
- **Icons**: Material Design & Phosphor Icons
- **State Management**: `setState` (Clean & Simple)

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.10.0+)
- Dart SDK

### Installation

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/yourusername/grand-reserve.git
    cd grand_reserve
    ```

2.  **Install dependencies:**

    ```bash
    flutter pub get
    ```

3.  **Run the app:**
    ```bash
    flutter run
    ```

## 📂 Project Structure

```text
lib/
├── core/
│   └── theme/          # App Colors and Theme definitions
├── features/
│   ├── admin/          # Admin Panel screens & widgets
│   ├── auth/           # Login & Signup screens
│   ├── booking/        # Booking Request flow
│   ├── explore/        # Location info & Map placeholder
│   ├── home/           # Main landing screen
│   ├── profile/        # User profile & Settings
│   └── trips/          # My Bookings history
├── widgets/            # Reusable components (Buttons, Cards, Inputs)
└── main.dart           # Entry point
```

## 🎨 Design System

The app follows a strict **Dark Luxury** theme:

- **Backgrounds**: Deep Navy (`#0F1521`) for immersion.
- **Accents**: Gold (`#D4AF37`) for premium touches and Blue (`#1E88E5`) for primary actions.
- **Typography**: Serif headings for elegance, Sans-serif body for readability.
