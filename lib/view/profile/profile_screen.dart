import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height * 0.08,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  "Pesan Vaksinasi",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    const Center(
                      child: Icon(
                        Icons.account_circle,
                        size: 96,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 55,
                      child: customProfile(
                        icon: const Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        title: "Nama Lengkap Pemesan",
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: customProfile(
                        icon: const Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        title: "Nomor NIK",
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: customProfile(
                        icon: const Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        title: "Tanggal Lahir",
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: customProfile(
                        icon: const Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        title: "Gender",
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: customProfile(
                        icon: const Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        title: "Alamat Email",
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: customProfile(
                        icon: const Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        title: "Nomor Hp",
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: customProfile(
                        icon: const Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        title: "Status Keluarga",
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: customProfile(
                        icon: const Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        title: "Alamat Berdasarkan KTP",
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: customProfile(
                        icon: const Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        title: "Alamat Domisili",
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Edit Profile",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customProfile({Icon? icon, String? title}) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            icon!,
            const SizedBox(
              width: 16,
            ),
            Text(
              "$title",
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 18,
              ),
            ),
          ],
        ),
        Divider(
          color: Colors.grey.shade700,
        ),
      ],
    );
  }
}
