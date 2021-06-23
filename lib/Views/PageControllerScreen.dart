import 'package:flutter/material.dart';
import 'package:kaplas_intern_project/Modals/NewsInfoModal.dart';
import 'package:kaplas_intern_project/Services/NewsApiCall.dart';

class PageControllerScreen extends StatefulWidget {

  @override
  _PageControllerScreenState createState() => _PageControllerScreenState();
}

class _PageControllerScreenState extends State<PageControllerScreen> {
  int _currentPage = 0;
  PageController _controller = PageController(initialPage: 0);

  late Future<NewsModel> _newsModel;


  @override
  void initState() {
    // TODO: implement initState
    _newsModel = apiCall().getNews();
    print('api called');
    print(_newsModel);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade200,
              child: FutureBuilder<NewsModel>(
                future: _newsModel,
                  builder: (context,snapshot){
                  if(snapshot.hasData)
                    {
                      print(snapshot.data!.data.length);

                      return ListView.builder(
                          itemCount: snapshot.data!.data.length,
                          itemBuilder: (context,index){

                            var data = snapshot.data!.data[index];

                            return NewsTile(
                                data.title,
                                data.summary,
                                data.published);
                          });
                    }
                  else
                    {
                      return Center(child: CircularProgressIndicator());
                    }

                  }
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              _currentPage = 0;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 20,right: 30,left: 30,bottom: 20),
                            decoration: BoxDecoration(
                              color: _currentPage == 0 ? Colors.blue : Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.menu_rounded,
                                  color: _currentPage == 0 ? Colors.white : Colors.black,
                                  size: 34,),
                                SizedBox(width: 20,),
                                Text('News',style: TextStyle(
                                    color: _currentPage == 0 ? Colors.white : Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold ),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              _currentPage = 1;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 20,right: 30,left: 30,bottom: 20),
                            decoration: BoxDecoration(
                              color: _currentPage == 1 ? Colors.blue : Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: _currentPage != 1 ? Colors.red.shade500 : Colors.white,
                                  size: 34,),
                                SizedBox(width: 20,),
                                Text('Favs',style: TextStyle(
                                    color: _currentPage == 1 ? Colors.white : Colors.black,
                                    fontSize: 22,fontWeight: FontWeight.bold ),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget NewsTile(String title,String des,String stamp){
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(left: 15,right: 15,top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.favorite,color: Colors.red.shade500,size: 40,)
          ),
          Expanded(
            child: Container(
                child: Column(
                  children: [
                    Container(
                        child: Text(
                          '${title}',
                          maxLines: 3,
                          style: TextStyle(fontWeight: FontWeight.bold,),
                          overflow: TextOverflow.ellipsis,
                        )),
                    SizedBox(height: 20,),
                    Container(
                        child: Text(
                          '${des}',
                          maxLines: 2,
                          style: TextStyle(fontWeight: FontWeight.w400,),
                          overflow: TextOverflow.ellipsis,
                        )
                    ),
                    SizedBox(height: 20,),
                    Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${stamp}',
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.w400,),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

}
