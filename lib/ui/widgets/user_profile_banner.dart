import 'package:flutter/material.dart';
import '../../data/models/auth_utility.dart';
import '../screens/auth/login_screen.dart';
import '../screens/update_user_profile_screen.dart';
import '../style/style.dart';

class UserProfileBanner extends StatefulWidget {
  final bool? isUpdateProfileScreen;
  const UserProfileBanner({
    super.key, this.isUpdateProfileScreen,
  });

  @override
  State<UserProfileBanner> createState() => _UserProfileBannerState();
}

class _UserProfileBannerState extends State<UserProfileBanner> {

  @override

  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          if((widget.isUpdateProfileScreen ?? false) == false){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UpdateUserProfileScreen(),
              ),
            );
          }
        },
        child: ListTile(
          leading: Visibility(
            visible: (widget.isUpdateProfileScreen ?? false) == false,
            replacement: IconButton(
                //padding: EdgeInsets.only(top: 8),
                //constraints: BoxConstraints(),
              onPressed: (){
                Navigator.pop(context);
              },
                icon: const Icon(Icons.arrow_back_ios, color: colorWhite,)
            ),
            child: CircleAvatar(
              backgroundImage:
              AuthUtility.userInfo.data!.photo != "" ? NetworkImage("${AuthUtility.userInfo.data!.photo}") : const NetworkImage("https://flyjazz.ca/wp-content/uploads/2017/01/dummy-user-300x296.jpg.webp"),
              onBackgroundImageError: (_, __) {
                const Icon(Icons.image);
              },
            ),
          ),
          title: Text(
            '${AuthUtility.userInfo.data?.firstName ?? ''} ${AuthUtility.userInfo.data?.lastName ?? ''}',
            style: listTileTitle(colorWhite),
          ),
          subtitle: Text(
            AuthUtility.userInfo.data?.email ?? '',
            style: listTileSubTitle2(colorWhite),
          ),
          tileColor: Colors.green,
          trailing: IconButton(
            onPressed: () async {
              await AuthUtility.clearUserInfo();
              if (mounted) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (route) => false);
              }
            },
            icon: const Icon(
              Icons.logout_sharp,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
