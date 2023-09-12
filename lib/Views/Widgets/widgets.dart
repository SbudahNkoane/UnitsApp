import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:unit_reflections/Routes/route.dart';
import 'package:unit_reflections/View%20Models/unit_view_model.dart';

//Our Specifications card
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UnitViewModel>(
      builder: (context, value, child) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: value.unitSelected > value.units.length ||
                  value.unitSelected < -1
              ? const Center(
                  child: Text(
                    'The unit you searched for was not found.....',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0), fontSize: 12),
                  ),
                )
              : Column(
                  children: [
                    Text('My TPG316C Units App',
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colors.grey)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.42,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: value.unitSelected >= 1 &&
                                value.unitSelected <= value.units.length
                            ? 1
                            : value.units.length,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(20),
                              ),
                            ),
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    value
                                        .units[value.unitSelected >= 1 &&
                                                value.unitSelected <=
                                                    value.units.length
                                            ? value.unitSelected - 1
                                            : index]
                                        .image!,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(
                                      value
                                          .units[value.unitSelected >= 1 &&
                                                  value.unitSelected <=
                                                      value.units.length
                                              ? value.unitSelected - 1
                                              : index]
                                          .unit!,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                  Text(
                                      value
                                          .units[value.unitSelected >= 1 &&
                                                  value.unitSelected <=
                                                      value.units.length
                                              ? value.unitSelected - 1
                                              : index]
                                          .concept!,
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: const Color.fromARGB(
                                            137, 214, 54, 222),
                                      )),
                                  Text(
                                      value
                                          .units[value.unitSelected >= 1 &&
                                                  value.unitSelected <=
                                                      value.units.length
                                              ? value.unitSelected - 1
                                              : index]
                                          .definition!,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    value.unitSelected != -1
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(152, 50),
                                  elevation: 20,
                                  foregroundColor:
                                      const Color.fromARGB(137, 214, 54, 222),
                                  backgroundColor:
                                      const Color.fromARGB(205, 248, 220, 136),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                                ),
                                child: Text('Select All',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    )),
                                onPressed: () {
                                  value.setUnitSearched = -1;
                                },
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(152, 50),
                                  elevation: 20,
                                  foregroundColor:
                                      const Color.fromARGB(255, 248, 220, 136),
                                  backgroundColor:
                                      const Color.fromARGB(137, 214, 54, 222),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                                ),
                                child: Text('Select 1 Unit',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    )),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(RouteManager.unitSelectPage);
                                },
                              ),
                            ],
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(152, 50),
                              elevation: 20,
                              foregroundColor:
                                  const Color.fromARGB(255, 248, 220, 136),
                              backgroundColor:
                                  const Color.fromARGB(137, 214, 54, 222),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                            ),
                            child: Text('Select 1 Unit',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                )),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(RouteManager.unitSelectPage);
                            },
                          ),
                  ],
                ),
        );
      },
    );
  }
} //end Card

//Input field for Unit seach-Second page
class AppSearchField extends StatelessWidget {
  final TextEditingController controller;
  const AppSearchField({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(204, 214, 54, 222),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        hintText: 'Enter Unit Number',
        hintStyle: GoogleFonts.abel(),
        prefixIcon: const Icon(Icons.search_rounded),
        prefixIconColor: const Color.fromARGB(204, 161, 161, 161),
      ),
    );
  }
} //end Input field

//illustrator on second page
class AppSearchIllustration extends StatelessWidget {
  const AppSearchIllustration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/search.png",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3.5,
        ),
        Positioned(
          left: 110,
          top: 165,
          child: Text(
            'Available Units: ${context.read<UnitViewModel>().units.length} Units',
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 214, 95, 152),
                fontStyle: FontStyle.italic),
          ),
        ),
      ],
    );
  }
} //end illustrator
