import 'package:flutter/material.dart';
import 'package:lab_5/colors.dart';

import 'api_services.dart';
import 'image_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var sizes = ["Pequeño", "Mediano", "Grande"];
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
  var hairLength = ["Largo", "Corto", "Medio"];
  var skinColor = ["Blanco", "Moreno"];
  String? dropValue;
  String? dropGenre;
  String? dropHairColor;
  String? dropEyesColor;
  String? dropHairLength;
  String? dropSkinColor;
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
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 350,
                    height: 44,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        icon: const Icon(Icons.expand_more, color: btnColor),
                        value: dropValue,
                        hint: const Text("Tamaño de imagen"),
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
                  ),
                  Container(
                    width: 350,
                    height: 44,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        icon: const Icon(Icons.expand_more, color: btnColor),
                        value: dropGenre,
                        hint: const Text("Genero"),
                        items: List.generate(
                          genre.length,
                          (index) => DropdownMenuItem(
                            child: Text(genre[index]),
                            value: genre[index],
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            dropGenre = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 44,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        icon: const Icon(Icons.expand_more, color: btnColor),
                        value: dropHairColor,
                        hint: const Text("Color de cabello"),
                        items: List.generate(
                          hairColor.length,
                          (index) => DropdownMenuItem(
                            child: Text(hairColor[index]),
                            value: hairColor[index],
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            dropHairColor = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 44,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        icon: const Icon(Icons.expand_more, color: btnColor),
                        value: dropEyesColor,
                        hint: const Text("Color de ojos"),
                        items: List.generate(
                          eyesColor.length,
                          (index) => DropdownMenuItem(
                            child: Text(eyesColor[index]),
                            value: eyesColor[index],
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            dropEyesColor = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 44,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        icon: const Icon(Icons.expand_more, color: btnColor),
                        value: dropSkinColor,
                        hint: const Text("Color de piel"),
                        items: List.generate(
                          skinColor.length,
                          (index) => DropdownMenuItem(
                            child: Text(skinColor[index]),
                            value: skinColor[index],
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            dropSkinColor = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: 350,
                    height: 44,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        icon: const Icon(Icons.expand_more, color: btnColor),
                        value: dropHairLength,
                        hint: const Text("Longitud del cabello"),
                        items: List.generate(
                          hairLength.length,
                          (index) => DropdownMenuItem(
                            child: Text(hairLength[index]),
                            value: hairLength[index],
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            dropHairLength = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 44,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: btnColor,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () async {
                        if (dropValue != null &&
                            dropGenre != null &&
                            dropHairColor != null &&
                            dropEyesColor != null &&
                            dropSkinColor != null &&
                            dropHairLength != null) {
                          setState(() {
                            isLoaded = false;
                          });
                          String concatenatedValues =
                              "$dropGenre con cabello color $dropHairColor, ojos color $dropEyesColor, piel de color $dropSkinColor, con cabello $dropHairLength";
                          print(concatenatedValues);
                          image = await Api.generateImage(
                              concatenatedValues, dropValue!);
                          setState(() {
                            isLoaded = true;
                          });
                          navigateToImageScreen(image);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Please select all options",
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "Generar",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToImageScreen(String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageScreen(imageUrl: imageUrl),
      ),
    );
  }
}
