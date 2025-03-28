import 'package:flutter/material.dart';


class ProfileEditBody extends StatelessWidget {
  const ProfileEditBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width:393,
            height: 320,
            child: Stack(
              //alignment: Alignment.bottomRight,
              children: [
                Container(
                  width:393 ,
                  height: 289,
                  color: Color(0xffB3A0FF),
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          Icon(Icons.arrow_left),
                          Text("My Profile",style: TextStyle(
                              fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white
                          ),),
                        ],
                      ),
                      SizedBox(
                        width: 125,
                        height: 125,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage("assets/images/profile.png"),
                              radius:125,
                            ),
                            Container(

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.yellow,
                                ),
                                child: IconButton(onPressed: (){}, icon: Icon(Icons.mode_edit_outlined,size: 20, color: Colors.black87,)))
                          ],
                        ),
                      ),
                      Text("name"),
                      Text("email.com"),
                      Text("Birthday:date"),
                    ],
                  ),
                ),
                Positioned(
                    top: 260,
                    left: 36,
                    child: Container(
                      width: 323,
                      height: 60,
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Card(
                        color: Color(0xff896CFE),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text("75 Kg"), Text("Wieght"),
                              ],
                            ),
                            //SizedBox(width: 20,),
                            Spacer(flex: 1,),
                            Container(width: 1,height: 30,color: Colors.white),
                            Spacer(flex: 2,),
                            Column(
                              children: [
                                Text("28"), Text("Years Old"),
                              ],
                            ),
                            Spacer(flex: 2,),
                            Container(width: 1,height: 30,color: Colors.white),
                            //SizedBox(width: 20,),
                            Spacer(flex: 1,),
                            Column(
                              children: [
                                Text("1.65 CM"), Text("Height"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                ),

              ],
            ),
          ),

          SizedBox(height: 20),
          profileField("Full Name", "Madison Smith"),
          profileField("Email", "madison@email.com"),
          profileField("Mobile Number", "+123456789"),
          profileField("Date of birth", "date"),
          profileField("Weight", "50kg"),
          profileField("Height", "155"),
          ElevatedButton(
            onPressed: (){},
            style:ElevatedButton.styleFrom(backgroundColor: Colors.yellow,),
            child: Text("Update Profile", style: TextStyle(color: Colors.black87),), )

        ],
      ),
    );
  }
  Widget profileField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      child: TextFormField(
        initialValue: value,
        style: TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15),
          constraints: BoxConstraints(
              maxWidth: 322,
              maxHeight: 45
          ),
          labelText: label,
          //prefix: SizedBox(height: 10,),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(color: Color(0xff896CFE),fontSize: 20 , fontWeight: FontWeight.w700),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
