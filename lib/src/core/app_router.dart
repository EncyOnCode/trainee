import 'package:auto_route/auto_route.dart';

import '../features/ navigation/nav_screen.dart';
import '../features/home_store/presentation/ui/screen/start_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: NavBarRoute.page, path: '/'),
      ];
}
