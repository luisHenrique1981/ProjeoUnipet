// 1. IMPORTAÇÕES
import 'package:flutter/material.dart';
import 'package:frontend_unipet/screens/home.dart';
import 'package:frontend_unipet/widgets/bottom_nav_bar.dart';

// 2. CLASSE PRINCIPAL DA TELA
class PerfilUsuario extends StatefulWidget {
  const PerfilUsuario({super.key});

  @override
  State<PerfilUsuario> createState() => _PerfilUsuario();
}

// 3. CLASSE DE ESTADO
class _PerfilUsuario extends State<PerfilUsuario> {
  int selectedIndex = 0;
  // 4. VARIÁVEIS
  String nome = '';

  // 5. FUNÇÕES
  void minhaFuncao() {
    setState(() {
      nome = 'Unipet';
    });
  }

  // 6. CONSTRUÇÃO DA INTERFACE
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // 7. BARRA SUPERIOR
      backgroundColor: const Color(0xFFF2F5FA),
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          children: [
            Image.asset(
              'assets/img/logo_Unipet.png',
              width: 80,
              height: 80,
              
            ),
            const Text('Unipet',
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
        automaticallyImplyLeading: false,
      ),

      // 8. CONTEÚDO DA PÁGINA
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:Column(
            children: [
              Container(
                width: double.infinity,
                height: 170,
                decoration: BoxDecoration(
                  
                  border: Border.all(
                    color: const Color(0xFF165823),
                    width: 2,
                  ), // Cor em hex ou Colors.grey[100]
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nome do estudante',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0x332D6A4F),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Estudante',
                        style: TextStyle(
                          color: Color(0xFF2D6A4F),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Text(
                      'emaildoestudante@gmail.com',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        side: const BorderSide(
                          color: Color(0xFF2D6A4F),
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 8,
                        ),
                        minimumSize: const Size(double.infinity, 30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.black,
                            size: 20,
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Editar perfil',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Minha atividade',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: const BorderSide(
                    color: Color(0xFF2D6A4F),
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 8,
                  ),
                  minimumSize: const Size(double.infinity, 60),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.content_paste,
                      color: Colors.black,
                      size: 24,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Minhas ações',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.black,
                      size: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Preferências',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: const BorderSide(
                    color: Color(0xFF2D6A4F),
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 8,
                  ),
                  minimumSize: const Size(double.infinity, 60),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.black,
                      size: 24,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Notificações',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.black,
                      size: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: const BorderSide(
                    color: Color(0xFF2D6A4F),
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 8,
                  ),
                  minimumSize: const Size(double.infinity, 60),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.accessibility,
                      color: Colors.black,
                      size: 24,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Acessibilidade',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.black,
                      size: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Preferências',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: const BorderSide(
                    color: Color(0xFF2D6A4F),
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 8,
                  ),
                  minimumSize: const Size(double.infinity, 60),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.contact_support,
                      color: Colors.black,
                      size: 24,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Perguntas frequentes',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.black,
                      size: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: const BorderSide(
                    color: Color(0xFF2D6A4F),
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 8,
                  ),
                  minimumSize: const Size(double.infinity, 60),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.privacy_tip,
                      color: Colors.black,
                      size: 24,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Privacidade e Termos',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.black,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            );
          }
        },
      ),
    );
  }
}