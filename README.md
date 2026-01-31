# 📱 Invoice Manager – Flutter App

A Flutter-based mobile application for managing clients and invoices.  
Designed for freelancers and small businesses, with a clean UI and backend integration.

This app consumes a Node.js backend API for authentication, client management, and invoice operations.

---

## 🚀 Features

- User authentication
- Client management
- Invoice creation & listing
- Invoice status tracking (Paid / Unpaid)
- Dashboard overview
- REST API integration
- Responsive & clean UI

---

## 🛠 Tech Stack

- **Flutter**
- **Dart**
- **GetX** (state management & navigation)
- REST API
- Material UI

---

## 📂 Project Structure
invoice_manager/                                     
|──lib/        
        ├──controllers/                                         
        │   └── # Getx Controllers                                                    
        ├── models/                                     
        │   └── # Data models           
        ├── services/                                         
        │   └── # Api services                         
        ├── screens/                                         
        │   └── # UI screens                                
        ├── widgets/                                          
        │   └── # Reusable widgets                        
        ├── routes/                                          
        │   └── # App Routes                     
        ├── main.dart/                                           
        │                          
        ├── assets/                
        ├── pubspec.yaml                               
                                  

## ▶️ Getting Started

### Prerequisites
- Flutter SDK
- Android Studio / VS Code
- Backend server running

### Installation
```bash
git clone https://github.com/nishank23/invoice_manager.git                                                                                                        
cd invoice_manager                                                                                                                                                
flutter pub get                                                                                                                                                        
flutter run                                                                                                                                                                
```

### Backened Configuration

###Update the API base URL in your service file:
```bash
const String baseUrl = "http://your-backend-url";
```

📸 Screenshots

<img width="430" height="932" alt="Splash" src="https://github.com/user-attachments/assets/907ca8d8-c7fa-4a33-8873-bb4bd5b599df" />
<img width="430" height="932" alt="Log In" src="https://github.com/user-attachments/assets/9203a60e-421b-40cc-a510-df9574c75c4d" />
<img width="430" height="1327" alt="Home" src="https://github.com/user-attachments/assets/58000b4c-afd0-434e-a02f-022e5f36faa9" />
<img width="430" height="932" alt="Navigation Drawer" src="https://github.com/user-attachments/assets/36abfaa4-a0e3-420e-9d81-2812e030c2c9" />
<img width="430" height="932" alt="Restore Complete" src="https://github.com/user-attachments/assets/b51a171e-259b-42b5-a76b-0c98eb766a1a" />
<img width="430" height="932" alt="Restore" src="https://github.com/user-attachments/assets/ed09be13-b4f0-4fb0-9e77-0ab77612ed5a" />



