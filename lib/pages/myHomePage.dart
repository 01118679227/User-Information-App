import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readfromjsonfile/provider/myHomePageProvider.dart';
class myHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Json Parsing Demo..'),
      ),
      // ignore: missing_required_param
      body: ChangeNotifierProvider<myHomePageProvider>(
        create: (context)=> myHomePageProvider(),
        child: Consumer<myHomePageProvider>(
          builder: (context,provider,child){
             if(provider.data == null){
               provider.getData(context);
               return Center(child: CircularProgressIndicator());
             }
             return SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: SingleChildScrollView(
                 child: DataTable(
                     columns: [
                       DataColumn(label: Text('Verified'),tooltip: 'represents if user is verified.'),
                       DataColumn(label: Text('First Name'),tooltip: 'represents first name of user.'),
                       DataColumn(label: Text('Last Name'),tooltip: 'represents last name of user.'),
                       DataColumn(label: Text('Email'),tooltip: 'represents email address of user.'),
                       DataColumn(label: Text('Phone'),tooltip: 'represents phone of user'),
                     ],
                     rows: provider.data.result.map((data) =>
                       DataRow(
                         cells: [
                           DataCell((data.verified) ? Icon(Icons.verified_user,color: Colors.green,):
                           Icon(Icons.cancel,color: Colors.red,),),
                           DataCell(Text(data.firstName)),
                           DataCell(Text(data.lastName)),
                           DataCell(Text(data.email)),
                           DataCell(Text(data.phone)),
                         ]
                       ),
                     ).toList(),
                 ),
               ),
             );
          },
        ),
      ),
    );
  }
}
