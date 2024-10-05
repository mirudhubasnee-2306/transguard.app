import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transport Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFFFF9C4), // Light yellow background
      ),
      home: const LoginFlow(),
    );
  }
}

class LoginFlow extends StatefulWidget {
  const LoginFlow({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginFlowState createState() => _LoginFlowState();
}

class _LoginFlowState extends State<LoginFlow> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void nextPage() {
    if (_currentPage < 9) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Disable swiping
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: [
          AuthenticationScreen(onNext: nextPage),
          LoginScreen(onNext: nextPage),
          TransportLoginScreen(onNext: nextPage),
          VehicleNameScreen(onNext: nextPage),
          TransportLoginScreen2(onNext: nextPage),
          TransportDetailsScreen(onNext: nextPage),
          TransportDetailsScreen2(onNext: nextPage),
          RenewalScreen(onNext: nextPage),
          const SuccessScreen(),
        ],
      ),
    );
  }
}

class CustomInputField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const CustomInputField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class AuthenticationScreen extends StatelessWidget {
  final VoidCallback onNext;
  final TextEditingController _pinController = TextEditingController();

  AuthenticationScreen({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('AUTHENTICATION', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            CustomInputField(
              hintText: 'ENTER YOUR PIN',
              controller: _pinController,
              obscureText: true,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'AUTHENTICATE',
              onPressed: onNext,
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final VoidCallback onNext;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('LOGIN', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            CustomInputField(
              hintText: 'USERNAME',
              controller: _usernameController,
            ),
            const SizedBox(height: 10),
            CustomInputField(
              hintText: 'PASSWORD',
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'LOG IN',
              onPressed: onNext,
            ),
            const SizedBox(height: 10),
            TextButton(
              child: const Text('Forgot password?'),
              onPressed: () {
                // Implement forgot password logic
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TransportLoginScreen extends StatelessWidget {
  final VoidCallback onNext;
  final TextEditingController _vehicleController = TextEditingController();

  TransportLoginScreen({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('TRANSPORT LOGIN', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            CustomInputField(
              hintText: 'ENTER YOUR VEHICLE',
              controller: _vehicleController,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'SAVE',
              onPressed: onNext,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: '+ ADD',
              onPressed: () {
                // Implement add logic
              },
            ),
          ],
        ),
      ),
    );
  }
}

class VehicleNameScreen extends StatelessWidget {
  final VoidCallback onNext;
  final TextEditingController _nameController = TextEditingController();

  VehicleNameScreen({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('NAME OF YOUR VEHICLE', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            const SizedBox(height: 20),
            CustomInputField(
              hintText: 'VOLKSWAGEN',
              controller: _nameController,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'SAVE',
              onPressed: onNext,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: '+ ADD',
              onPressed: () {
                // Implement add logic
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TransportLoginScreen2 extends StatelessWidget {
  final VoidCallback onNext;

  const TransportLoginScreen2({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('TRANSPORT LOGIN', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('1. XXX', style: TextStyle(fontSize: 18)),
                const SizedBox(width: 10),
                Switch(
                  value: true,
                  onChanged: (bool value) {
                    // Implement switch logic
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: '+ ADD',
              onPressed: onNext,
            ),
          ],
        ),
      ),
    );
  }
}

class TransportDetailsScreen extends StatelessWidget {
  final VoidCallback onNext;

  const TransportDetailsScreen({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('XXX DETAILS', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            // Add more details here as needed
            const Text('Detail 1: Value', style: TextStyle(fontSize: 18)),
            const Text('Detail 2: Value', style: TextStyle(fontSize: 18)),
            const Text('Detail 3: Value', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            CustomButton(
              text: 'OK',
              onPressed: onNext,
            ),
          ],
        ),
      ),
    );
  }
}

class TransportDetailsScreen2 extends StatelessWidget {
  final VoidCallback onNext;

  const TransportDetailsScreen2({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('XXX DETAILS', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            // Add more details here as needed
            const Text('Additional Detail 1: Value', style: TextStyle(fontSize: 18)),
            const Text('Additional Detail 2: Value', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            CustomButton(
              text: 'OK',
              onPressed: onNext,
            ),
          ],
        ),
      ),
    );
  }
}

class RenewalScreen extends StatelessWidget {
  final VoidCallback onNext;

  const RenewalScreen({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('RENEWAL UPDATE', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            CustomButton(
              text: 'RENEW LICENSE',
              onPressed: () {
                // Implement renew license logic
              },
            ),
            const SizedBox(height: 10),
            CustomButton(
              text: 'RE BOOK',
              onPressed: () {
                // Implement re-book logic
              },
            ),
            const SizedBox(height: 10),
            CustomButton(
              text: 'UPDATE',
              onPressed: onNext,
            ),
          ],
        ),
      ),
    );
  }
}

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 100),
            SizedBox(height: 20),
            Text('YOUR PROGRESS HAS BEEN UPDATED!', 
                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                 textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}