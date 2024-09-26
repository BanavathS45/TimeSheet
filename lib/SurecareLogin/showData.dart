import 'package:flutter/material.dart';
import 'package:flutter_basic_app/SurecareLogin/BaseUrl.dart';

class PatientListScreen extends StatefulWidget {
  @override
  _PatientListScreenState createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  List patientData = [];

  @override
  void initState() {
    super.initState();
    fetchPatientData();
  }

  // Fetch patient data from the API
  void fetchPatientData() async {
    AllApiCalls apiCalls = AllApiCalls();
    List data = await apiCalls.signupPatient();
    setState(() {
      patientData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient List"),
      ),
      body: patientData.isEmpty
          ? Center(
              child:
                  CircularProgressIndicator()) // Show a loading indicator while data is being fetched
          : ListView.builder(
              itemCount: patientData.length,
              itemBuilder: (context, index) {
                var patient = patientData[index];
                return ListTile(
                  title: Text(patient['Name'] ?? 'No Name'),
                  subtitle: Text(patient['Email'] ?? 'No Email'),
                  leading: Icon(Icons.person),
                );
              },
            ),
    );
  }
}
