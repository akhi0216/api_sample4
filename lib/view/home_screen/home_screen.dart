import 'package:api_sample4/controller/homescreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    await Provider.of<HomeScreencontroller>(context, listen: false).fetchData();
  }

  deleteData(int id) async {
    await Provider.of<HomeScreencontroller>(context, listen: false)
        .deleteData(id);
    // to refetch
    await fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final homescreenstate = Provider.of<HomeScreencontroller>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: homescreenstate.resModel?.data?.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text(homescreenstate.resModel?.data?[index].name ?? ""),
              IconButton(
                  onPressed: () {
                    deleteData(homescreenstate.resModel?.data?[index].id ?? -1);
                    setState(() {});
                  },
                  icon: Icon(Icons.delete))
            ],
          ),
        ),
      ),
    );
  }
}
