import 'package:flutter/material.dart';

// state 상위로 올리기 예제
// 참고: https://medium.com/nerd-for-tech/lifting-state-up-and-callbacks-7a19d0bdbe53

class MyIconButton extends StatelessWidget {
  var setData;

  MyIconButton({super.key, this.setData});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        tooltip: 'Choose location',
        onPressed: () async {
          // change-location에서 pop 함수와 같이 전달된 데이터가 아래로 온다.
          var res = await Navigator.pushNamed(context, '/change-location');
          if (res != null) {
            setData(res);
          }
        },
        icon: const Icon(Icons.edit_location));
  }
}
