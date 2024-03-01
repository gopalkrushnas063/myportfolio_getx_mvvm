import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myportfolio_getx_mvvm/viewmodel/about_view_model.dart';

class AboutView extends StatelessWidget {
  final AboutViewModel aboutViewModel = Get.put(AboutViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Me',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() {
          if (aboutViewModel.isLoading.value) {
            return const CircularProgressIndicator();
          } else {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'I am ${aboutViewModel.aboutModel.value.name}, ',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        aboutViewModel.aboutModel.value.position,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    aboutViewModel.aboutModel.value.about,
                    style: const TextStyle(fontSize: 12),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  Table(
                    border: TableBorder.all(color: Colors.grey),
                    columnWidths: {
                      0: const FlexColumnWidth(1),
                      1: const FlexColumnWidth(3),
                    },
                    children: [
                      _buildTableRow(
                          "Date of Birth", aboutViewModel.aboutModel.value.dob),
                      _buildTableRow(
                          "Age", aboutViewModel.aboutModel.value.age),
                      _buildTableRow(
                          "Website", aboutViewModel.aboutModel.value.webUrl),
                      _buildTableRow(
                          "Email", aboutViewModel.aboutModel.value.email),
                      _buildTableRow(
                          "Degree", aboutViewModel.aboutModel.value.degree),
                      _buildTableRow(
                          "Phone", aboutViewModel.aboutModel.value.phone),
                      _buildTableRow(
                          "Address", aboutViewModel.aboutModel.value.address),
                      _buildTableRow(
                          "GitHub", aboutViewModel.aboutModel.value.github),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Percentage Tech Stack:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: aboutViewModel
                        .aboutModel.value.percentageTechStack
                        .map((techStack) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${techStack['stack_name']} (${techStack['percentage']}%)',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                            LinearProgressIndicator(
                              value:
                                  double.parse(techStack['percentage']) / 100,
                              color: const Color.fromARGB(255, 199, 43, 32),
                              backgroundColor: Colors.grey[300],
                              minHeight: 10,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Education:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        aboutViewModel.aboutModel.value.education.map((edu) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  edu['degree'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  '(${edu['duration']})',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  edu['desc'],
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Experience:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        aboutViewModel.aboutModel.value.experience.map((exp) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  exp['designation'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  '(${exp['duration']})',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  exp['desc'],
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(value),
          ),
        ),
      ],
    );
  }
}
