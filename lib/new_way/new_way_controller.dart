import 'package:flutter/foundation.dart';

import 'new_way_state.dart';

class NewWayController {
  NewWayController() {
    getSuccess();
  }

  final onState = ValueNotifier<NewWayState>(Idle());

  Future<void> getSuccess() async {
    onState.value = Loading();

    await Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        onState.value = DataSuccess();
      },
    );
  }

  Future<void> getError() async {
    onState.value = Loading();

    await Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        onState.value = GenericError();
      },
    );
  }

  void dispose() {
    onState.dispose();
  }
}
