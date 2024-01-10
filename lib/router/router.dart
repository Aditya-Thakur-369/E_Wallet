class AppRouter {
  String name;
  String path;
  AppRouter({
    required this.name,
    required this.path,
  });
}

class Routes {
  static AppRouter navigation = AppRouter(name: "root", path: "/navigstion");
  static AppRouter homescreen = AppRouter(name: "home", path: "/");
  static AppRouter statisticsscreen =
      AppRouter(name: "statistics", path: "/statistics");
  static AppRouter wallet = AppRouter(name: "wallet", path: "/wallet");
  static AppRouter account = AppRouter(name: "account", path: "/account");
}
