import 'package:form_app/routes/another_page.dart';
import 'package:form_app/routes/page_transition.dart';
import 'package:go_router/go_router.dart';

GoRoute anotherRoute() {
  return GoRoute(
    path: '/${AnotherPage.routeName}',
    pageBuilder: (_, state) {
      return PageTransition(
        key: state.pageKey,
        child: const AnotherPage(),
      );
    },
  );
}
