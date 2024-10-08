import 'package:flutter/material.dart';

class ModalPostComponent extends StatelessWidget {
  const ModalPostComponent  ({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
                    title: Text('Este é um Modal'),
                    content: Text('Conteúdo do modal vai aqui.'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Fechar'),
                        onPressed: () {
                          Navigator.of(context).pop(); // Fecha o modal
                        },
                      ),
                    ],
                  );;
  }
}