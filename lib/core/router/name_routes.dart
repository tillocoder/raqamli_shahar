sealed class Routes {
  Routes._();

  static const String initial = '/intitial';

  /// initial
  static const String onboarding = '/onboarding';

  /// auth login
  static const String login = '/login';

  // Home
  static const String home = '/home';
  static const String citizens = 'home/citizens';
  static const String activities = 'home/citizens/activities';
  static const String activitiesAdd = 'home/citizens/activitiesAdd';
  static const String citizenAdd = 'home/citizens/citizenAdd';
  static const String citizenSearch = 'home/citizens/citizenSearch';
}
