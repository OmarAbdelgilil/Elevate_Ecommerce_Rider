import 'package:elevate_ecommerce_driver/features/auth/logout/presentation/logout_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: LogoutWidget()),
    );
  }
}
