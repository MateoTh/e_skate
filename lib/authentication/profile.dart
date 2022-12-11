import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterfire_ui/auth.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const ProfileScreen(
      providerConfigs: [
        EmailProviderConfiguration(),
        GoogleProviderConfiguration(
          clientId: '...',
        ),
        FacebookProviderConfiguration(
          clientId: '...',
        ),
        AppleProviderConfiguration(),
      ],
      avatarSize: 24,
    );
    ;
  }
}
