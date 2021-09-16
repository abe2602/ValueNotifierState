import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'old_way_controller.dart';

class OldWayPage extends StatelessWidget {
  const OldWayPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => _OldWayPageView(
        OldWayController(),
      );
}

class _OldWayPageView extends StatelessWidget {
  const _OldWayPageView(
    this.controller,
  );

  final OldWayController controller;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: controller.isSuccess,
            builder: (_, isSuccess, __) {
              if (isSuccess) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text(
                      'OLD WAY',
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
                );
              }

              return Container();
            },
          ),
          ValueListenableBuilder<bool>(
            valueListenable: controller.isError,
            builder: (_, isError, __) {
              if (isError) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text(
                      'OLD WAY',
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
                );
              }

              return Container();
            },
          ),
          ValueListenableBuilder<bool>(
            valueListenable: controller.isLoading,
            builder: (_, isLoading, __) {
              if (isLoading) {
                return const Scaffold(
                  body:  Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              return Container();
            },
          ),
        ],
      );
}
