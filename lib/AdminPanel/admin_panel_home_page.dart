import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/Global_Variables/Screen Util Size.dart';
import '../Constants/Global_Widgets/Appbar/appbar_with_action.dart';
import '../Screens/home_page.dart';
import '../StageManagementClass/provider_state_management.dart';
import 'package:provider/provider.dart';

import '../StageManagementClass/provider_state_management.dart';
import '../StageManagementClass/provider_state_management.dart';

import 'all_user_view.dart';

class AdminPanelHome extends StatefulWidget {
  const AdminPanelHome({super.key});

  @override
  State<AdminPanelHome> createState() => _AdminPanelHomeState();
}

class _AdminPanelHomeState extends State<AdminPanelHome> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<firebaseConfigrations>(context, listen: false)
          .getUserCounts();
    });
  }

  Future<void> getUserCount() async {
    Provider.of<firebaseConfigrations>(context, listen: false).getUserCounts();
  }

  @override
  Widget build(BuildContext context) {
    final firebaseConfigrationInside =
        Provider.of<firebaseConfigrations>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppbarWithAction(
        appbarText: 'TC Admin Panel',
        appbarIcon: Icons.home_filled,
        appbarIconOnPress: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        },
        centerTitle: true,
      ),
      body: firebaseConfigrationInside.isloadUserCount
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: themeProvider.themeMode.name == 'Light'
                              ? Colors.blue
                              : Colors.white10,
                          width: 0.4),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      tileColor: themeProvider.themeMode.name == 'Light'
                          ? Colors.white
                          : Colors.white10,
                      contentPadding: const EdgeInsets.all(8.0),
                      leading: const CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        'Total User',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(firebaseConfigrationInside.userCountg),
                      ),
                      onLongPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserDataScreen(0)));
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    crossAxisCount: 2,
                    children: <Widget>[
                      BoxContainer(
                        icon: Icon(Icons.swipe_up),
                        title: 'Latest 20',
                        subTitle:
                            firebaseConfigrationInside.todayJointedUserCountg,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserDataScreen(1)));
                        },
                        isLoading: firebaseConfigrationInside
                            .todayJointedUserCountg.isEmpty,
                      ),
                      BoxContainer(
                        icon: Icon(Icons.person),
                        title: 'Today`s Joiners',
                        subTitle:
                            firebaseConfigrationInside.todayJointedUserCountg,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserDataScreen(2)));
                        },
                        isLoading: firebaseConfigrationInside
                            .todayJointedUserCountg.isEmpty,
                      ),
                      BoxContainer(
                        icon: Icon(Icons.open_in_browser),
                        title: 'Today`s App Opened',
                        subTitle:
                            firebaseConfigrationInside.appOpenedTodayCountg,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserDataScreen(3)));
                        },
                        isLoading: firebaseConfigrationInside
                            .appOpenedTodayCountg.isEmpty,
                      ),
                      BoxContainer(
                        icon: Icon(Icons.dark_mode),
                        title: 'Dark Mode User',
                        subTitle: firebaseConfigrationInside.darkModeUserCountg,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserDataScreen(4)));
                        },
                        isLoading: firebaseConfigrationInside
                            .darkModeUserCountg.isEmpty,
                      ),
                      BoxContainer(
                          icon: Icon(Icons.add),
                          title: 'Add Fields',
                          onTap: () {},
                          isLoading: false),
                      BoxContainer(
                          icon: Icon(Icons.remove),
                          title: 'Remove Fields',
                          onTap: () {},
                          isLoading: false),
                    ],
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        enableFeedback: true,
        onPressed: () async {
          await getUserCount();
        },
        child: Icon(Icons.refresh),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}

class BoxContainer extends StatelessWidget {
  final Icon icon;
  final String title;
  final String? subTitle;
  final VoidCallback onTap;
  final bool isLoading;
  const BoxContainer(
      {super.key,
      required this.icon,
      required this.title,
      this.subTitle,
      required this.onTap,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Ink(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          color: themeProvider.themeMode.name == 'Light'
              ? Colors.white10
              : Colors.white10,
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          // splashColor: Colors.blueAccent,
          onTap: onTap,
          child: Center(
            child: isLoading
                ? CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(backgroundColor: Colors.blue, child: icon),
                      SizedBox(
                        height: SUheight30h,
                      ),
                      Text(title),
                      SizedBox(
                        height: SUheight50h,
                      ),
                      if (subTitle != null)
                        Text(
                          subTitle!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: text70sp),
                        ),
                    ],
                  ),
          ),
        ));
  }
}
