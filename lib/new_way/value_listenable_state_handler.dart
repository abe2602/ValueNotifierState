import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ValueListenableStateHandler<Loading, Success, Error>
    extends StatelessWidget {
  const ValueListenableStateHandler({
    required this.valueListenable,
    required this.successWidgetBuilder,
    required this.errorWidgetBuilder,
    Key? key,
  }) : super(key: key);

  final ValueListenable valueListenable;
  final Widget Function(Success success) successWidgetBuilder;
  final Widget Function(Error error) errorWidgetBuilder;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: valueListenable,
        builder: (context, listenableData, _) {
          if (listenableData == null || listenableData is Loading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (listenableData is Error) {
            return errorWidgetBuilder(listenableData as Error);
          } else if (listenableData is Success) {
            return successWidgetBuilder(listenableData as Success);
          }

          return Container();
        },
      );
}
