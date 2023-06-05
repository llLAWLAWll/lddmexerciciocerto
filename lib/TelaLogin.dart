import 'package:flutter/material.dart';
import 'package:lddmexerciciocerto/PaginaInicial.dart';
import 'package:lddmexerciciocerto/TelaCadastro.dart';
import 'package:lddmexerciciocerto/TelaLista.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  bool _mostrarSenha = false;
  TextEditingController _controleCampoEmail = TextEditingController();
  TextEditingController _controleCampoSenha = TextEditingController();
  bool _Email = false;
  bool _Senha = false;
  String nome = 'Lucas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
        leading: Icon(Icons.login),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://img.freepik.com/fotos-gratis/fundo-organico-de-penas-brancas-de-close-up_23-2148872784.jpg?w=1060&t=st=1685921554~exp=1685922154~hmac=aa1e197eafe5572c7cbc3120581e933aa805bc16029216a688d62fb1ab449daa'),
                fit: BoxFit.cover)),
        child: Center(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _controleCampoEmail,
                    onChanged: (value) {
                      _Email = _controleCampoEmail.text == "lucas@gmail.com";
                    },
                    decoration: const InputDecoration(
                        labelText: 'E-mail:',
                        labelStyle: TextStyle(color: Colors.deepPurpleAccent)),
                    style: const TextStyle(color: Colors.green, fontSize: 18),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _controleCampoSenha,
                    onChanged: (value) {
                      _Senha = _controleCampoSenha.text == "1234";
                    },
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle:
                          const TextStyle(color: Colors.deepPurpleAccent),
                      suffixIcon: GestureDetector(
                        child: Icon(
                          _mostrarSenha == false
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.deepPurpleAccent,
                        ),
                        onTap: () {
                          setState(() {
                            _mostrarSenha = !_mostrarSenha;
                          });
                        },
                      ),
                    ),
                    obscureText: _mostrarSenha == false ? true : false,
                    style: const TextStyle(color: Colors.green),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Não possui uma conta:',
                          style: TextStyle(color: Colors.deepPurpleAccent)),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => TelaCadastro()),
                          );
                        },
                        child: Text(
                          'Criar Conta',
                          style: TextStyle(color: Colors.blue),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          elevation: 0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      if (_Email && _Senha) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TelaLista(_controleCampoEmail.text)),
                          (route) => false,
                        );
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Login Inválido!!'),
                                content: Text('Tente Novamente'),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Fechar'))
                                ],
                              );
                            });
                      }
                    },
                    child: Text('Entrar'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
