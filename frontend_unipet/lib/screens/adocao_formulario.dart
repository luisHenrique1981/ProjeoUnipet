import 'package:flutter/material.dart';
import 'package:frontend_unipet/screens/home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:phone_text_field/phone_text_field.dart';


void main() {
  runApp(const MaterialApp(
    home: FormularioAdocao(),
  ));
}

class FormularioAdocao extends StatefulWidget {
  const FormularioAdocao({super.key});

  @override
  State<FormularioAdocao> createState() => _FormularioAdocao();
}

class _FormularioAdocao extends State<FormularioAdocao> {
  String valorAnimal = 'Nenhum selecionado';
  String situacaoAnimal = 'Nenhum selecionado';
  List<XFile> _images = [];
  var formKey= GlobalKey<FormState>();
  final _emailController = TextEditingController();
  String? _opcaoSelecionada;
  bool telaProtecao = false;
  bool muroPortao = false;
  bool externoProtegido = false;
  bool nenhum = false;
  String? _pessoasResidenciaqtd; 
  String? _tempoAnimal;
  final _observacoesController = TextEditingController();


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
                    "Pedido de adoção",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Essas informações serão usadas para entrar em contato sobre o processo",
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
              "Dados pessoais",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Nome completo',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            Form(
              key: formKey,
              child: Column( 
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Digite seu nome completo',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) return 'Este campo precisa ser preenchido.';
                      return null;
                    }, 
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _emailController,
                    keyboardType:
                        TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      hintText: 'seuemail@exemplo.com',
                      prefixIcon:
                          Icon(Icons.email_outlined),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return 'Informe seu e-mail';
                      }
                      if (!RegExp(
                        r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                      ).hasMatch(value.trim())) {
                        return 'Informe um e-mail válido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Telefone',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  PhoneTextField(
                    initialCountryCode: 'BR', // Já começa com a bandeira do Brasil 🇧🇷
                    decoration: InputDecoration(
                      labelText: 'Telefone',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (phone) {
                      // Retorna o número completo com o DDI (ex: +5511999999999) 
                    },
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Vínculo com a instituição',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      
                      // O Dropdown Principal
                      DropdownButtonFormField<String>(
                        value: _opcaoSelecionada,
                        hint: const Text('Escolha uma opção'),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        items: const [
                          DropdownMenuItem(value: '1', child: Text('Aluno')),
                          DropdownMenuItem(value: '2', child: Text('Professor')),
                          DropdownMenuItem(value: '3', child: Text('Funcionário')),
                          DropdownMenuItem(value: '4', child: Text('Externo')),
                        ],
                        onChanged: (String? novoValor) {
                          // Atualiza o estado para redesenhar a tela com a nova escolha
                          setState(() {
                            _opcaoSelecionada = novoValor;
                          });
                        },
                        validator: (value) => value == null ? 'Selecione uma opção' : null,
                      ),

                      // 3. A MÁGICA ACONTECE AQUI:
                      // Se a opção selecionada for igual a 'Outro', o TextField abaixo é renderizado
                      if (_opcaoSelecionada == '1') ...[
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Vínculo com a instituição',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ), // Espaçamento que só aparece junto com o campo
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Ex: Medicina, Direito...',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            // Validação condicional: só exige texto se o campo estiver visível
                            if (_opcaoSelecionada == '1' && (value == null || value.isEmpty)) {
                              return 'Por favor, preencha o campo';
                            }
                            return null;
                          },
                        ),
                      ],
                      // Outros botões ou campos continuam aqui embaixo...
                    ],
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Cidade',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Digite o nome da sua cidade',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) return 'Este campo precisa ser preenchido.';
                      return null;
                    }, 
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Bairro',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Digite o nome do seu bairro',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) return 'Este campo precisa ser preenchido.';
                      return null;
                    }, 
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'CEP',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Digite seu cep',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) return 'Este campo precisa ser preenchido.';
                      return null;
                    }, 
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Numero',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Digite o numero da sua residencia',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) return 'Este campo precisa ser preenchido.';
                      return null;
                    }, 
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Você mora em?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      RadioMenuButton(
                        value: 'Casa',
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
                        child: const Text('Casa'),
                      ),
                      const SizedBox(height: 6),
                      RadioMenuButton(
                        value: 'Apartamento',
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
                        child: const Text('Apartamento'),  
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
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'O local possui espaço seguro para o animal?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      RadioMenuButton(
                        value: 'Sim',
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
                        child: const Text('Sim'),
                      ),
                      const SizedBox(height: 6),
                      RadioMenuButton(
                        value: 'Preciso realizar adaptações',
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
                        child: const Text('Preciso realizar adaptações'),  
                      ),
                      const SizedBox(height: 6),
                      RadioMenuButton(
                        value: 'Não',
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
                        child: const Text('Não'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Quais proteções o local possui?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CheckboxListTile(
                    title: const Text(
                      'Telas de proteção',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: telaProtecao,
                    controlAffinity: ListTileControlAffinity.leading,
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ), // Coloca o quadradinho ANTES do texto
                    contentPadding: EdgeInsets.zero, // Alinha perfeitamente com a borda dos TextFields
                    activeColor: Colors.blue, // Cor do fundo quando marcado
                    onChanged: (bool? novoValor) {
                      // Atualiza a tela com o novo estado (marcado ou desmarcado)
                      setState(() {
                        telaProtecao = novoValor ?? false;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  CheckboxListTile(
                    title: const Text(
                      'Muro ou portão',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: muroPortao,
                    controlAffinity: ListTileControlAffinity.leading,
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ), // Coloca o quadradinho ANTES do texto
                    contentPadding: EdgeInsets.zero, // Alinha perfeitamente com a borda dos TextFields
                    activeColor: Colors.blue, // Cor do fundo quando marcado
                    onChanged: (bool? novoValor) {
                      // Atualiza a tela com o novo estado (marcado ou desmarcado)
                      setState(() {
                        muroPortao = novoValor ?? false;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  CheckboxListTile(
                    title: const Text(
                      'Área externa protegida',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: externoProtegido,
                    controlAffinity: ListTileControlAffinity.leading,
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ), // Coloca o quadradinho ANTES do texto
                    contentPadding: EdgeInsets.zero, // Alinha perfeitamente com a borda dos TextFields
                    activeColor: Colors.blue, // Cor do fundo quando marcado
                    onChanged: (bool? novoValor) {
                      // Atualiza a tela com o novo estado (marcado ou desmarcado)
                      setState(() {
                        externoProtegido = novoValor ?? false;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  CheckboxListTile(
                    title: const Text(
                      'Nenhuma das opções',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: nenhum,
                    controlAffinity: ListTileControlAffinity.leading,
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ), // Coloca o quadradinho ANTES do texto
                    contentPadding: EdgeInsets.zero, // Alinha perfeitamente com a borda dos TextFields
                    activeColor: Colors.blue, // Cor do fundo quando marcado
                    onChanged: (bool? novoValor) {
                      // Atualiza a tela com o novo estado (marcado ou desmarcado)
                      setState(() {
                        nenhum = novoValor ?? false;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Todos os moradores concordam com a adoção?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      RadioMenuButton(
                        value: 'Sim',
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
                        child: const Text('Sim'),
                      ),
                      const SizedBox(height: 6),
                      RadioMenuButton(
                        value: 'Não',
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
                        child: const Text('Não'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Quantas pessoas moram no local?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField(
                    value: _pessoasResidenciaqtd,
                    hint: const Text('Selecione uma opção'),
                    icon: const Icon(Icons.arrow_drop_down),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(value: '1 a 2 pessoas', child: Text('1 a 2 pessoas')),
                      DropdownMenuItem(value: '3 a 4 pessoas', child: Text('3 a 4 pessoas')),
                      DropdownMenuItem(value: '5 a 6 pessoas', child: Text('5 a 6 pessoas')),
                      DropdownMenuItem(value: 'mais de 6 pessoas', child: Text('mais de 6 pessoas')),
                    ],
                    onChanged: (String? novoValor) {
                      setState(() {
                        _pessoasResidenciaqtd = novoValor;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, selecione uma opção';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Há crianças na residência?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      RadioMenuButton(
                        value: 'Sim',
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
                        child: const Text('Sim'),
                      ),
                      const SizedBox(height: 6),
                      RadioMenuButton(
                        value: 'Não',
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
                        child: const Text('Não'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Você possui outros animais?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      RadioMenuButton(
                        value: 'Sim',
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
                        child: const Text('Sim'),
                      ),
                      const SizedBox(height: 6),
                      RadioMenuButton(
                        value: 'Não',
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
                        child: const Text('Não'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Quais animais e quantos?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Ex: 1 gato e 2 cachorros',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) return 'Este campo precisa ser preenchido.';
                      return null;
                    }, 
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Eles estão devidamente vacinados?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      RadioMenuButton(
                        value: 'Sim',
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
                        child: const Text('Sim'),
                      ),
                      const SizedBox(height: 6),
                      RadioMenuButton(
                        value: 'Não',
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
                        child: const Text('Não'),
                      ),
                      const SizedBox(height: 6),
                      RadioMenuButton(
                        value: 'Parcilmente',
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
                        child: const Text('Parcilmente'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Por quanto tempo o animal ficara sozinho?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField(
                    value: _tempoAnimal,
                    hint: const Text('Selecione uma opção'),
                    icon: const Icon(Icons.arrow_drop_down),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'Somente pela manhã', child: Text('Somente pela manhã')),
                      DropdownMenuItem(value: 'Somente pela tarde', child: Text('Somente pela tarde')),
                      DropdownMenuItem(value: 'Somente pela noite', child: Text('Somente pela noite')),
                      DropdownMenuItem(value: 'Quase o dia todo', child: Text('Quase o dia todo')),
                      DropdownMenuItem(value: 'Quase nenhum momento', child: Text('Quase nenhum momento')),
                    ],
                    onChanged: (String? novoValor) {
                      setState(() {
                        _tempoAnimal = novoValor;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, selecione uma opção';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Onde ele ficará na maior parte do tempo?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      RadioMenuButton(
                        value: 'Dentro de casa',
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
                        child: const Text('Dentro de casa'),
                      ),
                      const SizedBox(height: 6),
                      RadioMenuButton(
                        value: 'Àrea externa',
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
                        child: const Text('Àrea externa'),
                      ),
                      const SizedBox(height: 6),
                      RadioMenuButton(
                        value: 'Nos dois ambientes',
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
                        child: const Text('Nos dois ambientes'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Você é capaz de oferecer?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  CheckboxListTile(
                    title: const Text(
                      'Alimentação adequada',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: telaProtecao,
                    controlAffinity: ListTileControlAffinity.leading,
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ), // Coloca o quadradinho ANTES do texto
                    contentPadding: EdgeInsets.zero, // Alinha perfeitamente com a borda dos TextFields
                    activeColor: Colors.blue, // Cor do fundo quando marcado
                    onChanged: (bool? novoValor) {
                      // Atualiza a tela com o novo estado (marcado ou desmarcado)
                      setState(() {
                        telaProtecao = novoValor ?? false;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  CheckboxListTile(
                    title: const Text(
                      'Vacinação e atendimento veterinário',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: muroPortao,
                    controlAffinity: ListTileControlAffinity.leading,
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ), // Coloca o quadradinho ANTES do texto
                    contentPadding: EdgeInsets.zero, // Alinha perfeitamente com a borda dos TextFields
                    activeColor: Colors.blue, // Cor do fundo quando marcado
                    onChanged: (bool? novoValor) {
                      // Atualiza a tela com o novo estado (marcado ou desmarcado)
                      setState(() {
                        muroPortao = novoValor ?? false;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  CheckboxListTile(
                    title: const Text(
                      'Castração, caso seja necessário',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: externoProtegido,
                    controlAffinity: ListTileControlAffinity.leading,
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ), // Coloca o quadradinho ANTES do texto
                    contentPadding: EdgeInsets.zero, // Alinha perfeitamente com a borda dos TextFields
                    activeColor: Colors.blue, // Cor do fundo quando marcado
                    onChanged: (bool? novoValor) {
                      // Atualiza a tela com o novo estado (marcado ou desmarcado)
                      setState(() {
                        externoProtegido = novoValor ?? false;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  CheckboxListTile(
                    title: const Text(
                      'Passeios e atividades',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: nenhum,
                    controlAffinity: ListTileControlAffinity.leading,
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ), // Coloca o quadradinho ANTES do texto
                    contentPadding: EdgeInsets.zero, // Alinha perfeitamente com a borda dos TextFields
                    activeColor: Colors.blue, // Cor do fundo quando marcado
                    onChanged: (bool? novoValor) {
                      // Atualiza a tela com o novo estado (marcado ou desmarcado)
                      setState(() {
                        nenhum = novoValor ?? false;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  CheckboxListTile(
                    title: const Text(
                      'Ambiente seguro',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: nenhum,
                    controlAffinity: ListTileControlAffinity.leading,
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ), // Coloca o quadradinho ANTES do texto
                    contentPadding: EdgeInsets.zero, // Alinha perfeitamente com a borda dos TextFields
                    activeColor: Colors.blue, // Cor do fundo quando marcado
                    onChanged: (bool? novoValor) {
                      // Atualiza a tela com o novo estado (marcado ou desmarcado)
                      setState(() {
                        nenhum = novoValor ?? false;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Já cuidou ou teve algum animal adotado antes?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      RadioMenuButton(
                        value: 'Sim',
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
                        child: const Text('Sim'),
                      ),
                      const SizedBox(height: 6),
                      RadioMenuButton(
                        value: 'Não',
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
                        child: const Text('Não'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Porque deseja adotar o animal?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _observacoesController,
                    keyboardType: TextInputType.multiline, // Habilita a tecla "Enter" no teclado nativo
                    minLines: 3, // Altura inicial do campo (equivalente a 3 linhas de texto)
                    maxLines: 6, // Limite de expansão visual do campo antes de ativar o scroll interno
                    decoration: const InputDecoration(
                      hintText: 'Conte como ele fará parte da sua familia e rotina',
                      alignLabelWithHint: true, // Garante que a label comece no topo do campo, e não no meio
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, preencha este campo';
                      }
                      return null;
                    },
                  )


                ],
              )
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
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
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}