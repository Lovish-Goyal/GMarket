import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gmarket/features/about_us/about_us_view.dart';
import 'package:gmarket/features/contact_us/contact_us_view.dart';
import 'package:gmarket/features/terms_and_conditions/terms_and_condition_view.dart';
import 'package:go_router/go_router.dart';
import 'bottom_bar.dart';
import 'modules/auth/auth_ui/loginview.dart';
import 'modules/auth/auth_ui/signupview.dart';
import 'modules/auth/provider.dart';
import 'modules/auth/user_model/user_model.dart';
import '../features/cart/cart_view.dart';
import 'modules/notifications/notifications.dart';
import '../features/profile/editprofile.dart';
import '../features/profile/profile.dart';
import 'modules/sale_product/View/sale_product.dart';
import '../widgets/searchview.dart';
import '../features/wishlist/wishlist.dart';

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<UserModel?>(
      userStateProvider,
      (previous, next) => notifyListeners(),
    );
  }
}

/// Provide RouterNotifier only once, and dispose it safely
final routerNotifierProvider = Provider<RouterNotifier>((ref) {
  final notifier = RouterNotifier(ref);
  ref.onDispose(() => notifier.dispose());
  return notifier;
});

/// Provide GoRouter, using the singleton notifier
final routerProvider = Provider<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider);

  return GoRouter(
    initialLocation: RouteKey.home,
    refreshListenable: notifier,
    debugLogDiagnostics: kDebugMode,
    redirect: (context, state) {
      final user = ref.read(userStateProvider);
      final loggedIn = user != null;
      final path = state.matchedLocation;

      // If not logged in
      if (!loggedIn && !(path == RouteKey.login || path == RouteKey.sign)) {
        return RouteKey.login;
      }

      // If logged in, prevent visiting login/signup again
      if (loggedIn && (path == RouteKey.login || path == RouteKey.sign)) {
        return RouteKey.home;
      }

      return null;
    },
    routes: [
      GoRoute(path: RouteKey.login, builder: (context, state) => LoginView()),
      GoRoute(
        path: RouteKey.sign,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: RouteKey.home,
        builder: (context, state) {
          final index = state.uri.queryParameters['index'] ?? "0";
          return BottomNavBar(index: index);
        },
      ),
      GoRoute(
        path: RouteKey.cart,
        builder: (context, state) => const CartView(),
      ),
      GoRoute(
        path: RouteKey.profile,
        builder: (context, state) => const Profile(),
      ),
      // GoRoute(
      //   path: RouteKey.editprofile,
      //   // builder: (context, state) => const EditPage(),
      //   builder: (context, state) {
      //     final user = state.extra as UserModel;
      //     return EditPage(user: user);
      //   },
      // ),
      GoRoute(
        path: RouteKey.notifications,
        builder: (context, state) => const Notifications(),
      ),
      GoRoute(
        path: RouteKey.wishlist,
        builder: (context, state) => const Wishlist(),
      ),
      GoRoute(path: RouteKey.sale, builder: (context, state) => const Sale()),
      GoRoute(
        path: RouteKey.search,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: RouteKey.about,
        builder: (context, state) => const AboutUsScreen(),
      ),
      GoRoute(
        path: RouteKey.contact,
        builder: (context, state) => const ContactUsScreen(),
      ),
      GoRoute(
        path: RouteKey.termsAndConditions,
        builder: (context, state) => const TermsConditionsScreen(),
      ),
    ],
    errorBuilder: (context, state) => const LoginView(), // fallback route
  );
});

/// Route constants
class RouteKey {
  static const String login = '/';
  static const String sign = '/signupPage';
  static const String home = '/bottombar';
  static const String cart = '/cart';
  static const String search = '/search';
  static const String profile = '/profile';
  static const String editprofile = '/editprofile';
  static const String notifications = '/notifications';
  static const String order = '/order';
  static const String wishlist = '/wishlist';
  static const String sale = '/sale';
  static const String about = '/about';
  static const String contact = '/contact';
  static const String termsAndConditions = '/termsAndConditions';
}
