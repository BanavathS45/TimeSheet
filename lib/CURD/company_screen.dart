import 'package:flutter/material.dart';
import 'package:flutter_basic_app/CURD/company_model.dart';
import 'package:flutter_basic_app/CURD/compnay_services.dart';
import 'package:flutter_basic_app/CURD/createCompany.dart';

class CompanyScreen extends StatefulWidget {
  dynamic _selectedCompany;
  CompanyScreen({super.key});

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

// Company neCompnay = Company();

class _CompanyScreenState extends State<CompanyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => CreateCompany()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Company"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: CompanyService().getAllCompanies(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error receiving data from server"),
              );
            }

            if (snapshot.hasData) {
              List<Company> data = snapshot.data as List<Company>;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Material(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(),
                          // color: Colors.red,
                          // height: MediaQuery.of(context).size.height * 0.15,
                          width: double.maxFinite,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 15),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(data[index]
                                              .companyLogo ??
                                          "https://logo.clearbit.com/google.ru"),
                                    )),
                                Expanded(
                                    flex: 4,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(data[index].companyName ??
                                            "Company Name Unavailable"),
                                        Text(data[index].companyNumber ??
                                            "No Number"),
                                        Text(data[index].companyAddress ??
                                            "No address"),
                                      ],
                                    )),
                                Expanded(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          CreateCompany(
                                                            company:
                                                                data[index],
                                                          )));
                                              setState(() {});
                                            },
                                            icon: Icon(
                                              Icons.edit,
                                              color: Colors.blue,
                                            )),
                                        IconButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          "Are you sure want to deelet Company?"),
                                                      actions: [
                                                        ElevatedButton(
                                                            onPressed:
                                                                () async {
                                                              setState(() {
                                                                Navigator.pop(
                                                                    context);
                                                              });
                                                              await CompanyService()
                                                                  .deleteCompany(
                                                                      data[index]
                                                                          .id!);
                                                            },
                                                            child: Text("Yes")),
                                                        ElevatedButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                Navigator.pop(
                                                                    context);
                                                              });
                                                            },
                                                            child: Text("NO")),
                                                      ],
                                                    );
                                                  });
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            )),
                                        IconButton(
                                            onPressed: () async {
                                              setState(() async {
                                                await CompanyService()
                                                    .updateCompanyPartially(
                                                        {'name': data[index]},
                                                        data[index].id!);
                                              });
                                            },
                                            icon: Icon(Icons.favorite_outline))
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
