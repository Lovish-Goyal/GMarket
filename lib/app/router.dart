import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_appwrite/app/modules/auth/user_model/user_model.dart';
import 'package:learn_appwrite/app/bottom_bar.dart';
import 'package:learn_appwrite/app/modules/auth/auth_ui/loginview.dart';
import 'package:learn_appwrite/app/modules/auth/auth_ui/signupview.dart';
import 'package:learn_appwrite/app/modules/myorder/my_order.dart';
import 'package:learn_appwrite/app/modules/wishlist/wishlist.dart';
import 'package:learn_appwrite/app/modules/cart/view.dart';
import 'package:learn_appwrite/app/modules/notifications/notifications.dart';
import 'modules/auth/provider.dart';
import 'modules/profile/editprofile.dart';
import 'modules/profile/profile.dart';
import 'modules/sale_product/View/sale_product.dart';
import '../widgets/searchview.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    String? path;
    return GoRouter(
      redirect: (_, state) {
        if (state.matchedLocation == RouteKey.sign) {
          return state.location;
        }
        if (state.matchedLocation != RouteKey.login &&
            state.matchedLocation != RouteKey.home) {
          path = state.location;
        }
        final user = ref.read(userStateProvider);
        final bool loggedIn = (user != null);
        final bool loggingIn = state.matchedLocation == RouteKey.login;
        if (!loggedIn) {
          return loggingIn ? null : RouteKey.login;
        }
        if (loggingIn) {
          return path ?? RouteKey.home;
        }
        return null;
      },
      initialLocation: RouteKey.home,
      refreshListenable: RouterNotifier(ref),
      debugLogDiagnostics: kDebugMode,
      routes: [
        GoRoute(
          path: RouteKey.login,
          builder: (context, state) =>  LoginView(),
        ),
        GoRoute(
          path: RouteKey.sign,
          builder: (context, state) => const SignUpView(),
        ),
        GoRoute(
          path: RouteKey.home,
          builder: (context, state) => BottomNavBar(
            index: state.queryParameters['index'] ?? "0",
          ),
        ),
        GoRoute(
          path: RouteKey.cart,
          builder: (context, state) => const Cart(),
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
        GoRoute(
          path: RouteKey.order,
          builder: (context, state) => const MyOrder(),
        ),
        GoRoute(
          path: RouteKey.wishlist,
          builder: (context, state) => const Wishlist(),
        ),
        GoRoute(
          path: RouteKey.sale,
          builder: (context, state) => const Sale(),
        ),
        GoRoute(
          path: RouteKey.search,
          builder: (context, state) => const SearchView(),
        ),
      ],
    );
  },
);

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<UserModel?>(
      userStateProvider,
      (_, __) => notifyListeners(),
    );
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
