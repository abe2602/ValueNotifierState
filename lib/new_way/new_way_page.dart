import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:state_example/new_way/new_way_controller.dart';
import 'package:state_example/new_way/value_listenable_state_handler.dart';

import 'new_way_state.dart';

class NewWayPage extends StatelessWidget {
  const NewWayPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => _NewWayPageView(
        NewWayController(),
      );
}

class _NewWayPageView extends StatelessWidget {
  const _NewWayPageView(
    this.controller,
  );

  final NewWayController controller;

  @override
  Widget build(BuildContext context) => ValueListenableStateHandler<Loading, Success, Error>(
    valueListenable: controller.onState,
    successWidgetBuilder: (success) => Scaffold(
      appBar: AppBar(
        title: const Text(
          'NEW WAY',
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.greenAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sucesso',
            ),
            MaterialButton(
              onPressed: () => controller.getError(),
              child: const Text(
                'GET NEW STATE',
              ),
            ),
          ],
        ),
      ),
    ),
    errorWidgetBuilder: (error) => Scaffold(
      appBar: AppBar(
        title: const Text(
          'NEW WAY',
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.redAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'ERROR',
            ),
            MaterialButton(
              onPressed: () => controller.getError(),
              child: const Text(
                'GET NEW STATE',
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
