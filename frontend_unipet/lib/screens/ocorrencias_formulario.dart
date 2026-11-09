import 'package:flutter/material.dart';
import 'package:frontend_unipet/screens/home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';


void main() {
  runApp(const MaterialApp(
    home: FormulariOcorrencia(),
  ));
}

class FormulariOcorrencia extends StatefulWidget {
  const FormulariOcorrencia({super.key});

  @override
  State<FormulariOcorrencia> createState() => _FormulariOcorrenciaState();
}

class _FormulariOcorrenciaState extends State<FormulariOcorrencia> {
  String valorAnimal = 'Nenhum selecionado';
  String situacaoAnimal = 'Nenhum selecionado';
  List<XFile> _images = [];

  Future<void> _getImage() async {
  if (_images.length >= 4) return;

  final List<XFile> fotos = await ImagePicker().pickMultiImage();

  if (fotos.isNotEmpty && mounted) {
    setState(() {
      _images.addAll(fotos.take(4 - _images.length));
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5FA),
      appBar: AppBar(
        toolbarHeight: 100,
        title: Row(
          children: [
            Image.asset(
              'assets/img/logo_Unipet.png',
              width: 80,
              height: 80,
            ),
            const Text(
              'Unipet',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: const Icon(Icons.menu),
              iconSize: 30,
              color: Colors.black,
              onPressed: () {
                // Abrir menu
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: const [
                  Text(
                    "Reportar Ocorrência",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Encontrou algum animal no campus? Informe o que você observou.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF165823),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Qual animal você encontrou?",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                RadioMenuButton(
                  value: 'Cachorro',
                  groupValue: valorAnimal,
                  onChanged: (valor) {
                    setState(() {
                      valorAnimal = valor!;
                    });
                  },
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    elevation: const WidgetStatePropertyAll(2),
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.white,
                    ),
                  ),
                  child: const Text('Cachorro'),
                ),
                const SizedBox(height: 6),
                RadioMenuButton(
                  value: 'Gato',
                  groupValue: valorAnimal,
                  onChanged: (valor) {
                    setState(() {
                      valorAnimal = valor!;
                    });
                  },
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    elevation: const WidgetStatePropertyAll(2),
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.white,
                    ),
                  ),
                  child: const Text('Gato'),  
                ),
                const SizedBox(height: 6),
                RadioMenuButton(
                  value: 'Outro',
                  groupValue: valorAnimal,
                  onChanged: (valor) {
                    setState(() {
                      valorAnimal = valor!;
                    });
                  },
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    elevation: const WidgetStatePropertyAll(2),
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.white,
                    ),
                  ),
                  child: const Text('Outro'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Qual a situação do animal?",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                RadioMenuButton(
                  value: 'Animal circulando ou abandonado',
                  groupValue: situacaoAnimal,
                  onChanged: (valor) {
                    setState(() {
                      situacaoAnimal = valor!;
                    });
                  },
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    elevation: const WidgetStatePropertyAll(2),
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.white,
                    ),
                  ),
                  child: const Text('Animal circulando ou abandonado'),
                ),
                const SizedBox(height: 6),
                RadioMenuButton(
                  value: 'Animal ferido ou doente',
                  groupValue: situacaoAnimal,
                  onChanged: (valor) {
                    setState(() {
                      situacaoAnimal = valor!;
                    });
                  },
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    elevation: const WidgetStatePropertyAll(2),
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.white,
                    ),
                  ),
                  child: const Text('Animal ferido ou doente'),  
                ),
                const SizedBox(height: 6),
                RadioMenuButton(
                  value: 'Animal agressivo ou risco para pessoas',
                  groupValue: situacaoAnimal,
                  onChanged: (valor) {
                    setState(() {
                      situacaoAnimal = valor!;
                    });
                  },
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    elevation: const WidgetStatePropertyAll(2),
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.white,
                    ),
                  ),
                  child: const Text('Animal agressivo ou risco para pessoas'),
                ),
                const SizedBox(height: 6),
                RadioMenuButton(
                  value: 'Outra situação',
                  groupValue: situacaoAnimal,
                  onChanged: (valor) {
                    setState(() {
                      situacaoAnimal = valor!;
                    });
                  },
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    elevation: const WidgetStatePropertyAll(2),
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.white,
                    ),
                  ),
                  child: const Text('Outra situação'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Onde está o animal?",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Descreva onde o animal está localizado',
                hintText: 'Ex: próximo ao bloco A, na entrada principal, etc.)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Foto (Opcional)",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            DottedBorder(
              options: RoundedRectDottedBorderOptions(
                radius: const Radius.circular(8),
                color: Colors.grey,
                strokeWidth: 1.5,
                dashPattern: const [6, 3],
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.image_not_supported,
                      size: 32,
                      color: const Color(0xFFFF9100),
                    ),

                    const SizedBox(height: 10),

                    if (_images.isNotEmpty)
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _images.map((imagem) {
                          return FutureBuilder(
                            future: imagem.readAsBytes(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const CircularProgressIndicator();
                              }

                              return Image.memory(
                                snapshot.data!,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              );
                            },
                          );
                        }).toList(),
                      ),

                    const SizedBox(height: 10),

                    OutlinedButton(
                      onPressed: _images.length >= 4 ? null : _getImage,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFFFF9100),
                        backgroundColor: Colors.white,
                        side: const BorderSide(
                          color: Color(0xFFFF9100),
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 8,
                        ),
                        minimumSize: const Size(160, 30),
                      ),
                      child: const Text(
                        'Adicionar foto',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      '${_images.length}/4 fotos adicionadas',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _getImage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF165823),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Enviar Ocorrência'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}