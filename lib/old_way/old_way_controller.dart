import 'package:flutter/foundation.dart';

class OldWayController {
  OldWayController() {
    getSuccess();
  }

  final isSuccess = ValueNotifier<bool>(false);
  final isLoading = ValueNotifier<bool>(false);
  final isError = ValueNotifier<bool>(false);

  Future<void> getSuccess() async {
    isLoading.value = true;

    await Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        isSuccess.value = true;
        isError.value = false;
        isLoading.value = false;
      },
    );
  }

  Future<void> getError() async {
    isLoading.value = true;

    await Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        isSuccess.value = false;
        isError.value = true;
        isLoading.value = false;
      },
    );
  }

  void dispose() {
    isSuccess.dispose();
    isLoading.dispose();
    isError.dispose();
  }
}
