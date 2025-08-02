import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouteKey.home,
    refreshListenable: RouterNotifier(ref),
    debugLogDiagnostics: kDebugMode,
    redirect: (context, state) {
      final user = ref.read(userStateProvider);
      final loggedIn = user != null;
      final path = state.matchedLocation;

      // Agar user logged out hai
      if (!loggedIn) {
        // Login or signup pages allowed
        if (path == RouteKey.login || path == RouteKey.sign) {
          return null; // allow access
        }
        // Baaki sab jagah se login page pe redirect
        return RouteKey.login;
      }

      // Agar user logged in hai
      if (path == RouteKey.login || path == RouteKey.sign) {
        // Login/signup page pe na jaaye, home pe bhejo
        return RouteKey.home;
      }

      // Baaki cases me koi redirect nahi chahiye
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
      GoRoute(
        path: RouteKey.editprofile,
        builder: (context, state) => const EditPage(),
      ),
      GoRoute(
        path: RouteKey.notifications,
        builder: (context, state) => const Notifications(),
      ),
      // GoRoute(
      //   path: RouteKey.order,
      //   builder: (context, state) => const MyOrder(),
      // ),
      GoRoute(
        path: RouteKey.wishlist,
        builder: (context, state) => const Wishlist(),
      ),
      GoRoute(path: RouteKey.sale, builder: (context, state) => const Sale()),
      GoRoute(
        path: RouteKey.search,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;
  RouterNotifier(this._ref) {
    _ref.listen<UserModel?>(userStateProvider, (_, __) => notifyListeners());
  }
}

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
}

// final routerProvider = Provider<GoRouter>((ref) {
//   String? path;
//   return GoRouter(
//     redirect: (_, state) {
//       final uri = state.uri;

//       if (uri.path == RouteKey.sign) {
//         return uri.toString();
//       }

//       if (uri.path != RouteKey.login && uri.path != RouteKey.home) {
//         path = uri.toString();
//       }

//       final user = ref.read(userStateProvider);
//       final bool loggedIn = (user != null);

//       if (!loggedIn) {
//         // Not logged in, allow login/signup access only
//         if (uri.path == RouteKey.login || uri.path == RouteKey.sign) {
//           return null;
//         }
//         return RouteKey.login;
//       }

//       // Already logged in
//       if (uri.path == RouteKey.login || uri.path == RouteKey.sign) {
//         // If already logged in and at login/signup, redirect to home
//         return RouteKey.home;
//       }

//       return null;
//     },
//     initialLocation: RouteKey.home,
//     refreshListenable: RouterNotifier(ref),
//     debugLogDiagnostics: kDebugMode,
//     routes: [
//       GoRoute(path: RouteKey.login, builder: (context, state) => LoginView()),
//       GoRoute(
//         path: RouteKey.sign,
//         builder: (context, state) => const SignUpView(),
//       ),
//       GoRoute(
//         path: RouteKey.home,
//         builder: (context, state) {
//           final index = state.uri.queryParameters['index'] ?? "0";
//           return BottomNavBar(index: index);
//         },
//       ),
//       GoRoute(path: RouteKey.cart, builder: (context, state) => const Cart()),
//       GoRoute(
//         path: RouteKey.profile,
//         builder: (context, state) => const Profile(),
//       ),
//       GoRoute(
//         path: RouteKey.editprofile,
//         builder: (context, state) => const EditPage(),
//       ),
//       GoRoute(
//         path: RouteKey.notifications,
//         builder: (context, state) => const Notifications(),
//       ),
//       GoRoute(
//         path: RouteKey.order,
//         builder: (context, state) => const MyOrder(),
//       ),
//       GoRoute(
//         path: RouteKey.wishlist,
//         builder: (context, state) => const Wishlist(),
//       ),
//       GoRoute(path: RouteKey.sale, builder: (context, state) => const Sale()),
//       GoRoute(
//         path: RouteKey.search,
//         builder: (context, state) => const SearchView(),
//       ),
//     ],
//   );
// });

// class RouterNotifier extends ChangeNotifier {
//   final Ref _ref;

//   RouterNotifier(this._ref) {
//     _ref.listen<UserModel?>(userStateProvider, (_, __) => notifyListeners());
//   }
// }

// class RouteKey {
//   static const String login = '/';
//   static const String sign = '/signupPage';
//   static const String home = '/bottombar';
//   static const String cart = '/cart';
//   static const String search = '/search';
//   static const String profile = '/profile';
//   static const String editprofile = '/editprofile';
//   static const String notifications = '/notifications';
//   static const String order = '/order';
//   static const String wishlist = '/wishlist';
//   static const String sale = '/sale';
// }
