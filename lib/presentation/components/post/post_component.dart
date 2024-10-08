import 'package:flutter/material.dart';
import 'package:link_up/controllers/api_controller.dart';
import 'package:link_up/utils/theme/link_up_colors.dart';

class PostComponent extends StatelessWidget {
  PostComponent(
      {super.key,
      required this.description,
      required this.img,
      required this.userSurname});
  String img;
  String description;
  String userSurname;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: ApiController().getUser(userSurname),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text('Carregado...'),
                );
              case ConnectionState.waiting:
                return Center(
                  child: Text('Carregado...'),
                );
              case ConnectionState.active:
                return Center(
                  child: Text('Erro ao carregar os dados'),
                );
              case ConnectionState.done:
                return Container(
                  decoration: BoxDecoration(
                    color: LinkUpColors().AppBarBackGround,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8,16,8,16),
                        child: Row(
                          children: [
                            ClipOval(
                              child: Image.network(
                                snapshot.data!.userImg,
                                width: 30,
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,0,0,0),
                              child: Text(snapshot.data!.name),
                            )
                          ],
                        ),
                      ),
                      Image.network(img),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8,16,8,16),
                        child: Text(description),
                      )
                    ],
                  ),
                );
            }
          },
        ));
  }
}
