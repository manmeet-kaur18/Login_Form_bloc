import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart' ;

class Bloc extends Object with Validators{
  //we need to hide access to it by using private feild
// final _email = StreamController<String>.broadcast();//braosdcast was used to make strean use multiple times
// final _password = StreamController<String>.broadcast();

final _email = BehaviorSubject<String>();
final _password = BehaviorSubject<String>();
//private field
// Function(String) get changeEmail => _emailController.sink.add;


//Add data to the stream
Stream<String> get email => _email.stream.transform(validateEmail);
Stream<String> get password => _password.stream.transform(validatePassword);
Stream<bool> get submitValid => Observable.combineLatest2(email,password,(e,p) => true);
//change data
Function(String) get changeEmail => _email.sink.add;//as sson as we add value in it stream will come into function and new value will go to transform and check for its validation
Function(String) get changePassword => _password.sink.add;

// submitButton()
// {
//   _email.stream.listen((value){
//    emailOK= true;
//   });
//   _password.stream.listen((value)
//   {
//     passwordOK = true;
//   });
// }not good idea to use to merge to streeams to make custom widget

submit()
{
   final validEmail= _email.value;
   final validPassword =_password.value;
}

dispose()//for doing some cleanup
{
  _email.close();
  _password.close();
}


}
// final bloc = Bloc();