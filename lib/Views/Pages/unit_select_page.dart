import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_reflections/View%20Models/unit_view_model.dart';
import 'package:unit_reflections/Views/Widgets/widgets.dart';

class UnitSelectPage extends StatefulWidget {
  const UnitSelectPage({super.key});

  @override
  State<UnitSelectPage> createState() => _UnitSelectPageState();
}

class _UnitSelectPageState extends State<UnitSelectPage> {
  late TextEditingController textController;
  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Units Reflection',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width / 23,
            color: const Color.fromARGB(255, 248, 220, 136),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppSearchIllustration(),
              const SizedBox(
                height: 10,
              ),
              AppSearchField(
                controller: textController,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width / 1.4, 53),
                  elevation: 20,
                  foregroundColor: const Color.fromARGB(255, 255, 254, 254),
                  backgroundColor: const Color.fromARGB(204, 214, 54, 222),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                ),
                child: const Text(
                  'Select',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color.fromARGB(255, 248, 220, 136),
                  ),
                ),
                onPressed: () {
                  if (textController.text.isEmpty) return;
                  context.read<UnitViewModel>().setUnitSearched =
                      int.parse(textController.text);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
