import 'package:form_app/routes/page_transition.dart';
import 'package:form_app/register_page.dart';
import 'package:go_router/go_router.dart';

GoRoute registerRoute() {
  return GoRoute(
    path: '/${RegisterPage.routeName}',
    pageBuilder: (_, state) {
      return PageTransition(
        key: state.pageKey,
        child: const RegisterPage(),
      );
    },
  );
}
