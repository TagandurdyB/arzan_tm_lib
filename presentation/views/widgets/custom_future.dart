import '/presentation/views/pages/lotties/page_500.dart';
import 'package:flutter/material.dart';

class CustomFuture extends StatelessWidget {
  final Future<Object?>? future;
  final Function builder;
  const CustomFuture({required this.future, required this.builder, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Page500();
        } else if (snapshot.hasData) {
          return builder(context, snapshot.data);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
