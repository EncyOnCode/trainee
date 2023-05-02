import 'package:auto_route/auto_route.dart';

import 'main.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  // TODO: implement routes
  List<AutoRoute> get routes => [
        AutoRoute(page: StartRoute.page, path: '/'),
        AutoRoute(page: NewsRoute.page, path: '/news'),
      ];
}
