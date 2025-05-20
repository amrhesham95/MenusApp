# 📋 MenusApp

**MenusApp** is a Swift iOS application that fetches a list of universities from a remote API and lets users search through them. It is built with a **Clean Architecture** / **MVVM** approach.

---

## ✨ Features

- 🌐 Fetches universities list from a REST API  
- 🔍 Real-time search through the list  
- 📋 Displays university name, country, and website  
- 🧱 Clean Architecture with MVVM  
- 🛠️ Built with UIKit, Combine, and Swift  

---

## 🛠 Tech Stack

- **Swift 5.7+**  
- **UIKit** / Storyboards  
- **Combine** – Reactive asynchronous data flow  
- **MVVM** – ViewModels drive the UI  
- **URLSession** – Networking layer  
- **Codable** – JSON parsing  

---

## 🏗 Project Structure

```plaintext
MenusApp/
├── MenusApp.xcodeproj         # Xcode project
└── MenusApp/                  # App source folder
    ├── AppDelegate.swift      # App lifecycle setup
    ├── SceneDelegate.swift    # Scene/session management
    │
    ├── Models/                # Codable data models
    │   └── University.swift   # University data structure
    │
    ├── Services/              # Networking & data repositories
    │   ├── APIClient.swift    # Generic URLSession wrapper
    │   └── UniversityService.swift  # Fetch/search logic
    │
    ├── ViewModels/            # ObservableObjects for each screen
    │   ├── UniversityListViewModel.swift
    │   └── UniversityCellViewModel.swift
    │
    ├── Views/                 # UIKit or SwiftUI views
    │   ├── UniversityListViewController.swift
    │   └── UniversityCell.swift
    │
    └── Resources/             # Assets, Info.plist, etc.
        └── Assets.xcassets
