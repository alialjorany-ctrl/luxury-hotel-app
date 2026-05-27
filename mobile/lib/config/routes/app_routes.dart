import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

// Routes will be defined here
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // Splash Screen
    GoRoute(
      path: '/',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Splash Screen')),
      ),
    ),
    // Home
    GoRoute(
      path: '/home',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Home')),
      ),
    ),
    // Hotel Details
    GoRoute(
      path: '/hotel/:id',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Hotel Details')),
      ),
    ),
    // Booking
    GoRoute(
      path: '/booking/:id',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Booking')),
      ),
    ),
    // Payment
    GoRoute(
      path: '/payment/:bookingId',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Payment')),
      ),
    ),
  ],
);
