# invoice_manager

Flutter app for freelancers and small businesses to create invoices and estimates, manage clients and products, and share PDFs. It talks to the [Invoice_NodeJs-](https://github.com/nishank23/Invoice_NodeJs-) backend.

<p>
  <img width="200" alt="Splash" src="https://github.com/user-attachments/assets/907ca8d8-c7fa-4a33-8873-bb4bd5b599df" />
  <img width="200" alt="Log in" src="https://github.com/user-attachments/assets/9203a60e-421b-40cc-a510-df9574c75c4d" />
  <img width="200" alt="Home" src="https://github.com/user-attachments/assets/58000b4c-afd0-434e-a02f-022e5f36faa9" />
  <img width="200" alt="Navigation drawer" src="https://github.com/user-attachments/assets/36abfaa4-a0e3-420e-9d81-2812e030c2c9" />
</p>

## What it does

- **Sign in** with email, Google or Facebook. Email sign-up includes verification and password reset.
- **Invoices and estimates.** Step-by-step creation: client, address, items, signature. Preview and view the PDF in the app.
- **Clients and products** with business, address and bank details, and images.
- **Dashboard** with charts of invoice totals.
- **Backup and restore** of your data.

## Stack

Flutter, GetX for state and routing, Dio and http for the API, Firebase Auth and Cloud Messaging, Syncfusion PDF viewer and charts.

## Run it

```bash
flutter pub get
flutter run
```

Set the backend address in `lib/app/global/constants/api_const.dart` (`baseURL`). Firebase sign-in needs your own `google-services.json`.

Every push to `main` builds a release APK with GitHub Actions and attaches it to a GitHub release.

## Project structure

```text
lib/app/modules/   one folder per screen, each with binding, controller and view (GetX)
lib/app/global/    constants, theme, shared widgets
lib/Models/        API response models
```
