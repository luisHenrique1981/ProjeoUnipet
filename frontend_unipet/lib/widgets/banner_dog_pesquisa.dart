
import 'package:flutter/material.dart';

class BannerAnimais extends StatelessWidget {
  const BannerAnimais({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      clipBehavior: Clip.antiAlias,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),

      child: Stack(
        fit: StackFit.expand,
        children: [

          // Imagem de fundo
          Image.asset(
            'assets/img/dog_banner.jpg',
            fit: BoxFit.cover,
          ),

          // Camada escura sobre a imagem
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.black.withValues(alpha: 0.65),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          // Conteúdo
          Padding(
            padding: const EdgeInsets.all(25),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [

                // Título
                const Text(
                  'Cuidando dos\n'
                  'animais do\n'
                  'nosso campus',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    height: 1.0,
                  ),
                ),

                // Campo de pesquisa
                SizedBox(
                  height: 42, // Altura da barra de pesquisa
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Pesquise por algo...',
                      hintStyle: const TextStyle(fontSize: 14),

                      prefixIcon: const Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.grey,
                      ),

                      filled: true,
                      fillColor: Colors.white,

                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
