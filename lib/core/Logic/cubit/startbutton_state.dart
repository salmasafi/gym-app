part of 'startbutton_cubit.dart';
class StartbuttonState {
}

 class StartbuttonInitial extends StartbuttonState {
   //ApiModels? apiModels ;
   StartbuttonInitial(
    //{this.apiModels}
    ) ;
 } 
class StartbuttonError extends StartbuttonState {
String e;
StartbuttonError(this.e);
}
class StartbuttonLoading extends StartbuttonState {

} 

class StartbuttonSuccess extends StartbuttonState{}

