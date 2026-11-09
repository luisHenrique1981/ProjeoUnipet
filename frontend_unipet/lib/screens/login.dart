
import 'package:flutter/material.dart';
import 'package:frontend_unipet/screens/cadastro.dart';
import 'package:frontend_unipet/screens/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Formulário validado!'),
        ),
      );
      // Aqui você implementará a autenticação.
    }
  }
  
  Widget itemVisitante(String texto) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: Color(0xFF165823),
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              texto,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF333333),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5FA),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 400,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.stretch,
                  children: [
                    // Ícone superior
                  Center(
                    child: Image.asset(
                      'assets/img/logo_Unipet.png',
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),

                  const Text('Unipet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const Text(
                      'Bem-vindo!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF111827),
                      ),
                    ),

                    const Text(
                      'Entre na sua conta para continuar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF64748B),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Campo de e-mail
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

                    const SizedBox(height: 20),

                    // Campo de senha
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        prefixIcon:
                            const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword =
                                  !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe sua senha';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 12),

                    // Recuperação de senha
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor: WidgetStateProperty.resolveWith<Color>(
                            (states) {
                              if (states.contains(WidgetState.hovered)) {
                                return const Color(0xFFF58220);
                              }
                              return const Color(0xFF165823);
                            },
                          ),
                        ),
                        onPressed: () {
                          // Criar rota de recuperação.
                        },
                        child: const Text(
                          'Esqueceu sua senha?',
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Botão de login
                    SizedBox(
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                            ),
                          ),
                        },
                        child: const Text(
                          'Entrar',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Cadastro
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        const Text('Não tem uma conta?'),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor: WidgetStateProperty.resolveWith<Color>(
                              (states) {
                                if (states.contains(WidgetState.hovered)) {
                                  return const Color(0xFFF58220);
                                }
                                return const Color(0xFF165823);
                              },
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Cadastro(),
                              ),
                            );
                          },
                          child: const Text('Cadastre-se'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        const Text('Ou'),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor: WidgetStateProperty.resolveWith<Color>(
                              (states) {
                                if (states.contains(WidgetState.hovered)) {
                                  return const Color(0xFFF58220);
                                }
                                return const Color(0xFF165823);
                              },
                            ),
                          ),
                          onPressed: () {
                            // Criar rota de cadastro.
                          },
                          child: const Text('Entrar como visitante'),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        const Text('Ao acessar como visitante, você terá acesso limitado a algumas funcionalidades do aplicativo como:'),
                        const SizedBox(height: 16),

                        itemVisitante('Consultar animais cadastrados'),
                        itemVisitante('Acompanhar ocorrências públicas'),
                        itemVisitante('Ver campanhas e notícias'),
                        itemVisitante('Registrar uma ocorrência'),
                        itemVisitante('Consultar ocorrências'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
