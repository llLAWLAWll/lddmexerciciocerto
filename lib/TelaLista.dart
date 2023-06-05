import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TelaLista extends StatefulWidget {
  const TelaLista(text, {Key? key}) : super(key: key);

  @override
  State<TelaLista> createState() => _TelaListaState();
}

class _TelaListaState extends State<TelaLista> {

  final List<String> itemList = List.generate(20, (index) => 'Item ${index + 1}');
  void sairDoApp() {
    SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem Vindo"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: sairDoApp,
            tooltip: 'Sair',
          ),
        ],// Ícone de sair
        ),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(itemList[index]),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Alerta ${index + 1}'),
                    content: Text('Você clicou no item ${index + 1} da lista'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Sim'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Não'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
      );

  }
}
