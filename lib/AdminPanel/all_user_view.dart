import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../StageManagementClass/provider_state_management.dart';
import 'UserModel.dart';

class UserDataScreen extends StatefulWidget {
  final int index;

  // Constructor with required positional parameter
  const UserDataScreen(this.index);

  @override
  _UserDataScreenState createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  TextEditingController searchController = TextEditingController();
  String searchText = '';

  fetchData() {
    if (widget.index == 0)
      Provider.of<firebaseConfigrations>(context, listen: false)
          .fetchAllUserData();

    if (widget.index == 1)
      Provider.of<firebaseConfigrations>(context, listen: false)
          .fetchLimitedUserData();

    if (widget.index == 2)
      Provider.of<firebaseConfigrations>(context, listen: false)
          .fetchTodayJoinnerUserData();

    if (widget.index == 3)
      Provider.of<firebaseConfigrations>(context, listen: false)
          .fetchTodayOPenedUserData();

    if (widget.index == 4)
      Provider.of<firebaseConfigrations>(context, listen: false)
          .fetchDarkModeUserData();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.index == 0)
        Provider.of<firebaseConfigrations>(context, listen: false)
            .fetchAllUserData();

      if (widget.index == 1)
        Provider.of<firebaseConfigrations>(context, listen: false)
            .fetchLimitedUserData();

      if (widget.index == 2)
        Provider.of<firebaseConfigrations>(context, listen: false)
            .fetchTodayJoinnerUserData();

      if (widget.index == 3)
        Provider.of<firebaseConfigrations>(context, listen: false)
            .fetchTodayOPenedUserData();

      if (widget.index == 4)
        Provider.of<firebaseConfigrations>(context, listen: false)
            .fetchDarkModeUserData();
    });

    super.initState();

    // Fetch user data when the widget initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
      ),
      body: Consumer<firebaseConfigrations>(
          builder: (context, firebaseConfigrationsInside, child) {
        return firebaseConfigrationsInside.isLoading
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () async {
                  // Fetch user data when the widget initializes
                  await fetchData();
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SearchBar(
                        leading: Icon(Icons.search),
                        trailing: <Widget>[
                          IconButton(
                            onPressed: () {
                              searchController.clear();
                              setState(() {
                                searchText = '';
                              });
                            },
                            icon: Icon(Icons.clear),
                          ),
                        ],
                        controller: searchController,
                        hintText: 'Search by name...',
                        onChanged: (value) {
                          setState(() {
                            searchText = value.toLowerCase();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: Consumer<firebaseConfigrations>(
                        builder: (context, provider, _) {
                          List<UserModel> users = provider.allUsers;
                          List<UserModel> filteredUsers = searchText.isEmpty
                              ? users
                              : users
                                  .where((user) => user.name
                                      .toLowerCase()
                                      .contains(searchText))
                                  .toList();

                          if (users.isEmpty) {
                            return Center(child: Text('No users found'));
                          }

                          return ListView.builder(
                            itemCount: filteredUsers.length,
                            itemBuilder: (context, index) {
                              UserModel user = filteredUsers[index];
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 5.0, right: 5.0),
                                child: Card(
                                  child: ExpansionTile(
                                    expandedAlignment: Alignment.centerLeft,
                                    maintainState: true,
                                    expandedCrossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    title: Text(
                                      user.name,
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    subtitle: Text(user.email),
                                    children: [
                                      const Divider(
                                        height: 20,
                                        thickness: 1,
                                        indent: 0,
                                        endIndent: 0,
                                        color: Colors.black,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text('Created At : ' +
                                            user.creationDate
                                                .toLocal()
                                                .toString()),
                                      ),
                                      Divider(
                                        height: 20,
                                        thickness: 1,
                                        indent: 8,
                                        endIndent: 0,
                                      ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(left: 8.0),
                                      //   child: Text("Phone No : " + user.phoneNumber),
                                      // ),
                                      // Divider(
                                      //   height: 20,
                                      //   thickness: 1,
                                      //   indent: 10,
                                      //   endIndent: 0,
                                      // ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text("Region Used : " +
                                            user.selectedRegion),
                                      ),
                                      Divider(
                                        height: 20,
                                        thickness: 1,
                                        indent: 10,
                                        endIndent: 0,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                            "Theme Mode : " + user.themeMode),
                                      ),
                                      Divider(
                                        height: 20,
                                        thickness: 1,
                                        indent: 10,
                                        endIndent: 0,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text("Last App Used : " +
                                            user.lastAppOpenDate
                                                .toLocal()
                                                .toString()),
                                      ),
                                      Divider(
                                        height: 20,
                                        thickness: 1,
                                        indent: 10,
                                        endIndent: 0,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text("App Opened : " +
                                            user.appOpenCount.toString()),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
