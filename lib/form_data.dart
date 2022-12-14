import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormData extends Equatable {
  const FormData({
    this.email,
    this.password,
    this.termsAccepted,
  });

  const FormData.empty({
    this.email = '',
    this.password = '',
    this.termsAccepted = false,
  });

  FormData copyWith({
    String? email,
    String? password,
    bool? termsAccepted,
  }) {
    return FormData(
      email: email ?? this.email,
      password: password ?? this.password,
      termsAccepted: termsAccepted ?? this.termsAccepted,
    );
  }

  final String? email;
  final String? password;
  final bool? termsAccepted;

  @override
  List<Object?> get props => [email, password, termsAccepted];

  @override
  bool get stringify => true;
}

/*
final formProvider = StateProvider<FormData>((ref) {
  return const FormData.empty();
});
*/

/*
final formProvider = ChangeNotifierProvider<FormNotifier>((ref) {
  return FormNotifier();
});
*/
final formProvider = StateNotifierProvider<FormNotifier, FormData>((ref) {
  return FormNotifier();
});

class FormNotifier extends StateNotifier<FormData> {
  FormNotifier() : super(const FormData());

  final _formData = const FormData.empty();

  FormData get formData => _formData;

  set formData(FormData data) {
    state = state.copyWith(
      email: data.email,
      password: data.password,
      termsAccepted: data.termsAccepted,
    );
  }
}
