import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final List<Color> _colors=[
    Color(0xffdd2323),
    Color(0xffd2d223),
    Color(0xff14d263),
    Color(0xf3d3566b),
    Color(0xfa205606),
    Color(0xf1e65fa9),
  ];
  final _containerHeight=700.0;
  final ScrollController _scrollController=ScrollController();
  int _currentScrollIndex=0;
  @override
  void initState() {
    super.initState();
_scrollController.addListener(_updateScrollIndicator);
  }
  void _updateScrollIndicator(){
    setState(() {
      _currentScrollIndex=_scrollController.offset ~/ _containerHeight;
    });
  }
  void _onNumberTap(int index){
    _scrollController.animateTo(index*_containerHeight,
        duration : Duration(
      milliseconds: 300
    ), curve: Curves.easeIn);
    setState(() {
      _currentScrollIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 90,
              width: double.maxFinite,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _colors.length,
                  itemBuilder: (_,index){
                    return InkWell(
                      onTap: (){
                        _onNumberTap(index);
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.all(16),
                        alignment: Alignment.center,
                        decoration: index==_currentScrollIndex?BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey,width: 2
                            )
                          )
                        ):null,
                            child: Text('${index+1}',
                            style: TextStyle(
                              fontSize: 30
                            ),),
                      ),
                    );
                  }),
            ),
            Expanded(child: ListView.builder(
              itemCount: _colors.length,
                controller: _scrollController,
                itemBuilder: (BuildContext context, int index){
              return Container(
                height: _containerHeight,
                color: _colors[index],
                alignment: Alignment.center,
                child: Text('${index+1}',
                style: TextStyle(
                  fontSize: 100,
                  color: Colors.black
                ),),
              );
            }))
          ],
        ),
    );
  }
}
