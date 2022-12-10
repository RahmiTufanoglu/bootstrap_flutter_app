import 'package:form_app/forgot_password_page.dart';
import 'package:form_app/routes/page_transition.dart';
import 'package:go_router/go_router.dart';

GoRoute forgotPasswordRoute() {
  return GoRoute(
    path: '/${ForgotPasswordPage.routeName}',
    pageBuilder: (_, state) {
      return PageTransition(
        key: state.pageKey,
        child: const ForgotPasswordPage(),
      );
    },
  );
}
