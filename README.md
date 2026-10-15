# 🌤️ Flutter Weather App

A fast, responsive, and elegant Weather Application built using Flutter. This app integrates with a real-time Weather API to provide accurate, up-to-date weather forecasts, complete with dynamic UI elements that change based on current weather conditions.

## 📸 App Preview

| Discover Weather | Search City | Weather Details |
| :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/4b6ced00-514f-44cb-9329-6ec3e61e742c" width="230" /> | <img src="https://github.com/user-attachments/assets/b2110968-bd41-4140-a4e4-53a7432be569" width="230" /> | <img src="https://github.com/user-attachments/assets/edc16458-0131-49fe-aa60-951d2f56b509" width="230" /> |

## ✨ Key Features
- **Real-Time Data:** Fetches live weather conditions (temperature, humidity, condition) using a RESTful API.
- **Dynamic Assets:** The UI and icons dynamically change to reflect the current weather state (e.g., Rain, Snow, Clear, Thunderstorm).
- **City Search:** Users can easily search for weather conditions in specific cities globally.
- **State Management:** Handles API loading, success, and error states seamlessly using the `Cubit` pattern.

## 🛠️ Tech Stack & Architecture
- **Framework:** Flutter / Dart
- **Network:** `Dio` (for high-performance API requests)
- **State Management:** `Bloc / Cubit`
- **Architecture:** Clean separation of concerns (Models, Views, Services, Cubits)

## 📂 Project Structure
The codebase follows a structured layered pattern:
```text
lib/
 ┣ cubit/          # State management (GetWeatherCubit, WeatherState)
 ┣ model/          # Data parsing (WeatherModel)
 ┣ views/          # Main UI screens (HomeView, SearchView)
 ┣ services/       # Network calls (WeatherService)
 ┗ widgets/        # Reusable components (WeatherInfo, NothingWidget)
```
