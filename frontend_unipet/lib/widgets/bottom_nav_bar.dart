
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTap,

      // COR DE FUNDO
      backgroundColor: const Color(0xFF165823),

      // EXIBIR TODOS OS ITENS
      type: BottomNavigationBarType.fixed,

      // CORES DOS ÍCONES
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,

      // TAMANHO DOS ÍCONES
      iconSize: 26,

      // TAMANHO DOS TEXTOS
      selectedFontSize: 12,
      unselectedFontSize: 12,

      // NÃO DESAPARECER OS RÓTULOS
      showSelectedLabels: true,
      showUnselectedLabels: true,

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.error_outline),
          label: 'Ocorrência',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.insert_chart_outlined),
          label: 'Dados',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pets),
          label: 'Animais',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Adoção',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }
}
