import 'package:get/get.dart';

mixin ScreenLoadingAndErrorMixin {
  final RxBool _isLoading = true.obs;

  final RxnString _error = RxnString();

  void setLoadingToTrue() => _isLoading.value = true;

  void setLoadingToFalse() => _isLoading.value = false;

  void setError(String? errorString) => _error.value = errorString;

  bool get getIsLoading => _isLoading.value;

  String? get getError => _error.value;
}
