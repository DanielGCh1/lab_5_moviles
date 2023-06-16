import 'package:flutter/material.dart';
import 'package:lab_5/colors.dart';

import 'api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var sizes = ["Small", "Medium", "Large"];
  var values = ["256x256", "512x512", "1024x1024"];
  var genre = ["Chica", "Chico"];
  var hairColor = [
    "Azul",
    "Verde",
    "Amarillo",
    "Naranjado",
    "Cafe",
    "Negro",
    "Morado"
  ];
  var eyesColor = ["Azules", "Verdes", "Cafe", "Negros", "Morados"];
  var hairLenght = ["Largo", "Corto", "Medio"];
  var skinColor = ["Blanco", "Moreno"];
  String? dropValue;
  String? dropGenre;
  String? dropHairColor;
  String? dropEyesColor;
  String? dropHairLenght;
  String? dropSkinColor;
  var textController = TextEditingController();
  String image = '';
  var isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Generador de Personajes",
          style: TextStyle(
            fontFamily: "arial",
            color: whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 44,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextFormField(
                            controller: textController,
                            decoration: const InputDecoration(
                              hintText: "eg 'A monkey on moon' ",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        height: 44,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            icon:
                                const Icon(Icons.expand_more, color: btnColor),
                            value: dropValue,
                            hint: const Text("Select Size"),
                            items: List.generate(
                              sizes.length,
                              (index) => DropdownMenuItem(
                                child: Text(sizes[index]),
                                value: values[index],
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                dropValue = value.toString();
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 300,
                    height: 44,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: btnColor,
                            shape: const StadiumBorder()),
                        onPressed: () async {
                          if (textController.text.isNotEmpty &&
                              dropValue!.isNotEmpty) {
                            setState(() {
                              isLoaded = false;
                            });
                            image = await Api.generateImage(
                                textController.text, dropValue!);
                            setState(() {
                              isLoaded = true;
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please pass the query and size"),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          "Generar",
                          style: TextStyle(fontSize: 15),
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: isLoaded
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.network(
                            image,
                            fit: BoxFit.contain,
                          ),
                        )
                      ],
                    )
                  : Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: whiteColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/loader.gif'),
                          const SizedBox(height: 12),
                          const Text(
                            "Waiting for image to be generated...",
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
            ),
            const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Desarrollado por el Grupo #2",
                  style: TextStyle(color: whiteColor, fontSize: 14.0),
                ))
          ],
        ),
      ),
    );
  }
}
