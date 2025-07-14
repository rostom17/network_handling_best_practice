import 'package:flutter/material.dart';
import 'package:network_handling_best_practice/core/network/client/network_client.dart';
import 'package:network_handling_best_practice/core/network/client/network_client_factory.dart';
import 'package:network_handling_best_practice/core/network/models/network_request_model.dart';
import 'package:network_handling_best_practice/features/users/data/models/user_model.dart';
import 'package:network_handling_best_practice/features/users/domain/entities/user_entity.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFetching = false;
  List<UserModel> userList = [];
  String? errorMessage;

  Future<void> fetchData() async {
    setState(() {
      isFetching = true;
    });

    final newtworkClient = NetworkClientFactory.create();

    final result = await newtworkClient.request(
      NetworkRequestModel(path: "/users"),
      method: HttpMethod.get,
      parser: (data) => (data['users'] as List)
          .map((item) => UserModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );

    result.when(
      success: (users) {
        setState(() {
          userList = users;
        });
      },
      failure: (e) => setState(() {
        errorMessage = e.message;
      }),
    );

    setState(() {
      isFetching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isFetching
            ? LinearProgressIndicator()
            : errorMessage != null
            ? Text(errorMessage!)
            : ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  UserModel user = userList[index];
                  return Container(
                    height: 100,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(8),
                    child: Text(user.firstName ?? "Unknown"),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchData,
        child: Icon(Icons.check),
      ),
    );
  }
}
