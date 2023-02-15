import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/auth.provider.dart';
import 'package:todoapp/screens/login.screen.dart';
import 'package:todoapp/screens/register.screen.dart';
import 'screens/root.screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginPage(),
        'home': (context) => const RootPage(),
        'register': (context) => const RegisterPage()
      },
    ),
  ));
  // runApp(const MyApp());
}

// void main() {
//   runApp(MultiProvider(
//     providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
//     child: MyApp(),
//   ));
//   // runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const RootPage(),
    );
  }
}
