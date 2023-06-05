import 'package:flutter/material.dart';
import 'package:lddmexerciciocerto/TelaCadastro.dart';
import 'package:lddmexerciciocerto/TelaLogin.dart';
import 'TelaLista.dart';
class PaginaInicial extends StatefulWidget {
  const PaginaInicial({Key? key}) : super(key: key);

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina){
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        onPageChanged: setPaginaAtual,
        children:  const [
          TelaLogin(),
          TelaCadastro(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: paginaAtual,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.login), label: "Entrar"),
            BottomNavigationBarItem(
                icon: Icon(Icons.app_registration), label: "Cadastrar"),
          ],
          onTap: (pagina) {
            pc.animateToPage(
                pagina,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
            paginaAtual = pagina;
          }),
    );
  }
}
