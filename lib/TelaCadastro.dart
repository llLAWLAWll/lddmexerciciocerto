import 'package:flutter/material.dart';
import 'package:lddmexerciciocerto/PaginaInicial.dart';
import 'package:lddmexerciciocerto/TelaLogin.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({Key? key}) : super(key: key);

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  bool mostrarSenha = false;
  String genero = '';
  bool email = false;
  bool celular = false;
  late double _valor = 20;
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        centerTitle: true,
      ),
      body: Center(
        child: Align(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: SizedBox(
              width: 320,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Nome',
                        labelStyle: TextStyle(
                            color: Colors.deepPurpleAccent, fontSize: _valor)),
                    style: const TextStyle(
                      color: Colors.green,
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'E-mail',
                        labelStyle: TextStyle(
                            color: Colors.deepPurpleAccent, fontSize: _valor)),
                    style: const TextStyle(
                      color: Colors.green,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(
                            color: Colors.deepPurpleAccent, fontSize: _valor),
                        suffixIcon: GestureDetector(
                          child: Icon(
                            mostrarSenha == false
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.deepPurpleAccent,
                          ),
                          onTap: () {
                            setState(() {
                              mostrarSenha = !mostrarSenha;
                            });
                          },
                        ),
                      ),
                      obscureText: mostrarSenha == false ? true : false,
                      style: const TextStyle(
                        color: Colors.green,
                      ),
                      maxLength: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Data de Nascimento',
                        labelStyle: TextStyle(color: Colors.deepPurpleAccent)),
                    style: TextStyle(color: Colors.green, fontSize: _valor),
                    keyboardType: TextInputType.datetime,
                    maxLength: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(child: Text("Genêro")),
                      Flexible(
                        child: RadioListTile(
                          title: Text('M'),
                          value: 'M',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value as String?;
                            });
                          },
                        ),
                      ),
                      Flexible(
                        child: RadioListTile(
                          title: Text('F'),
                          value: 'F',
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value as String?;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Notificações',
                    style: TextStyle(fontSize: _valor),
                  ),
                  const SizedBox(height: 10),
                  SwitchListTile(
                    activeColor: Colors.deepPurpleAccent,
                    title: Text("E-mail", style: TextStyle(fontSize: _valor)),
                    value: email,
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  SwitchListTile(
                    activeColor: Colors.deepPurpleAccent,
                    title: Text("Celular", style: TextStyle(fontSize: _valor)),
                    value: celular,
                    onChanged: (value) {
                      setState(() {
                        celular = value;
                      });
                    },
                  ),
                  Slider(
                    value: _valor,
                    min: 10,
                    max: 30,
                    label: "Tamanho do Texto",
                    divisions: 5,
                    onChanged: (value) {
                      setState(() {
                        _valor = value;
                      });
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => PaginaInicial()));
                    },
                    child:
                        Text('Cadastrar', style: TextStyle(fontSize: _valor)),
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
