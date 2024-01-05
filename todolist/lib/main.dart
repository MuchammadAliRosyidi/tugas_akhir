import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyCTmkPoE8JO7bTLYecdC1lYPXJ5BhbkE7c",
        appId: "1:135544211699:web:d0ce7d981ca45d940c4f86",
        messagingSenderId: "135544211699",
        projectId: "tugas-akhir-8dd50",
      ),
    );
  }

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Authentication',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthenticationScreen(),
    );
  }
}

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication Demo'),
      ),
      body: isLoggedIn ? _buildLogoutForm() : _buildLoginForm(),
    );
  }

  Widget _buildLoginForm() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Implement login logic here
              // Check credentials and set isLoggedIn to true if login successful
              setState(() {
                isLoggedIn = true;
              });
            },
            child: Text('Login'),
          ),
          SizedBox(height: 16.0),
          TextButton(
            onPressed: () {
              // Navigate to the registration screen
              _navigateToRegister();
            },
            child: Text('Don\'t have an account? Register here'),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutForm() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome, user!'),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Implement logout logic here
              setState(() {
                isLoggedIn = false;
              });
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }

  void _navigateToRegister() {
    // Implement navigation to the registration screen
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => RegisterScreen(),
    ));
  }
}

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Registration form can be implemented similar to the login form
            // Add necessary TextFields, buttons, and logic
            Text('Registration Screen'),
          ],
        ),
      ),
    );
  }
}
