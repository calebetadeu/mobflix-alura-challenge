import 'package:flutter/material.dart';
import 'package:mobflix_alura_challenge/components/input.dart';

class CadasterScreen extends StatelessWidget {
  const CadasterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0,
                top: 20,
                right: 20.0), // Adicione um espaço de margem à esquerda
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Cadastre o vídeo",
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const InputCadaster(
                  label: "URL",
                  hint: "Ex:SJDMDMMSMMDKFMD",
                ),
                const InputCadaster(
                  label: "Categoria",
                  hint: "Mobile",
                ),
                const SizedBox(
                  height: 19,
                ),
                const Text(
                  "Preview",
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 12,
                ),
                Center(
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Image.asset(
                      'images/preview_youtube.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Define o raio da borda
                        ),
                        backgroundColor: Colors.blue.shade700,
                      ),
                      child: const Text(
                        'Cadastrar',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
