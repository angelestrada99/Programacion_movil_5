import 'package:flutter/material.dart';
import 'package:flutter_1/database/database_helper.dart';
import 'package:flutter_1/models/post_model.dart';
import 'package:flutter_1/provider/flags_provider.dart';
import 'package:provider/provider.dart';

class ItemPostWidget extends StatelessWidget {
  ItemPostWidget({super.key, this.objPostModel});

  PostModel? objPostModel;

  DatabaseHelper database = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    final avatar = CircleAvatar(
      backgroundImage: AssetImage('assets/Me2.jpg'),
    );

    final txtUser = Text('  Ricardo Estrada  ');
    final datePost = Text('  07-mrz-23');
    final imgPost = Image(
      image: AssetImage(
        'assets/conquist.png',
      ),
      height: 100,
    );
    final txtDesc = Text('Descripcion de la publicacion del post');
    final iconRate = Icon(Icons.rate_review);

    FlagsProvider flag = Provider.of<FlagsProvider>(context);

    return Container(
      margin: const EdgeInsets.all(10),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            children: [avatar, txtUser, datePost],
          ),
          Row(
            children: [imgPost, txtDesc],
          ),
          Row(
            children: [
              iconRate,
              Expanded(child: Container()),
              IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Confirmar Borrado'),
                        content: const Text('Deseas borrar el post?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                database
                                    .DELETE('tblPost', objPostModel!.idPost!)
                                    .then((value) => flag.setflagListPost());
                                Navigator.pop(context);
                              },
                              child: const Text('Si')),
                          TextButton(onPressed: () {}, child: const Text('No'))
                        ],
                      ),
                    );
                  },
                  icon: Icon(Icons.delete))
            ],
          )
        ],
      ),
    );
  }
}
