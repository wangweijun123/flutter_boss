import 'package:flutter/material.dart';
import '../model/Message.dart';

class MessageListItem extends StatefulWidget {

  final Message message;

  const MessageListItem({Key key, this.message}) : super(key: key);

  @override
  _MessageListItemState createState() {
    return new _MessageListItemState();
  }
}

class _MessageListItemState extends State<MessageListItem> {

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      child: new Card(
        elevation: 0.0,
        child: new Row(
          children: <Widget>[
            new Padding(
                padding: EdgeInsets.only(left: 15.0, top: 15.0),
                child: new CircleAvatar(
                  radius: 20,
                  backgroundImage: new NetworkImage(widget.message.avater),
                ),
            )
          ],
        ),
      ),
    );
  }
}


