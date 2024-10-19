import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:services/helper/constants.dart';

class Service_Provider extends StatefulWidget {
  const Service_Provider(
      {super.key, required this.name});

  final String name;

  @override
  State<Service_Provider> createState() => _Service_ProviderState();
}

class _Service_ProviderState extends State<Service_Provider> {
  final List<String> imageUrls = [
    "https://statusneo.com/wp-content/uploads/2023/02/MicrosoftTeams-image551ad57e01403f080a9df51975ac40b6efba82553c323a742b42b1c71c1e45f1.jpg",
    "https://statusneo.com/wp-content/uploads/2023/02/MicrosoftTeams-image551ad57e01403f080a9df51975ac40b6efba82553c323a742b42b1c71c1e45f1.jpg",
    "https://statusneo.com/wp-content/uploads/2023/02/MicrosoftTeams-image551ad57e01403f080a9df51975ac40b6efba82553c323a742b42b1c71c1e45f1.jpg"
  ];
  bool isConnected = true;

  @override
  void initState() {
    super.initState();
    checkConnectivity();
  }

  Future<void> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      isConnected = connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  backgroundColor: Colors.white,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://static8.depositphotos.com/1003938/973/v/950/depositphotos_9732802-stock-illustration-funny-cartoon-office-worker.jpg'),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name: ${widget.name}",
                    style: const TextStyle(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Text(
                    "Country: ",
                    style: TextStyle(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Text(
                    "Evaluation: ",
                    style: TextStyle(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        toolbarHeight: 100, // Adjust the AppBar height
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 4,
                margin: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Info:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'John Doe is a seasoned software engineer with 10 years of experience in mobile app development. He specializes in Flutter, Dart, and native Android development.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                margin: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Comments:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemBuilder: (c, i) => ListTile(
                            title: Text(
                              "Date: 2024/9/${i + 1}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // leading: Icon(Icons.account_circle_outlined),
                            subtitle: Text(
                                "datadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata"),
                            trailing: Column(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellowAccent,
                                ),
                                Text("5.0")
                              ],
                            ),
                          ),
                          itemCount: 5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                margin: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Working days:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 36,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.grey[300],
                                border:
                                    Border.all(color: Colors.green, width: 2)),
                            child: Center(child: Text("sa")),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 36,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.grey[300],
                            ),
                            child: Center(child: Text("Su")),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 36,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.grey[300],
                              border: Border.all(color: Colors.green, width: 2),
                            ),
                            child: const Center(child: Text("Mo")),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 36,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.grey[300],
                            ),
                            child: const Center(child: Text("Tu")),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 36,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.grey[300],
                              border: Border.all(color: Colors.green, width: 2),
                            ),
                            child: const Center(child: Text("We")),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 36,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.grey[300],
                            ),
                            child: const Center(child: Text("Th")),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 36,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.grey[300],
                            ),
                            child: const Center(child: Text("Fr")),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                margin: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'working hours:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "From: ",
                            style: TextStyle(
                              //fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("09:00"),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "TO: ",
                            style: TextStyle(
                              //fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("21:00"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                margin: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Price:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            textDirection: TextDirection.rtl,
                            "100 دينار للدرس",
                            style: TextStyle(
                              //fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                margin: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Previous works:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: imageUrls.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  _showImageDialog(context, imageUrls[index]);
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: isConnected
                                      ? Image.network(
                                          imageUrls[index],
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                          loadingBuilder:
                                              (context, child, progress) {
                                            if (progress == null) return child;
                                            return Container(
                                              width: 100,
                                              height: 100,
                                              child: Center(
                                                child: Text("Waiting..."),
                                              ),
                                            );
                                          },
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                              'assets/images/offline_image.png',
                                              // Replace with your offline image path
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        )
                                      : Image.asset(
                                          'images/img_1.png',
                                          // Replace with your offline image path
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.green[300],
          borderRadius: BorderRadius.circular(
            12.0,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: TextButton(
          onPressed: () {
           // navigateTo(context, Reservepage());
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Reserve",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                width: 6,
              ),
              Icon(
                Icons.home_repair_service,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  color: Colors.white,
                  alignment: AlignmentDirectional.center,
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
