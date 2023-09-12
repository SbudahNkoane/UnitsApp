import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_reflections/View%20Models/unit_view_model.dart';
import 'package:unit_reflections/Views/Widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UnitViewModel>().getSpecs;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Units Reflection',
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 248, 220, 136),
          ),
        ),
      ),
      body: Consumer<UnitViewModel>(
        builder: (context, value, child) {
          return RefreshIndicator(
            color: const Color.fromARGB(255, 248, 220, 136),
            backgroundColor: const Color.fromARGB(137, 214, 54, 222),
            child: value.error == false && value.downloading == false
                ? const AppCard()
                : value.downloading == true
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 248, 220, 136),
                        backgroundColor: Color.fromARGB(137, 214, 54, 222),
                      ))
                    : Center(
                        child: Text(
                          value.errorMessage,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 0, 0),
                              fontSize: 12),
                        ),
                      ),
            onRefresh: () async {
              await value.getSpecs;
            },
          );
        },
      ),
    );
  }
}
