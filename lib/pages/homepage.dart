import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:vimarsh/models/data.dart';
import 'package:vimarsh/services/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final response = await Api.getData();
    if (response != null) data = response;
    setState(() {
      isLoading = false;
    });
  }

  DateTime? selectedDate;
  List<Data> data = [];
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Vimarsh",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(5),
          child: Center(
            child: Image.asset(
              "assets/logo.png",
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple,
                Colors.deepPurple,
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Select a date:"),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: selectedDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (date != null && date != selectedDate) {
                    selectedDate = date;
                    setState(() {
                      isLoading = true;
                    });
                    await Api.getData(month: selectedDate!.month, year: selectedDate!.year);
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                child: Text(
                  selectedDate == null ? "Select" : DateFormat('dd-MM-yyyy').format(selectedDate!),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          (isLoading)
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                        child: Lottie.asset("assets/drone.json", height: 100),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const CircularProgressIndicator(),
                    ],
                  ),
                )
              : (data.isEmpty)
                  ? const Center(
                      child: Text("No data Found"),
                    )
                  : Expanded(
                      child: Scrollbar(
                        interactive: true,
                        thickness: 8,
                        radius: const Radius.circular(10),
                        child: ListView.builder(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
                          itemCount: data.length,
                          itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 250, 245, 255),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    data[index].title ?? "",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: data[index].image ?? "",
                                      height: 200,
                                      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                                        child: CircularProgressIndicator(
                                          value: downloadProgress.progress,
                                        ),
                                      ),
                                      errorWidget: (context, url, error) => const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: "Description:",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: " ${data[index].description ?? '-'}",
                                      ),
                                    ],
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: "Latitude:",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: " ${data[index].latitude ?? '-'}",
                                      ),
                                    ],
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: "Longitude:",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: " ${data[index].longitude ?? '-'}",
                                      ),
                                    ],
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: "Date Reported:",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: " ${DateFormat('dd-MM-yyyy hh:mm:ss a').format(DateTime.parse(data[index].dateReported ?? ''))}",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
        ],
      ),
    );
  }
}
