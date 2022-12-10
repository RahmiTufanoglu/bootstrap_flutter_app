import 'package:form_app/routes/page_transition.dart';
import 'package:form_app/login_page.dart';
import 'package:go_router/go_router.dart';

GoRoute loginRoute() {
  return GoRoute(
    path: '/${LoginPage.routeName}',
    pageBuilder: (_, state) {
      return PageTransition(
        key: state.pageKey,
        child: const LoginPage(),
      );
    },
  );
}
