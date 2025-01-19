# Ekart App 🚚📦

**Ekart** is an intuitive shopping and delivery app designed to offer seamless experiences for users to browse products, add them to the cart, save addresses for delivery, and securely pay both online and offline. The app uses Firebase for secure login and signup.

## Features 🌟

- **Secure Authentication** 🔒: Firebase is used for user authentication, allowing secure login and signup.
- **Product Search** 🔍: Users can search through a variety of products effortlessly.
- **Cart Management** 🛒: Add and manage items in the shopping cart with ease.
- **Address Management** 🏠: Save multiple delivery addresses for quick access at checkout.
- **Online and Offline Payments** 💳💸: Pay securely using online methods (credit/debit card, etc.) or offline (cash on delivery).
- **Real-Time Updates** 📲: Get live notifications and tracking information for your orders.

## Technologies Used 💻

- **Firebase Authentication** 🔐: Secure login and signup for the users.
- **Flutter** 📱: Cross-platform development for both iOS and Android.
- **Firebase Firestore** 🧯: Storing user data, orders, and addresses.
- **Stripe** (or another payment gateway) 💳: Secure and reliable payment methods.

## Screenshots 📸

Here are some screenshots of the app:

![SignUp](Signup_screen.png)
![Home_Screen](Home_Screen.png)
![LoginScreen](Login_screen.png)
![DemoPrompt](Demo_Prompt.png)
![Toolbar](Tool_bar.png)

## Installation ⚙️

1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/ekart-app.git
    ```

2. Install dependencies:
    ```bash
    flutter pub get
    ```

3. Setup Firebase in your project:
   - Go to [Firebase Console](https://console.firebase.google.com/), create a project, and add Firebase to your Flutter project.
   - Enable **Firebase Authentication** and set up the sign-up/sign-in flow.

4. Configure Payment Gateway (Stripe/other):
   - Set up your payment gateway credentials for online payments.

5. Run the app:
    ```bash
    flutter run
    ```

## Contributing 🤝

We welcome contributions to **Ekart**! If you'd like to add features, improve performance, or fix bugs, feel free to fork the project and make a pull request.

## License 📝

This project is open-source and available under the MIT License.
