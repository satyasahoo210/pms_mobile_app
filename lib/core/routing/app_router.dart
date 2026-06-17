import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pms_admin/core/theme/app_theme.dart';
import 'package:pms_admin/features/auth/domain/auth_models.dart';
import 'package:pms_admin/features/auth/presentation/auth_controller.dart';
import 'package:pms_admin/features/auth/presentation/login_screen.dart';
import 'package:pms_admin/features/dashboard/presentation/dashboard_screen.dart';
import 'package:pms_admin/features/housekeeping/presentation/housekeeping_screen.dart';

// Helper class to convert a Riverpod stream/provider into a Listenable for GoRouter
class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

final appRouterNotifierProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: '/dashboard',
    refreshListenable: GoRouterRefreshStream(
      ref.watch(authControllerProvider.notifier).stream,
    ),
    redirect: (context, state) {
      final status = authState.status;
      final loggingIn = state.matchedLocation == '/login';

      if (status == AuthStatus.initial || status == AuthStatus.authenticating) {
        return null; // Don't redirect while checking auth
      }

      final isLoggedIn = status == AuthStatus.authenticated;

      if (!isLoggedIn) {
        return loggingIn ? null : '/login';
      }

      if (loggingIn) {
        return '/dashboard';
      }

      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      ShellRoute(
        builder: (context, state, child) {
          return MainNavigationShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/dashboard',
            builder: (context, state) => const DashboardScreen(),
          ),
          GoRoute(
            path: '/bookings',
            builder: (context, state) =>
                const PlaceholderScreen(title: 'Bookings & Calendar'),
          ),
          GoRoute(
            path: '/housekeeping',
            builder: (context, state) => const HousekeepingScreen(),
          ),
          GoRoute(
            path: '/more',
            builder: (context, state) =>
                const PlaceholderScreen(title: 'More & Settings'),
          ),
        ],
      ),
    ],
  );
});

class MainNavigationShell extends ConsumerWidget {
  final Widget child;

  const MainNavigationShell({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final ext = theme.extension<AppColorsExtension>()!;
    final location = GoRouterState.of(context).matchedLocation;

    int calculateSelectedIndex(String location) {
      if (location.startsWith('/dashboard')) return 0;
      if (location.startsWith('/bookings')) return 1;
      if (location.startsWith('/housekeeping')) return 2;
      if (location.startsWith('/more')) return 3;
      return 0;
    }

    void onItemTapped(int index, BuildContext context) {
      switch (index) {
        case 0:
          context.go('/dashboard');
          break;
        case 1:
          context.go('/bookings');
          break;
        case 2:
          context.go('/housekeeping');
          break;
        case 3:
          context.go('/more');
          break;
      }
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: ext.borderLight, width: 1)),
        ),
        child: NavigationBar(
          selectedIndex: calculateSelectedIndex(location),
          onDestinationSelected: (index) => onItemTapped(index, context),
          backgroundColor: theme.colorScheme.surface,
          indicatorColor: theme.colorScheme.primaryContainer.withValues(
            alpha: 0.25,
          ),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.dashboard_outlined),
              selectedIcon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month_outlined),
              selectedIcon: Icon(Icons.calendar_month),
              label: 'Calendar',
            ),
            NavigationDestination(
              icon: Icon(Icons.cleaning_services_outlined),
              selectedIcon: Icon(Icons.cleaning_services),
              label: 'Housekeeping',
            ),
            NavigationDestination(
              icon: Icon(Icons.more_horiz_outlined),
              selectedIcon: Icon(Icons.more_horiz),
              label: 'More',
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: theme.textTheme.titleMedium),
        centerTitle: false,
      ),
      body: Center(
        child: Text(
          '$title Screen\n(Coming soon in Phase 2/3)',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.extension<AppColorsExtension>()?.textMuted,
          ),
        ),
      ),
    );
  }
}
