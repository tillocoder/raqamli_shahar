import 'package:go_router/go_router.dart';
import 'package:tamorqa_app/core/router/name_routes.dart';
import 'package:tamorqa_app/features/auth/login/view/pages/login_page.dart';
import 'package:tamorqa_app/features/citizen_add/view/page/citizen_page.dart';
import 'package:tamorqa_app/features/citizens/view/pages/citizens_page.dart';
import 'package:tamorqa_app/features/citizens_activities/view/pages/citizens_activities_page.dart';
import 'package:tamorqa_app/features/home/view/pages/home_page.dart';
import 'package:tamorqa_app/keraksiz.dart';
import 'package:tamorqa_app/setup.dart';

class Routing {
  static final GoRouter router = GoRouter(
    initialLocation: box.get('access') == null ? Routes.login : Routes.home,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: Routes.keraksiz,
        path: Routes.keraksiz,
        builder: (context, state) => const Keraksiz(),
      ),
      GoRoute(
        name: Routes.login,
        path: Routes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: 'home',
        path: Routes.home,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            name: Routes.citizens,
            path: Routes.citizens,
            builder: (context, state) => const CitizensPage(),
            routes: [
              GoRoute(
                name: Routes.activities,
                path: Routes.activities,
                builder: (context, state) => const CitezensActivities(),
              ),
              GoRoute(
                name: Routes.citizenAdd,
                path: Routes.citizenAdd,
                builder: (context, state) => const CitizenAddOrEditScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
