import 'package:equatable/equatable.dart';

class Medicine extends Equatable {
  final String name;
  final String id;
  final String imageUrl;
  final int price;

  const Medicine({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  static List<Medicine> medicines = [
    const Medicine(
        id: '1',
        name: 'Lisinopril',
        imageUrl:
            'https://5.imimg.com/data5/ANDROID/Default/2023/6/320547060/DO/SP/MX/11121653/product-jpeg.jpg',
        price: 85),
    const Medicine(
        id: '2',
        name: 'Amlodipine',
        imageUrl:
            'https://5.imimg.com/data5/SELLER/Default/2023/7/326770036/BL/UA/BR/135658020/amlodipine-tablets-ip-5-mg-500x500.jpg',
        price: 50),
    const Medicine(
      id: '3',
      name: 'Losartan',
      imageUrl:
          'https://www.jabsbiotech.com/wp-content/uploads/2018/05/Losapot_H.jpg0',
      price: 60,
    ),
    const Medicine(
      id: '4',
      name: 'Hydrochlorothiazide',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2022/10/RL/HQ/EW/159772262/hydrazide-hydrochlorothiazide-tablets.jpg',
      price: 40,
    ),
    const Medicine(
      id: '5',
      name: 'Metoprolol',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2022/11/UO/RS/FG/161638739/metoprolol-tartrate-50-mg.jpg',
      price: 75,
    ),
    const Medicine(
      id: '6',
      name: 'Valsartan',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2021/6/HE/NN/NI/3184985/valsarcris160.jpg',
      price: 70,
    ),
    const Medicine(
      id: '7',
      name: 'Ramipril',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2022/7/UJ/WA/NW/27431841/ramiten-5-tab.jpg',
      price: 65,
    ),
    const Medicine(
      id: '8',
      name: 'Enalapril',
      imageUrl:
          'https://5.imimg.com/data5/HO/DP/MY-15666310/enalapril-maleate.jpg',
      price: 55,
    ),
    const Medicine(
      id: '9',
      name: 'Carvedilol',
      imageUrl:
          'https://5.imimg.com/data5/ANDROID/Default/2021/4/KK/PI/WP/107836458/picsart-04-11-05-09-36-jpg.jpg',
      price: 45,
    ),
    const Medicine(
      id: '10',
      name: 'Furosemide',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2023/8/334163411/FT/NW/BF/6299000/furosemide-injection.jpg',
      price: 30,
    ),
    const Medicine(
      id: '11',
      name: 'Atenolol',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2022/7/HZ/FZ/TL/38378827/atenolol-50-mg-hydrochlorothiazide-12-5-mg.jpg',
      price: 35,
    ),
    const Medicine(
      id: '12',
      name: 'Propranolol',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2023/2/PX/BZ/PK/129531575/inderal-10mg-40mg-containing-propranolol.jpg',
      price: 40,
    ),
    const Medicine(
      id: '13',
      name: 'Nifedipine',
      imageUrl:
          'https://5.imimg.com/data5/RD/YM/MY-23623161/nifedipine-tablets.jpg',
      price: 50,
    ),
    const Medicine(
      id: '14',
      name: 'Methyldopa',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2024/2/389234317/NB/CV/UD/4323067/aldomet-250-mg-methyldopa-250mg-tablet.jpg',
      price: 60,
    ),
    const Medicine(
      id: '15',
      name: 'Lisinopril',
      imageUrl:
          'https://5.imimg.com/data5/ANDROID/Default/2023/6/320547060/DO/SP/MX/11121653/product-jpeg.jpg',
      price: 85,
    ),
    const Medicine(
      id: '16',
      name: 'Amlodipine',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2023/7/326770036/BL/UA/BR/135658020/amlodipine-tablets-ip-5-mg-500x500.jpg',
      price: 50,
    ),
    // Diabetes medicines
    const Medicine(
      id: '17',
      name: 'Metformin',
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/Njm9e5KQezGBFwYRjaTkbC-1200-80.jpg',
      price: 30,
    ),
    const Medicine(
      id: '18',
      name: 'Insulin (Regular)',
      imageUrl:
          'https://www.humulin.com/assets/images/6562a_elhu_hmr_3_vl_st_abv_300_sq.jpg',
      price: 50,
    ),
    const Medicine(
      id: '19',
      name: 'Gliclazide',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2023/8/331909756/IH/VP/RI/151880555/gliclazide-80-mg-tablets.jpeg',
      price: 40,
    ),
    const Medicine(
      id: '20',
      name: 'Sitagliptin',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2022/11/FW/CJ/DH/14366937/whatsapp-image-2022-11-10-at-13-.jpg',
      price: 60,
    ),
    const Medicine(
      id: '21',
      name: 'Empagliflozin',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2022/10/FP/YK/RU/12931111/empaone-25mg-tablet.png',
      price: 70,
    ),
    const Medicine(
      id: '22',
      name: 'Dapagliflozin',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2022/12/GM/WU/NC/160457072/pafagold-10.jpeg',
      price: 75,
    ),
    const Medicine(
      id: '23',
      name: 'Linagliptin',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2022/8/CV/NK/PP/152097542/trajenta-linagliptin-tablet.jpg',
      price: 65,
    ),
    const Medicine(
      id: '24',
      name: 'Glipizide',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2023/3/292620999/KE/OS/LL/147460468/glipizide-tablet-bp.JPG',
      price: 45,
    ),
    const Medicine(
      id: '25',
      name: 'Pioglitazone',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2022/6/AE/JM/WS/15859925/pioglitazone-15-mg-tablets.jpeg',
      price: 55,
    ),
    const Medicine(
      id: '26',
      name: 'Glyburide',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2022/10/GJ/EI/HP/41245248/dibeta-gb-torrent.jpg',
      price: 35,
    ),
    const Medicine(
      id: '27',
      name: 'Canagliflozin',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2023/6/314764716/IH/VR/ML/4289864/canagliflozin-tablets-100-mg-sulisent-.jpg',
      price: 80,
    ),
    const Medicine(
      id: '28',
      name: 'Saxagliptin',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2023/9/340685774/QS/YI/KX/40593894/saxagliptin-tablets.jpeg',
      price: 60,
    ),
    const Medicine(
      id: '29',
      name: 'Insulin',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2023/8/334812152/KI/UG/UB/194323512/lantus-100-iu-ml-cartridge.webp',
      price: 90,
    ),
    const Medicine(
      id: '30',
      name: 'Azithromycin',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2023/7/328523507/HJ/PT/HG/125278182/azithromycin-tablet-500-mg-500x500.jpeg',
      price: 20,
    ),
    const Medicine(
      id: '31',
      name: 'Doxycycline',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2023/1/FJ/TW/KF/14479717/doxydef-lb-doxycycline-hcl-lactic-acid-bacillus-400mg-capsules.jpg',
      price: 25,
    ),
    const Medicine(
      id: '32',
      name: 'Metronidazole',
      imageUrl:
          'https://5.imimg.com/data5/IOS/Default/2022/2/CE/VO/SG/56119582/product-jpeg.png',
      price: 30,
    ),
    const Medicine(
      id: '33',
      name: 'Ceftriaxone',
      imageUrl:
          'https://www.criticinecare.com/wp-content/uploads/2023/03/Xoncine-S-1.5.jpg',
      price: 35,
    ),
    const Medicine(
      id: '34',
      name: 'Ciprofloxacin',
      imageUrl:
          'https://www.criticinecare.com/wp-content/uploads/2023/03/Xoncine-S-1.5.jpg',
      price: 40,
    ),
    const Medicine(
      id: '35',
      name: 'Erythromycin',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2023/6/319596067/GH/TD/EQ/135658020/erythromycin-stearate-tablets-ip-250-mg.jpg',
      price: 45,
    ),
    const Medicine(
      id: '36',
      name: 'Penicillin',
      imageUrl:
          'https://www.aarp.org/content/dam/aarp/health/drugs_supplements/2018/08/1140-penicillin-allergy.jpg',
      price: 50,
    ),
    const Medicine(
      id: '37',
      name: 'Clindamycin',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2022/5/TO/FN/OP/27328922/peroclin-5-gel-15gm-09d00521-a18c-4c17-8b2a-1ffb410d8ce8.jpeg',
      price: 55,
    ),
    const Medicine(
      id: '38',
      name: 'Acyclovir',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2023/2/GJ/HO/KI/7810472/acyclovir-400-mg-tablets.jpg',
      price: 60,
    ),
    const Medicine(
      id: '39',
      name: 'Valacyclovir',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2023/9/347592917/NZ/PD/ZU/71251776/valacyclovir-100-mg-tablet.jpg',
      price: 65,
    ),
    const Medicine(
      id: '40',
      name: 'Famciclovir',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2024/1/375247920/LD/UU/OH/154616807/virovir-500mg-famciclovir-tablets.webp',
      price: 70,
    ),
    const Medicine(
      id: '41',
      name: 'Fluconazole',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2023/4/300817871/OU/MB/EP/7034457/fluconazole-tablet.jpg',
      price: 75,
    ),
    const Medicine(
      id: '42',
      name: 'Miconazole',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2022/9/HV/TK/BS/74432886/micorus-cream.JPG',
      price: 80,
    ),
    const Medicine(
      id: '43',
      name: 'Terbinafine',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2022/10/OC/IS/RQ/23618296/terbinafine-hydrochloride-cream.jpg',
      price: 85,
    ),
    const Medicine(
      id: '44',
      name: 'Nystatin',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2023/9/342008212/YV/GN/RY/557330/nystatin.jpeg',
      price: 90,
    ),
    const Medicine(
      id: '45',
      name: 'Paracetamol',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2022/9/IV/UY/CG/75459511/500mg-paracetamol-tablet.jpg',
      price: 10,
    ),
    const Medicine(
      id: '46',
      name: 'Ibuprofen',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2023/6/319597573/MH/NE/SR/135658020/ibuprofen-400-mg-bp-tablets.jpg',
      price: 15,
    ),
    const Medicine(
      id: '47',
      name: 'Aspirin',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2023/7/330506870/UM/GZ/QO/135658020/aspirin-dispersible-tablets.jpg',
      price: 20,
    ),
    const Medicine(
      id: '48',
      name: 'Acetaminophen',
      imageUrl:
          'https://www.drugwatch.com/wp-content/uploads/Acetaminophen.jpg',
      price: 25,
    ),
    const Medicine(
      id: '49',
      name: 'Naproxen',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2022/11/RK/SI/WE/4794823/naproxen-tablets-500-mg.webp',
      price: 30,
    ),
    const Medicine(
      id: '50',
      name: 'Diclofenac',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2023/5/311173110/TX/HS/SY/54685737/diclofenac-sodium-tablet.png',
      price: 35,
    ),
    const Medicine(
      id: '51',
      name: 'Acetylsalicylic',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2022/5/MU/LU/SC/25071451/whatsapp-image-2022-05-28-at-10-00-54-am-500x500.jpg',
      price: 40,
    ),
    const Medicine(
      id: '52',
      name: 'Meperidine',
      imageUrl: 'https://via.placeholder.com/150',
      price: 45,
    ),
    const Medicine(
      id: '53',
      name: 'Codeine',
      imageUrl: 'https://via.placeholder.com/150',
      price: 50,
    ),
    const Medicine(
      id: '54',
      name: 'Hydrocodone',
      imageUrl: 'https://via.placeholder.com/150',
      price: 55,
    ),
    const Medicine(
      id: '55',
      name: 'Tramadol',
      imageUrl: 'https://via.placeholder.com/150',
      price: 60,
    ),
    const Medicine(
      id: '56',
      name: 'Morphine',
      imageUrl: 'https://via.placeholder.com/150',
      price: 65,
    ),
    const Medicine(
      id: '57',
      name: 'Oxycodone',
      imageUrl: 'https://via.placeholder.com/150',
      price: 70,
    ),
    const Medicine(
      id: '58',
      name: 'Hydromorphone',
      imageUrl: 'https://via.placeholder.com/150',
      price: 75,
    ),
    const Medicine(
      id: '59',
      name: 'Fentanyl',
      imageUrl: 'https://via.placeholder.com/150',
      price: 80,
    ),
    const Medicine(
      id: '60',
      name: 'Ketorolac',
      imageUrl: 'https://via.placeholder.com/150',
      price: 85,
    ),
    const Medicine(
      id: '61',
      name: 'Dipyrone',
      imageUrl: 'https://via.placeholder.com/150',
      price: 90,
    ),
    const Medicine(
      id: '62',
      name: 'Indomethacin',
      imageUrl: 'https://via.placeholder.com/150',
      price: 95,
    ),
    const Medicine(
      id: '63',
      name: 'Piroxicam',
      imageUrl: 'https://via.placeholder.com/150',
      price: 100,
    ),
    const Medicine(
      id: '64',
      name: 'Celecoxib',
      imageUrl: 'https://via.placeholder.com/150',
      price: 105,
    ),
    const Medicine(
      id: '65',
      name: 'Interferon alfa',
      imageUrl: 'https://via.placeholder.com/150',
      price: 150,
    ),
    const Medicine(
      id: '66',
      name: 'Ribavirin',
      imageUrl: 'https://via.placeholder.com/150',
      price: 200,
    ),
    const Medicine(
      id: '67',
      name: 'Sofosbuvir',
      imageUrl: 'https://via.placeholder.com/150',
      price: 250,
    ),
    const Medicine(
      id: '68',
      name: 'Daclatasvir',
      imageUrl: 'https://via.placeholder.com/150',
      price: 300,
    ),
    const Medicine(
      id: '69',
      name: 'Ledipasvir',
      imageUrl: 'https://via.placeholder.com/150',
      price: 350,
    ),
    const Medicine(
      id: '70',
      name: 'Simeprevir',
      imageUrl: 'https://via.placeholder.com/150',
      price: 400,
    ),
    const Medicine(
      id: '71',
      name: 'Ombitasvir',
      imageUrl: 'https://via.placeholder.com/150',
      price: 450,
    ),
    const Medicine(
      id: '72',
      name: 'Paritaprevir',
      imageUrl: 'https://via.placeholder.com/150',
      price: 500,
    ),
    const Medicine(
      id: '73',
      name: 'Dasabuvir',
      imageUrl: 'https://via.placeholder.com/150',
      price: 550,
    ),
    const Medicine(
      id: '74',
      name: 'Velpatasvir',
      imageUrl: 'https://via.placeholder.com/150',
      price: 600,
    ),
    const Medicine(
      id: '75',
      name: 'Glecaprevir',
      imageUrl: 'https://via.placeholder.com/150',
      price: 650,
    ),
    const Medicine(
      id: '76',
      name: 'Pibrentasvir',
      imageUrl: 'https://via.placeholder.com/150',
      price: 700,
    ),
    const Medicine(
      id: '77',
      name: 'Grazoprevir',
      imageUrl: 'https://via.placeholder.com/150',
      price: 750,
    ),
    const Medicine(
      id: '78',
      name: 'Elbasvir',
      imageUrl: 'https://via.placeholder.com/150',
      price: 800,
    ),
    const Medicine(
      id: '79',
      name: 'Asunaprevir',
      imageUrl: 'https://via.placeholder.com/150',
      price: 850,
    ),
    const Medicine(
      id: '80',
      name: 'Beclabuvir',
      imageUrl: 'https://via.placeholder.com/150',
      price: 900,
    ),
    const Medicine(
      id: '81',
      name: 'Dasabuvir',
      imageUrl: 'https://via.placeholder.com/150',
      price: 550,
    ),
    const Medicine(
      id: '82',
      name: 'Ritonavir',
      imageUrl: 'https://via.placeholder.com/150',
      price: 950,
    ),
    const Medicine(
      id: '83',
      name: 'Paromomycin',
      imageUrl: 'https://via.placeholder.com/150',
      price: 1000,
    ),
    const Medicine(
      id: '84',
      name: 'Tenofovir',
      imageUrl: 'https://via.placeholder.com/150',
      price: 1050,
    ),
    const Medicine(
      id: '85',
      name: 'Entecavir',
      imageUrl: 'https://via.placeholder.com/150',
      price: 1100,
    ),
    const Medicine(
      id: '86',
      name: 'Telbivudine',
      imageUrl: 'https://via.placeholder.com/150',
      price: 1150,
    ),
    const Medicine(
      id: '87',
      name: 'Lamivudine',
      imageUrl: 'https://via.placeholder.com/150',
      price: 1200,
    ),
    const Medicine(
      id: '88',
      name: 'Adefovir',
      imageUrl: 'https://via.placeholder.com/150',
      price: 1250,
    ),
    const Medicine(
      id: '89',
      name: 'Emtricitabine',
      imageUrl: 'https://via.placeholder.com/150',
      price: 1300,
    ),
    const Medicine(
      id: '90',
      name: 'Boceprevir',
      imageUrl: 'https://via.placeholder.com/150',
      price: 1350,
    ),
    const Medicine(
      id: '91',
      name: 'Telaprevir',
      imageUrl: 'https://via.placeholder.com/150',
      price: 1400,
    ),
    const Medicine(
      id: '92',
      name: 'Tolcapone',
      imageUrl: 'https://via.placeholder.com/150',
      price: 1450,
    ),
    const Medicine(
      id: '93',
      name: 'Entacapone',
      imageUrl: 'https://via.placeholder.com/150',
      price: 1500,
    ),
    const Medicine(
      id: '94',
      name: 'Carbidopa',
      imageUrl: 'https://via.placeholder.com/150',
      price: 1550,
    ),
    const Medicine(
      id: '95',
      name: 'Levodopa',
      imageUrl: 'https://via.placeholder.com/150',
      price: 1600,
    ),
    const Medicine(
      id: '96',
      name: 'Benserazide',
      imageUrl: 'https://via.placeholder.com/150',
      price: 1650,
    ),
    const Medicine(
      id: '97',
      name: 'Entacapone',
      imageUrl: 'https://via.placeholder.com/150',
      price: 1500,
    ),
    const Medicine(
      id: '98',
      name: 'Carbidopa',
      imageUrl: 'https://via.placeholder.com/150',
      price: 1550,
    ),
    const Medicine(
      id: '99',
      name: 'Levodopa',
      imageUrl: 'https://via.placeholder.com/150',
      price: 1600,
    ),
    const Medicine(
      id: '100',
      name: 'Benserazide',
      imageUrl: 'https://via.placeholder.com',
      price: 3000,
    ),
    const Medicine(
      id: '101',
      name: 'Furosemide',
      imageUrl: 'https://via.placeholder.com/150',
      price: 100,
    ),
    const Medicine(
      id: '102',
      name: 'Hydrochlorothiazide',
      imageUrl: 'https://via.placeholder.com/150',
      price: 150,
    ),
    const Medicine(
      id: '103',
      name: 'Spironolactone',
      imageUrl: 'https://via.placeholder.com/150',
      price: 200,
    ),
    const Medicine(
      id: '104',
      name: 'Ramipril',
      imageUrl: 'https://via.placeholder.com/150',
      price: 250,
    ),
    const Medicine(
      id: '105',
      name: 'Losartan',
      imageUrl: 'https://via.placeholder.com/150',
      price: 300,
    ),
    const Medicine(
      id: '106',
      name: 'Valsartan',
      imageUrl: 'https://via.placeholder.com/150',
      price: 350,
    ),
    const Medicine(
      id: '107',
      name: 'Enalapril',
      imageUrl: 'https://via.placeholder.com/150',
      price: 400,
    ),
    const Medicine(
      id: '108',
      name: 'Benazepril',
      imageUrl: 'https://via.placeholder.com/150',
      price: 450,
    ),
    const Medicine(
      id: '109',
      name: 'Lisinopril',
      imageUrl: 'https://via.placeholder.com/150',
      price: 500,
    ),
    const Medicine(
      id: '110',
      name: 'Captopril',
      imageUrl: 'https://via.placeholder.com/150',
      price: 550,
    ),
    const Medicine(
      id: '111',
      name: 'Candesartan',
      imageUrl: 'https://via.placeholder.com/150',
      price: 600,
    ),
    const Medicine(
      id: '112',
      name: 'Olmesartan',
      imageUrl: 'https://via.placeholder.com/150',
      price: 650,
    ),
    const Medicine(
      id: '113',
      name: 'Irbesartan',
      imageUrl: 'https://via.placeholder.com/150',
      price: 700,
    ),
    const Medicine(
      id: '114',
      name: 'Telmisartan',
      imageUrl: 'https://via.placeholder.com/150',
      price: 750,
    ),
    const Medicine(
      id: '115',
      name: 'Perindopril',
      imageUrl: 'https://via.placeholder.com/150',
      price: 800,
    ),
    const Medicine(
      id: '116',
      name: 'Quinapril',
      imageUrl: 'https://via.placeholder.com/150',
      price: 850,
    ),
    const Medicine(
      id: '117',
      name: 'Trandolapril',
      imageUrl: 'https://via.placeholder.com/150',
      price: 900,
    ),
    const Medicine(
      id: '118',
      name: 'Aliskiren',
      imageUrl: 'https://via.placeholder.com/150',
      price: 950,
    ),
    const Medicine(
      id: '119',
      name: 'Hydralazine',
      imageUrl: 'https://via.placeholder.com/150',
      price: 1000,
    ),
    const Medicine(
      id: '120',
      name: 'Methyldopa',
      imageUrl: 'https://via.placeholder.com/150',
      price: 1050,
    ),
    const Medicine(
      id: '121',
      name: 'Clonidine',
      imageUrl: 'https://via.placeholder.com/150',
      price: 1100,
    ),
    const Medicine(
      id: '122',
      name: 'Guanylate Cyclase-C agonist',
      imageUrl: 'https://via.placeholder.com/150',
      price: 1150,
    ),
    const Medicine(
      id: '123',
      name: 'Calcium Blockers',
      imageUrl: 'https://via.placeholder.com/150',
      price: 1200,
    ),
    const Medicine(
      id: '124',
      name: 'Diuretics',
      imageUrl: 'https://via.placeholder.com/150',
      price: 1250,
    ),
    const Medicine(
      id: '125',
      name: 'Surgical Drill',
      imageUrl: 'https://via.placeholder.com/150',
      price: 5000,
    ),
    const Medicine(
      id: '126',
      name: 'Bone Saw',
      imageUrl: 'https://via.placeholder.com/150',
      price: 6000,
    ),
    const Medicine(
      id: '127',
      name: 'Microscope',
      imageUrl: 'https://via.placeholder.com/150',
      price: 7000,
    ),
    const Medicine(
      id: '128',
      name: 'Retractor',
      imageUrl: 'https://via.placeholder.com/150',
      price: 8000,
    ),
    const Medicine(
      id: '129',
      name: 'Surgical Scissors',
      imageUrl: 'https://via.placeholder.com/150',
      price: 9000,
    ),
    const Medicine(
      id: '130',
      name: 'Forceps',
      imageUrl: 'https://via.placeholder.com/150',
      price: 10000,
    ),
    const Medicine(
      id: '131',
      name: 'Electrocautery',
      imageUrl: 'https://via.placeholder.com/150',
      price: 11000,
    ),
    const Medicine(
      id: '132',
      name: 'Doppler Ultrasound',
      imageUrl: 'https://via.placeholder.com/150',
      price: 12000,
    ),
    const Medicine(
      id: '133',
      name: 'Suction Device',
      imageUrl: 'https://via.placeholder.com/150',
      price: 13000,
    ),
    const Medicine(
      id: '134',
      name: 'Sterilise Equipment',
      imageUrl: 'https://via.placeholder.com/150',
      price: 14000,
    ),
    const Medicine(
      id: '135',
      name: 'Cranial Clamp',
      imageUrl: 'https://via.placeholder.com/150',
      price: 15000,
    ),
    const Medicine(
      id: '136',
      name: 'Brain Retractor',
      imageUrl: 'https://via.placeholder.com/150',
      price: 16000,
    ),
    const Medicine(
      id: '137',
      name: 'Brain Knife',
      imageUrl: 'https://via.placeholder.com/150',
      price: 17000,
    ),
    const Medicine(
      id: '138',
      name: 'Brain Hook',
      imageUrl: 'https://via.placeholder.com/150',
      price: 18000,
    ),
    const Medicine(
      id: '139',
      name: 'Perforator',
      imageUrl: 'https://via.placeholder.com/150',
      price: 19000,
    ),
    const Medicine(
      id: '140',
      name: 'Cranial Rongeurs',
      imageUrl: 'https://via.placeholder.com/150',
      price: 20000,
    ),
    const Medicine(
      id: '141',
      name: 'Cranial Elevator',
      imageUrl: 'https://via.placeholder.com/150',
      price: 21000,
    ),
    const Medicine(
      id: '142',
      name: 'Neuroendoscope',
      imageUrl: 'https://via.placeholder.com/150',
      price: 22000,
    ),
    const Medicine(
      id: '143',
      name: 'Neurostimulator',
      imageUrl: 'https://via.placeholder.com/150',
      price: 23000,
    ),
    const Medicine(
      id: '144',
      name: 'Pressure Monitor',
      imageUrl: 'https://via.placeholder.com/150',
      price: 24000,
    ),
    const Medicine(
      id: '145',
      name: 'Neurosurgical Navigation',
      imageUrl: 'https://via.placeholder.com/150',
      price: 25000,
    ),
    const Medicine(
      id: '146',
      name: 'Bipolar Forceps',
      imageUrl: 'https://via.placeholder.com/150',
      price: 26000,
    ),
    const Medicine(
      id: '147',
      name: 'Neurovascular Clamp',
      imageUrl: 'https://via.placeholder.com/150',
      price: 27000,
    ),
    const Medicine(
      id: '148',
      name: 'Neurological Hammer',
      imageUrl: 'https://via.placeholder.com/150',
      price: 28000,
    ),
    const Medicine(
      id: '149',
      name: 'Microsurgical Instruments',
      imageUrl: 'https://via.placeholder.com/150',
      price: 29000,
    ),
    const Medicine(
      id: '150',
      name: 'Sterilization Tray',
      imageUrl: 'https://via.placeholder.com/150',
      price: 30000,
    ),
    const Medicine(
      id: '151',
      name: 'Guaifenesin',
      imageUrl: 'https://via.placeholder.com/150',
      price: 10,
    ),
    const Medicine(
      id: '152',
      name: 'Dextromethorphan',
      imageUrl: 'https://via.placeholder.com/150',
      price: 15,
    ),
    const Medicine(
      id: '153',
      name: 'Bromhexine',
      imageUrl: 'https://via.placeholder.com/150',
      price: 20,
    ),
    const Medicine(
      id: '154',
      name: 'Acetylcysteine',
      imageUrl: 'https://via.placeholder.com/150',
      price: 25,
    ),
    const Medicine(
      id: '155',
      name: 'N-acetylcysteine',
      imageUrl: 'https://via.placeholder.com/150',
      price: 30,
    ),
    const Medicine(
      id: '156',
      name: 'Ambroxol',
      imageUrl: 'https://via.placeholder.com/150',
      price: 35,
    ),
    const Medicine(
      id: '157',
      name: 'Salbutamol',
      imageUrl: 'https://via.placeholder.com/150',
      price: 40,
    ),
    const Medicine(
      id: '158',
      name: 'Levosalbutamol',
      imageUrl: 'https://via.placeholder.com/150',
      price: 45,
    ),
    const Medicine(
      id: '159',
      name: 'Terbutaline',
      imageUrl: 'https://via.placeholder.com/150',
      price: 50,
    ),
    const Medicine(
      id: '160',
      name: 'Ipratropium ',
      imageUrl: 'https://via.placeholder.com/150',
      price: 55,
    ),
    const Medicine(
      id: '161',
      name: 'Tiotropium ',
      imageUrl: 'https://via.placeholder.com/150',
      price: 60,
    ),
    const Medicine(
      id: '162',
      name: 'Formoterol',
      imageUrl: 'https://via.placeholder.com/150',
      price: 65,
    ),
    const Medicine(
      id: '163',
      name: 'Salmeterol',
      imageUrl: 'https://via.placeholder.com/150',
      price: 70,
    ),
    const Medicine(
      id: '164',
      name: 'Indacaterol',
      imageUrl: 'https://via.placeholder.com/150',
      price: 75,
    ),
    const Medicine(
      id: '165',
      name: 'Beclometasone',
      imageUrl: 'https://via.placeholder.com/150',
      price: 80,
    ),
    const Medicine(
      id: '166',
      name: 'Budesonide',
      imageUrl: 'https://via.placeholder.com/150',
      price: 85,
    ),
    const Medicine(
      id: '167',
      name: 'Fluticasone',
      imageUrl: 'https://via.placeholder.com/150',
      price: 90,
    ),
    const Medicine(
      id: '168',
      name: 'Ciclesonide',
      imageUrl: 'https://via.placeholder.com/150',
      price: 95,
    ),
    const Medicine(
      id: '169',
      name: 'Mometasone',
      imageUrl: 'https://via.placeholder.com/150',
      price: 100,
    ),
    const Medicine(
      id: '170',
      name: 'Montelukast',
      imageUrl: 'https://via.placeholder.com/150',
      price: 105,
    ),
    const Medicine(
      id: '171',
      name: 'Zafirlukast',
      imageUrl: 'https://via.placeholder.com/150',
      price: 110,
    ),
    const Medicine(
      id: '172',
      name: 'Zileuton',
      imageUrl: 'https://via.placeholder.com/150',
      price: 115,
    ),
    const Medicine(
      id: '173',
      name: 'Theophylline',
      imageUrl: 'https://via.placeholder.com/150',
      price: 120,
    ),
    const Medicine(
      id: '174',
      name: 'Aminophylline',
      imageUrl: 'https://via.placeholder.com/150',
      price: 125,
    ),
    const Medicine(
      id: '175',
      name: 'Cough Drops',
      imageUrl: 'https://via.placeholder.com/150',
      price: 130,
    ),
    const Medicine(
      id: '176',
      name: 'Cough Syrup',
      imageUrl: 'https://via.placeholder.com/150',
      price: 135,
    ),
    const Medicine(
      id: '177',
      name: 'Bronchodilator ',
      imageUrl: 'https://via.placeholder.com/150',
      price: 140,
    ),
    const Medicine(
      id: '178',
      name: 'Nebulizer',
      imageUrl: 'https://via.placeholder.com/150',
      price: 145,
    ),
    const Medicine(
      id: '179',
      name: 'Steam Inhaler',
      imageUrl: 'https://via.placeholder.com/150',
      price: 150,
    ),
    const Medicine(
      id: '180',
      name: 'Chest Percussion Vest',
      imageUrl: 'https://via.placeholder.com/150',
      price: 155,
    ),
    const Medicine(
      id: '181',
      name: 'Pseudoephedrine',
      imageUrl: 'https://via.placeholder.com/150',
      price: 10,
    ),
    const Medicine(
      id: '182',
      name: 'Phenylephrine',
      imageUrl: 'https://via.placeholder.com/150',
      price: 15,
    ),
    const Medicine(
      id: '183',
      name: 'Oxymetazoline',
      imageUrl: 'https://via.placeholder.com/150',
      price: 20,
    ),
    const Medicine(
      id: '184',
      name: 'Xylometazoline',
      imageUrl: 'https://via.placeholder.com/150',
      price: 25,
    ),
    const Medicine(
      id: '185',
      name: 'Naphazoline',
      imageUrl: 'https://via.placeholder.com/150',
      price: 30,
    ),
    const Medicine(
      id: '186',
      name: 'Diphenhydramine',
      imageUrl: 'https://via.placeholder.com/150',
      price: 35,
    ),
    const Medicine(
      id: '187',
      name: 'Chlorpheniramine',
      imageUrl: 'https://via.placeholder.com/150',
      price: 40,
    ),
    const Medicine(
      id: '188',
      name: 'Loratadine',
      imageUrl: 'https://via.placeholder.com/150',
      price: 45,
    ),
    const Medicine(
      id: '189',
      name: 'Cetirizine',
      imageUrl: 'https://via.placeholder.com/150',
      price: 50,
    ),
    const Medicine(
      id: '190',
      name: 'Fexofenadine',
      imageUrl: 'https://via.placeholder.com/150',
      price: 55,
    ),
    const Medicine(
      id: '191',
      name: 'Acetaminophen',
      imageUrl: 'https://via.placeholder.com/150',
      price: 60,
    ),
    const Medicine(
      id: '192',
      name: 'Ibuprofen',
      imageUrl: 'https://via.placeholder.com/150',
      price: 65,
    ),
    const Medicine(
      id: '193',
      name: 'Naproxen',
      imageUrl: 'https://via.placeholder.com/150',
      price: 70,
    ),
    const Medicine(
      id: '194',
      name: 'Aspirin',
      imageUrl: 'https://via.placeholder.com/150',
      price: 75,
    ),
    const Medicine(
      id: '195',
      name: 'Guaifenesin',
      imageUrl: 'https://via.placeholder.com/150',
      price: 80,
    ),
    const Medicine(
      id: '196',
      name: 'Dextromethorphan',
      imageUrl: 'https://via.placeholder.com/150',
      price: 85,
    ),
    const Medicine(
      id: '197',
      name: 'Phenylephrine',
      imageUrl: 'https://via.placeholder.com/150',
      price: 90,
    ),
    const Medicine(
      id: '198',
      name: 'Ipratropium Bromide',
      imageUrl: 'https://via.placeholder.com/150',
      price: 95,
    ),
    const Medicine(
      id: '199',
      name: 'Fluticasone',
      imageUrl: 'https://via.placeholder.com/150',
      price: 100,
    ),
    const Medicine(
      id: '200',
      name: 'Triamcinolone',
      imageUrl: 'https://via.placeholder.com/150',
      price: 105,
    ),
    const Medicine(
      id: '201',
      name: 'Azelastine',
      imageUrl: 'https://via.placeholder.com/150',
      price: 110,
    ),
    const Medicine(
      id: '202',
      name: 'Olopatadine',
      imageUrl: 'https://via.placeholder.com/150',
      price: 115,
    ),
    const Medicine(
      id: '203',
      name: 'Cromolyn',
      imageUrl: 'https://via.placeholder.com/150',
      price: 120,
    ),
    const Medicine(
      id: '204',
      name: 'Nedocromil',
      imageUrl: 'https://via.placeholder.com/150',
      price: 125,
    ),
    const Medicine(
      id: '205',
      name: 'Pseudoephedrine',
      imageUrl: 'https://via.placeholder.com/150',
      price: 130,
    ),
    const Medicine(
      id: '206',
      name: 'Chlorpheniramine',
      imageUrl: 'https://via.placeholder.com/150',
      price: 135,
    ),
    const Medicine(
      id: '207',
      name: 'Acetaminophen',
      imageUrl: 'https://via.placeholder.com/150',
      price: 140,
    ),
    const Medicine(
      id: '208',
      name: 'Guaifenesin',
      imageUrl: 'https://via.placeholder.com/150',
      price: 145,
    ),
    const Medicine(
      id: '209',
      name: 'Ibuprofen',
      imageUrl: 'https://via.placeholder.com/150',
      price: 150,
    ),
    const Medicine(
      id: '210',
      name: 'Naproxen',
      imageUrl: 'https://via.placeholder.com/150',
      price: 155,
    ),
    const Medicine(
      id: '211',
      name: 'Aspirin',
      imageUrl: 'https://via.placeholder.com/150',
      price: 160,
    ),
    const Medicine(
      id: '212',
      name: 'Albuterol',
      imageUrl: 'https://via.placeholder.com/150',
      price: 165,
    ),
    const Medicine(
      id: '213',
      name: 'Salmeterol',
      imageUrl: 'https://via.placeholder.com/150',
      price: 170,
    ),
  ];
  @override
  List<Object?> get props => throw UnimplementedError();
}
