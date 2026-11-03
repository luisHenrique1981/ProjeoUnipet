import 'package:flutter/material.dart';

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
  int _value = 0;

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
            // Título e subtexto centralizados
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
                      color: Colors.grey,
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

            // O RadioListTile fica direto dentro da Column (sem Row por fora)
            RadioListTile<int>(
              contentPadding: EdgeInsets.zero,
              title: const Text('Animal circulando ou abandonado'),
              value: 1,
              // ignore: deprecated_member_use
              groupValue: _value,
              activeColor: Colors.orange,
              // ignore: deprecated_member_use
              onChanged: (int? value) {
                setState(() {
                  _value = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}