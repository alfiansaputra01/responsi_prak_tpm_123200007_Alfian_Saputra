import 'package:flutter/material.dart';
import 'api_data_source.dart';
import 'list_news_model.dart';

class TerbaruPage extends StatefulWidget {
  const TerbaruPage({Key? key}) : super(key: key);

  @override
  State<TerbaruPage> createState() => _TerbaruPageState();
}

class _TerbaruPageState extends State<TerbaruPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REPUBLIKA TERBARU"),
      ),
      body: _buildTerbaruBody(),
    );
  }

  Widget _buildTerbaruBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instace.loadBerita(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            Data listNews = Data.fromJson(snapshot.data);
            return _buildSuccessSection(listNews as ListNewsModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(ListNewsModel data) {
    return ListView.builder(
      itemCount: news.posts!.length,
      itemBuilder: (context, index) {
        return _buildItemNews(news.posts![index]);
      },
    );
  }

  // Widget _buildItemUsers(Data userData) {
  //   return InkWell(
  //     onTap: () => Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => DetailUsers(idUser: userData.id!,))
  //     ),
  //     child: Card(
  //       child: Row(
  //         children: [
  //           Container(
  //             width: 150,
  //             child: Image.network(userData.avatar!),
  //           ),
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(userData.firstName! + " " + userData.lastName!),
  //               Text(userData.email!)
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}