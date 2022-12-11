import 'package:form_app/home_page.dart';
import 'package:form_app/routes/page_transition.dart';
import 'package:go_router/go_router.dart';

GoRoute homeRoute() {
  return GoRoute(
    path: '/${HomePage.routeName}',
    pageBuilder: (_, state) {
      return PageTransition(
        key: state.pageKey,
        child: const HomePage(),
      );
    },
  );
}
