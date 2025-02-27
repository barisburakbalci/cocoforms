import 'package:cached_network_image/cached_network_image.dart';
import 'package:cocoforms/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AuthService>(context, listen: false).user;

    if (user != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: user.photoURL,
            imageBuilder: (context, imageProvider) => CircleAvatar(
              backgroundColor: Colors.amber,
              backgroundImage: imageProvider,
              radius: 50.0,
            ),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Text(user.displayName),
          Text(user.email),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await Provider.of<AuthService>(context, listen: false).signOut();
              if (context.mounted) {
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
          )
        ],
      );
    }

    return const Text('Yetkisiz kullanıcı');
  }
}
