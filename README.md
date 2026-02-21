# Tourista 🌍

A beautifully crafted Flutter travel booking app built as a test assignment. Tourista lets users explore top destinations, browse travel packages, manage trip schedules, and view detailed destination info — all with a clean, modern UI.

---

## 📲 Download APK

**[Download v1.0.0](https://github.com/arun10021/Test-Assignment/releases/tag/v1.0.0)**

---

## ✨ Features

- **Home Screen** — Discover top destinations with large cards, stacked avatar reviews, and popular packages on scroll
- **Best Destinations** — Horizontally scrollable destination cards with bookmark, rating, location and reviewer avatars
- **Popular Packages** — Browse curated travel packages with pricing, dates and group info
- **Destination Details** — Full-screen hero image with tappable gallery thumbnails, expandable description, and Book Now CTA
- **Schedule** — Weekly calendar view with tappable dates, orange pill active state, schedule cards per day, and empty state
- **Favorites** — Bookmark destinations across the app with persistent state
- **Splash Screen** — Native orange splash + animated Flutter splash with "Tourista" branding

---

## 🖥️ Screens

| Screen | Description |
|---|---|
| Splash | Orange branded screen with fade-in animation |
| Home | Notification bell, user pill, headline, Best Destination + Popular Packages |
| Details | Full-screen image, tappable gallery, expandable about section |
| Schedule | Interactive weekly calendar, date-filtered schedule list |
| Popular Places | Grid view with search and filter |
| Popular Packages | Full list of travel packages |

---



**State management:** Provider (zero `setState` in business logic)

---

## 🎨 Design System

| Token | Value |
|---|---|
| Primary | `#FF6421` (orange) |
| Text Dark | `#1B1E28` |
| Text Gray | `#7D848D` |
| Background | `#FFFFFF` |
| Card Background | `#F7F7F9` |
| Star Color | `#FFA827` |

---

## 📦 Dependencies

| Package | Purpose |
|---|---|
| `provider` | State management |
| `cached_network_image` | Efficient image loading |
| `flutter_rating_bar` | Star rating widget |
| `flutter_native_splash` | Native splash screen |
| `flutter_launcher_icons` | App icon generation |

---

## 🚀 Getting Started

```bash
# Clone the repo
git clone https://github.com/arun10021/Test-Assignment.git
cd Test-Assignment

# Install dependencies
flutter pub get

# Run the app
flutter run
```

**Requirements:** Flutter 3.x · Dart 3.10.7+ · Android / iOS

---

## 📁 Assets

Place your app icon at:
```
assets/images/img.png
```

Then regenerate icons and splash:
```bash
dart run flutter_launcher_icons
dart run flutter_native_splash:create
```
