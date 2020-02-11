import 'dart:io';

import 'package:carigari/Arrangements/Drawer.dart';
import 'package:carigari/Arrangements/sizeModification.dart';
import 'package:carigari/screens/bottomNavigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import "package:flutter/material.dart";
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
class Ss extends StatefulWidget {
  @override
  _SsState createState() => _SsState();
}

class _SsState extends State<Ss> {
   
    void initState() {
    print("in init state");

    super.initState();
    r();
  }

   void r()async{
     int p =7000,q=5;
     var dic={
  
    
    
            "Dinning Table A066,80 cm dia": "1GPQdjkFI3UxMhX7Zf3CBvrt7H0Mfp_H0"
        ,
            "Dinning Extendable 810-86 1+4": "17uCz71N0fsYdL4ufSZN55pBOEG4j7y-e"
       ,
        "Dinning Table only 14#": "1Ea1hM1j9IgRoZnoB6JjAhjyS3RHLPa3Y"
       ,
        "Dinning 8203-Z18 1+4,1+6": "1_JAXnYMS51Cg_rleaEc2g3lnvRX5O7Io"
       ,
        "Dinning Y82-2-C65 1+4,1+6": "1jHrvPxROH4_I3dYoY7iPmzlYZdn0Ts9v"
       ,
        "Dinning 9101-W-801,1+6,1+4": "1xsuUD0tq-S47iPkDU3vLCemqvbDo_FqM"
       ,
        "Dinning 2": "1LKPCvKjhPbGfTB_OsvcFdpf0nQSlUuIB"
       ,
        "Dinning 811-86 1+4": "1XYZdzOkPaJIF-dg3H81sIr1MMJjwVsK8"
        ,
            "Dinning C-02 round glass 135 cm dia 1+6": "1f9619JBAOOhY00oT8RAsuNgWWlmeLy0Z"
       ,
        "Dinning 3": "1oH16bzgKeG7d2n_ONmBfpf3g_4sArHx9"
       ,
        "Dinning 4": "1yj7fAJ9N3DRKBojpAY3rhPY11JbgHJ79"
        ,
            "Dinning 718B table and chairs": "1GDKEr9WBZsglDmskIM0B6YNtM75rZp5z"
        ,
            "Dinning 5": "1WRSLz0V89gIehfadLjY3Ld3buHR83ro8"
        ,
            "Dinning K27-806-1+6,-1+4": "1nE6dzK9IPcsc8QvttYEswokg7MNoiKDK"
        ,
            "Dinning K26-816-1+4": "1CndM8VWvPZZGMJaxIQd3z6ymLGBZNKC6"
        ,
            "Dinning K15-C-1,1+6": "104nuiIvf3ZehqmXdcv7loKeWSWtqruYT"
        ,
            "Dinning A60-C67-1+6": "1jScyNwkuCDf0dX1QA7nFjgfaQVjDeJIQ"
        ,
            "Dinning A888-F847-1+6": "1hJXkQ2-4GB5ZW9GTHiEiC-RrJcdM_Nk9"
        ,
            "Dinning A58-C66-1+6": "1mrhKdMNUTAWkmWLhNbpNHC-B0a72x6l3"
        ,
            "Dinning A85-C66-1+6": "19xBrSWymcGgVLJrEJ3XKAJzbmROTGyIk"
        ,
            "Dinning BLACK-&-WHITE-MARBLE-1+6": "14hyMq3LsL4I3RqysY7BG-HSUES8fXpyV"
        ,
            "Dinning A90-C62 1+6": "1BPVLLGzTAGpzJw4zUSTh_C7n7fyCfTiR"
        ,
            "Dinning A999-F847-1+8,1+6": "1eMFTQxMVWiZ11Jko56ETkeSwcrQCQBl8"
        ,
            "Dinning A56-C621+6": "1RQRnlVtW8WCh-vR1NtCoMmbfJYJU5yMY"
        ,
            "Dinning 793-03-1000-1+6": "1Mxt7z94AH5gY2CjneY9DlxSU0JiL8ADa"
        ,
            "Dinning A40-C67 1+6": "10G6h8_r9nMEl99uEW2zO-ASpxOMrYZZQ"
        ,
            "Dinning 801-808-4FT-DIA-1+4": "1sxFeCfcuMqIchNMmTPPk57A6Eajx58yH"
        ,
            "Dinning 623-132 1+6 1.6 MT": "1p8lOYyeRd1NjPqCneNj40vCmnhRitawX"
        ,
            "Dinning 637-808 1+ 1.8 MT": "1-pVkr5gAzn3I-XCvoRZszIn-I7n_izgK"
        ,
            "Dinning 761-208-1+61": "1dPZccGWrbASZ0PeHBxsl_D1yFVvmJKmE"
        ,
            "Dinning 7521-206-1+6-1": "1gpyt1YcHOWnaH38YIIeKA4p4r1Ipxo0r"
        ,
            "Dinning 616-151-1+6-1": "1ciAtwlSaE4AWfZ6ek3chionwCTjcbt5r"
        ,
            "Dinning 753728-3-1000-1+6": "1eqNZnwE7hqFElq9zGF4HGzGPAOVCaKj6"
        ,
            "Dinning 651-601-1+6": "1ADj74qBFdi7E1URMZk8ykMoW6RMq4ACA"
        ,
            "Dinning 563-118-1+6,-1": "18XuKZlhSi0JjamkqROBGcucg2_50v8CI"
        ,
            "Dinning 242-T435": "1zHRv0xZA99fqxt9GuBLmMVbbEFEMRWtx"
        ,
            "Dinning 1905-138-1+6,-1": "1wG-zZLwXE3k1h-1xUw2LMPpaEXx728gZ"
        ,
            "Dinning 1819-048-1+6,-1": "1F6ir44zkAdQp6srm_mzr1qXOY2BMsbxg"
        ,
            "Dinning 1041-122-887-1+6": "1jK62ORAi0s8arZiovsDva623iWtwqA6w"
    
// {
        //     "UIJ": "1qJHS1JZ7jV5JjfAgRaVMkqiWYZ-bc3SN"
        // ,
        // "Miscellaneous 1": "1yd_OLKkPPdAu9WEPVzHsz0VNx7EUVf9_"
        // ,
        // "SIDE-TABLE-TV-02": "1LO1uDMkQBiWyG3CRD62Rb5YbCsKzhY25"
        // ,
        // "SIDE-TABLE-TV-01": "1rXxpWb4I6J2ofbyLUlh1B4qHVLndI1YZ"
        // ,
        // "p-33-02(4": "1d71c_CdZCezkk-cKbbwPclw3Pu0F8ot4"
        // ,
        // "KJXHCVB": "1ksu_gNGxLC66KkBTHD4Y8tNAP-etJ5eG"
        // ,
        // "RELAX CHAIR Y15": "1SMHj0rFysVaPz0FkJr5BITY2X_j6R8ZZ"
        // ,
        // "p-33-04(5-2": "1aWlijX0hB29LYLmxlcYsJT-MkC_jed7W"
        // ,
        // "p-38-05(4-2)": "10qWRbKZasRxchT4o7hvjubA4eBu5IzA1"
        // ,
        // "RELAX CHAIR Y10": "1IdpTnmHRG7UdeUAvTlXwSR7gOf42jEu9"
        // ,
        // "DTHRG": "1ZJS8ni4ao2ATRECx0rQmlJTh1_DrKx6t"
        
//     ]
// }
// // {
        //      "visitor-chair-203": "1_QmfhgJ-tvV9SNLinlJcvYSaX8pohuPc"
        // ,
        // "VISITOR CHAIR 06-8": "1_tu00FA1UJ7Zh3GnT0ywNtG6gYk0OucG"
        // ,
        // "off-chair-920": "1JFPItKybUvpkBBYSWZwbohy6gUFqvurS"
        // ,
        // "OFF CHAIR B46": "1I2_HBPYtOzWIUuW13YExQOh-2QT9a5QD"
        // ,
        // "OFF-TABLE-128": "1QO_5Zidsa4BP74TCWxzOkfCfMbrNOtmp"
        // ,
        // "Office b07": "14riZlKqBK15MSianQIymY88T-vO8XLnK"
        // ,
        // "Office b811": "1mEG0LvLcvQva3JjaFofLaxLcSofa_waN"
        // ,
        // "Office 8833": "1sovjCumQezZbGvAMKBO094fs7KH1reLz"
        // ,
        // "Office 8018": "1onCHNcTdlpzG8Z88AB6tvETG4MIrzRQx"
        // ,
        // "Office 97018": "1I9T8-W47BfXMJz0x-9SmVrB87eyqubRB"
        // ,
        // "Office 8418": "1eJfHwWD6Rhqm4JxHq6jnGIKMrI3742Gm"
        // ,
        // "Office 8318": "1ZYR76kGF_3DRskE750cVzbgP3RLNwiiS"
        // ,
        // "Office 7418": "1cc5pnX79AE2anDg8DO69UuGuVGo-5cDN"
        // ,
        // "Office 2253-18": "1Ye2FlWbKweY8g53KTfnG21VihqLPry_S"
        // ,
        // "Office 203018": "1KmWdYhQ_j9eprjTxNlOacraWmuTYQL8b"
        // ,
        // "Office 1843-18": "1FiNotHfyi9S2TImpZLV0-Y_6iraTLGjU"
        // ,
        // "Office 093": "1low7TqBDukE6TaYwC0adfHSp2LGZrbG0"
        // ,
        // "Office 03": "16WqWOS5AKotHGDXqSeZib6u1oSYgjiMI"
        // ,
        // "Office 01": "1lUtDYDLtmcNLFxB3mKXRgGxN9lmRcxai"
        
//     ]
// }
// {
//     "sofa": [
//         {
            // "SOFA-CUM-BED": "1SnH2uWshgGi6VO8sAvLb4yo0BN4rJSH3"
//         }
//     ]
// }

        // "Centre Table ST-520": "15kzhQ4sQieFW5HQu3INmUQ0KIWZZ2ClO",
        // "TEAPOY-1238": "1e-sAtkKjmFkO_pDg9M4E9CfJXucWNjAr",
        // "Centre Table 709-100_50": "13w55Tp1TCwxkMtRvgOkQWxmW2Q4vhKwF",
        // "Centre Table 702-100-50": "1RXv7NDA5q_n2kuHHj_pVUekG3NVz7dvI",
        // "Centre Table F224": "1i4a_NJJdqKlaY3-ED2Sd6PJ8kgmdMM3A",
        // "Centre Table C-48-1": "1ye87OuWMWThr9cm8iodXVC3dmVI881kK",
        // "Centre Table J5": "1jvAi3V2mi2QmAPpl7eDDsEKRb-CJGX0u",
        // "Centre Table C01": "1rJSb3aR8KPZ-qQ_Lf5G6ChortSKQqlRt",
        // "Centre Table MT-05": "1ieO7VGxpxyOtfKsCDKmBwmhIY0YzLjI9",
        // "Centre Table T209": "1c3Ga4RWIvyMCIcy6JFz7JPdvdt1jGQgj",
        // "Centre Table J7": "17gAeStjCUuBYEmIWJUsadoc83CPbJvBg",
        // "CT701-100-50": "1S6lF0S5Wob8fZJvg6gy017whdJrnT3gM",
        // "Centre Table C-01": "1aX-c9Iydu3wX4W_i12sWyLS1HFlAYkMP",
        // "Centre Table D74": "1siWKyQrBCjCLd04J3jLLcmyoI3rKLrr2",
        // "Centre Table AH-91": "1ilEFUSX9-3HjFNnFa8xyWYdqd1SNySUf",
        // "Centre Table A6": "1_m3auHlXG9n_NQDXGN2QFdLgjqtPlvoM",
        // "Centre Table A937": "1ceOrfc6BwS4uskVWxcbqOuGqPu3uCxrU",
        // "Centre Table A8": "1LIZPxLbrRfZywKnzT-3VTVXvAoTu8Q0F",
        // "Centre Table A7": "1VlzH_Sn82v3spuk1apdtnVa1JnBfrgLB",
        // "Centre Table B1007": "1t1RFA3VQPgejT-Wfn7qEvYalObNzfR8U",
        // "Centre Table B-18": "1GmyEUx1DPY2sMQvDerwmwCmPnhzY8KAs",
        // "Centre Table A105": "1JEY6gcCsXsWfCelPGpQRAyUQ-3u76yGm",
        // "Centre Table A-70": "12dwTQuwBS-s3nFOUAoK5hY6Ktr9QSB5O",
        // "Centre Table 911 BIG": "1S0xhgkjBLe2FdyCXEAxhsYEwsHmFOlI7",
        // "Centre Table 630-9": "1oAPV3klKYT5mrF8KMlCYZPFTDQhDn_o4",
        // "Centre Table 703-100-50": "1Rco76wvNopPFi1VJNxsmHHc8geZPj5HD",
        // "Centre Table 706-100-50": "1SebrMLrJW6ZkyMjKvQ23J1t1xwCRE3zL",
        // "Centre Table 809-100-0,120-60": "1VUxKZDa6q5-NOLvNA2Up4x8XMKyy3IBj",
        // "Centre Table 630-6": "1Bteb5zC-vCit3KRCTuQ3oFw8usY4hiFQ",
        // "Centre Table 705-100-50": "1qw69Luj4I_covyDo-OnQG48c7iUN7ZqI",
        // "Centre Table 807-2-100-50": "1_tLs_0FkDYksgPZdziPqLgC-4Z_01Xhl",
        // "Centre Table 903-2-100-50,120-60": "1YqesAxd2H4uxEB80ljP1APYtHbwts57Q",
        // "Centre Table 807-100-50,120-60": "14eONJhwYEE5_BHL4f_hBiNq2blRT2-kS",
        // "Centre Table 704-100-50": "1yQ9jyol8sXQBZahiSSdgDCzvkuPpqmXt",
        // "Centre Table 614": "1q5Pr_lfCzT78v8GG61P0Sf0fIma2lquU",
        // "Centre Table 630-10": "1riorF9f9ZUi1pKFzwaJg-lSgaa4uA0E0",
        // "Centre Table 6110": "1PHzGopnUut3ysTgWc_aX4ZiNQzNH3FFT",
        // "Centre Table 626-100-50": "1Pw6vw-K4uSo8n88DiVEcoySeH_yfAnGR",
        // "Centre Table 60-74": "1czr_Ep9OHAygWtlNe-wMmJeb1SQcPaMn",
        // "Centre Table 60-10": "1lqAaqMdyDrAcSURwljv9gvlyaNf2_N76",
        // "Centre Table 525": "1RFh3mBQRCcR2cGAH6_OO4RpQWSjIRhxO",
        // "Centre Table 520": "1gPj7TEQnuIpRJe4c8xQAGeeYky6octzn",
        // "Centre Table 3314-i": "1o-yNuteebNPqxXmKIvk17LSd4Jf08EkQ",
        // "Centre Table 3302-Y": "1jS0nK1TwELZTqhYf__hwNrd-OkATfv-e",
        // "Centre Table 3302-r": "1aE5UiP6--Rc9nxEg4AZfGXMB3W7JcTs4",
        // "Centre Table 1602": "1OBZ9P9C8llSZH4hW0IcP5O9h5OwscEZ9",
        // "Centre Table 163-2-100-50,120-60": "1wKK06KRKleClbexRzoKkE7RPkam2RLlC",
        // "Centre Table 3119": "1j1GsWFSancN_VxubuJLAww-HoatDG8Wk",
        // "Centre Table 164-120-60": "1dZDmyl1rDQrgROF-_PqsiLocEF3I8M0F",
        // "Centre Table 3302-P": "1oPNq4KouRv6kUgtW8caB7bhdZ4VhTMAA",
        // "Centre Table 2012-BIG-AND-SMALL": "1jZZQp36XFxcMk3jmwISfVjCfmcKGKv5k",
        // "Centre Table 226-100-50": "1MCTBKP0DQOho1gZB3YES0KGV1SAjivtN",
        // "Centre Table 225-100-50": "1pI42f29zwh36jEidIjY8C5DDj596jX5W",
        // "Centre Table 153-2-100-50,120-60": "12Pi-yl4soXuo3KdXYWJ9UKAbg2Jnf1_a",
        // "Centre Table 136A": "1ZrHUKDgmOeLrF5V62S4nmUsDmW1Tti54",
        // "Centre Table 1235": "1wLXnrIczsZMHjC259miAHD7FveWw1_4b",
        // "Centre Table 652": "18j-_fGsjTvbYvrKg4TFtOIWZ3i0wXH89",
        // "Centre Table 112": "1SZOcnGI0AY_-3XOXPMJ5In6-KKNngIUI",
        // "Centre Table 116A": "15Gf5nwjd0-Z49NNp4dqPl-gGX8gNVV__",
        // "Centre Table -039": "1kq2w5yJonY3SY9SOKxcpYELPS1Gj69Bv",
        // "Centre Table 1237": "1hqWhRP-ILxd1hA1eHneDRaW9YhOZl_S6",
        // "Centre Table -A": "1fpZTlZ4dpzEwR1RBPSwQyHek4U-BDeoQ",
        // "Centre Table A8": "1jpNgyCdtu9JUHhEU1U0ocsrX3dJk1rqu",
        // "Centre Table A7": "1j2dwUPtK50NhfvnwN5uaYDPTAV-ofJ_J",
        // "Centre Table 616": "15cR7GxoRHrc1lYI9Mx7y9m9DKvbVCU1p",
        // "Centre Table 521": "1sNtL7RE-uueiZgpWJ7RgAxceOCcrm9mF",
        // "Centre Table 630-7": "1tE9yPD_bitTwjWwdPJdBpaAEgxkkJGRX",
        // "Centre Table -9203": "11YKGKPZkp11ndjS_p56KLHZCpxvKlRfR",
        // "Centre Table 6109": "1pAHcAVNFM4avTDE7LldRLnz0jKWw-rCG",
        // "Centre Table 3302 T": "1Qf9AvIaHq9RbUDLanZBOgUNClrw8Y3R3",
        // "Centre Table 3314 I": "1QmojP4Rb5L-zLEaWX8hDIz_rcXk6EsFI",
        // "Centre Table 3302 R": "17owvbuXvYJtGcn-WSDO9A4nQmyrxzpEs",
        // "Centre Table 148A": "1YeNK1qGKNdK2vAUTdHKvRjLX6kbmxzdm",
        // "Centre Table 2020 ": "1TR1wFybZrbDF2-GpmUK3f1zA_hk3qXt0",
        // "Centre Table -911 small": "1g-mdoajqReo1Ha1RtCFU8BXh8X591_vO",
        // "A01-120-65CM-100-50": "1Mzwawj0thBS7XFm3n9JiqPUFe-nu0ELx"
       
        
    
};

     dic.forEach((k,v) async=>await  Firestore.instance
                              .collection('Dinning Room Furniture')
                              .document("$k")
                              .setData({
                                "quantity" : q,
                                "price" : p = p + 100,
                                "image":"$v",
                                "desc": "...",
                                // "date and time": date,
                                // "name": nameInput.text,
                                // "city": "Hyderabad",
                                // "address": msgInput.text,
                                // "email": emailInput.text,
                                // "mobile": phoneNumberInput.text,
                                // "cart": {
                                //   "items": cartitem,
                                //   "total price": global.totalamount
                                "name":"$k",
                                
                                // 
                              })
                              .then((result) => {
                                    // global.cart
                                    //     .removeRange(0, global.cart.length),
                                    // global.value
                                    //     .removeRange(0, global.value.length),
                                    // global.totalamount = 0,
                                    // cartitem = "empty",
                                    // print(cartitem),
                                    // Navigator.pushReplacementNamed(
                                    //     context, "HomeScreen"),

                                    // nameInput.clear(),
                                    // cityInput.clear(),
                                    // phoneNumberInput.clear(),
                                    // emailInput.clear(),
                                    // msgInput.clear(),
print("done $k")
                                    // stateInput.clear(),
                                  })
                              .catchError((err) => print(err)));
            


   }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home: Scaffold(
            appBar: new AppBar(
              backgroundColor: Color.fromRGBO(191, 32, 37, 1.0),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Carigari'),
                  Image.asset(
                    'images/logo.png',
                    fit: BoxFit.fill,
                    height: 4.5,
                  ),
                ],
              ),
            ),
            drawer: theDrawer(context),
            // bottomNavigationBar: bottomnavigation(context, 0),
            body:Container(child:Text("hai"))));
      
    
  }
}