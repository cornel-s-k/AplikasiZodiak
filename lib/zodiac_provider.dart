import 'package:flutter/material.dart';

class ZodiacProvider with ChangeNotifier {
  String _name = '';
  DateTime _birthDate = DateTime.now();

  // Getter
  String get name => _name;
  DateTime get birthDate => _birthDate;

  // Setter
  void setName(String value) {
    _name = value;
    notifyListeners();
  }

  void setBirthDate(DateTime value) {
    _birthDate = value;
    notifyListeners();
  }

  // Zodiak dan deskripsi
  String get zodiac => _getZodiacSign(_birthDate);

  String get zodiacDescription => _getZodiacDescription(zodiac);

  String get monthDescription => _getMonthDescription(_birthDate.month);

  // Logika penentuan zodiak
  String _getZodiacSign(DateTime date) {
    int day = date.day;
    int month = date.month;

    if ((month == 1 && day >= 20) || (month == 2 && day <= 18))
      return "Aquarius";
    if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) return "Pisces";
    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) return "Aries";
    if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) return "Taurus";
    if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) return "Gemini";
    if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) return "Cancer";
    if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) return "Leo";
    if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) return "Virgo";
    if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) return "Libra";
    if ((month == 10 && day >= 23) || (month == 11 && day <= 21))
      return "Scorpio";
    if ((month == 11 && day >= 22) || (month == 12 && day <= 21))
      return "Sagitarius";
    return "Capricorn";
  }

  // Deskripsi zodiak
  String _getZodiacDescription(String zodiac) {
    switch (zodiac) {
      case "Capricorn":
        return "Capricorn adalah zodiak bagi mereka yang lahir antara 21 Desember hingga 19 Januari, dengan lambang kambing. Orang yang berzodiak Capricorn dikenal mengutamakan kesuksesan, status, reputasi, loyalitas, tanggung jawab, serta kemampuan dalam berkonsentrasi dan memecahkan masalah. Mereka cenderung belajar melalui pengalaman dan menunjukkan kebijaksanaan. Meski begitu, Capricorn juga memiliki sisi negatif seperti cenderung pesimis, merasa terpaksa, membebani diri sendiri, takut menghadapi hambatan, kurang simpatik, terlalu khawatir, dan berpikiran sempit. Sebagai zodiak dengan kualitas kardinal, Capricorn termasuk tipe yang aktif dan cocok untuk memulai proyek baru, bersama dengan Aries, Cancer, dan Libra.";
      case "Aquarius":
        return "Aquarius adalah zodiak bagi mereka yang lahir antara 20 Januari hingga 18 Februari, dengan lambang gelombang atau alur air. Orang yang berzodiak Aquarius dikenal tertarik pada petualangan, bersifat kemanusiaan, ingin tahu, progresif, spontan, bersahabat, serta peduli pada hak asasi dan kelompok. Mereka juga mampu memberi manfaat bagi lingkungan sekitar. Namun, sisi negatif dari Aquarius adalah cenderung mengalami gangguan, sulit diandalkan, suka membantah, memberontak, tidak konsisten, berperilaku salah, dan memiliki perangai radikal yang dapat membawa masalah. Aquarius termasuk dalam zodiak berkategori tetap, yang mencerminkan stabilitas, ketabahan, ketahanan, dan kesempurnaan. Dengan sifat ini, Aquarius cocok untuk memastikan segala sesuatu berjalan dengan lancar dan berhasil. Zodiak tetap lainnya selain Aquarius adalah Taurus, Leo, dan Scorpio.";
      case "Pisces":
        return "Pisces adalah zodiak bagi mereka yang lahir antara 19 Februari hingga 20 Maret, dengan lambang ikan. Orang berzodiak Pisces dikenal mengutamakan cinta universal, bersifat manja, setia, dan puitis. Mereka cenderung religius, menyukai musik, memiliki kepekaan spiritual, serta mampu menghibur diri dan memahami perasaan orang lain. Selain itu, Pisces juga dikenal tidak mudah menyerah dan selalu mencari ilham. Namun, sisi negatifnya, mereka bisa merasa bingung, bersalah, mudah menyerah, kecewa, khawatir, bahkan terlibat dalam penipuan atau ketagihan, serta terlalu menurut pada kemauan hati. Pisces termasuk dalam kategori variabel atau fleksibel, yang berarti mereka memiliki kemampuan beradaptasi, berubah, dan menjaga keseimbangan, meskipun tidak selalu praktis. Zodiak fleksibel lainnya selain Pisces adalah Gemini, Virgo, dan Sagitarius.";
      case "Aries":
        return "Aries adalah zodiak bagi mereka yang lahir antara 21 Maret hingga 20 April, dengan lambang biri-biri jantan. Orang berzodiak Aries dikenal sebagai pribadi yang berani, percaya diri, penuh inisiatif, dan mengutamakan tindakan. Mereka memiliki jiwa perintis, daya juang tinggi, serta kemampuan mempertahankan diri dan memperjuangkan nasib. Namun, sisi negatif dari Aries adalah cenderung terlalu banyak berpikir, bisa bersikap kasar, sombong, agresif, gemar memicu konflik, serta hasil kerja yang kurang sempurna karena terburu-buru. Aries termasuk dalam kategori kardinal, yaitu tipe zodiak yang aktif dan dinilai baik untuk memulai proyek baru. Zodiak lain yang juga termasuk dalam kategori kardinal adalah Capricorn, Cancer, dan Libra.";
      case "Taurus":
        return "Taurus adalah zodiak bagi mereka yang lahir antara 21 April hingga 20 Mei, dengan lambang lembu jantan. Taurus dikenal mengutamakan kekayaan, spiritualitas, ketabahan, loyalitas, serta memiliki rasa yang kuat dan suka kenyamanan. Mereka juga praktis, murah rezeki, dan menyukai kesenangan hidup. Namun, Taurus bisa menjadi terlalu materialistis, keras kepala, emosional, dan sulit berpikir jernih. Taurus termasuk dalam zodiak tetap, yang mencerminkan stabilitas, daya tahan, dan kesempurnaan, cocok untuk memastikan segala sesuatu berjalan dengan baik. Zodiak tetap lainnya adalah Aquarius, Leo, dan Scorpio.";
      case "Gemini":
        return "Gemini adalah zodiak bagi mereka yang lahir antara 21 Mei hingga 20 Juni, dengan lambang saudara kembar. Gemini dikenal terampil berkomunikasi, cerdas, serbaguna, suka bepergian, serta memiliki kemampuan berbicara dan menulis. Mereka juga terbuka dan dekat dengan keluarga serta lingkungan sekitar. Namun, Gemini bisa bersikap gugup, bermuka dua, keanak-anakan, berpura-pura, dan sering hanya tertarik pada sesuatu dalam waktu singkat. Gemini termasuk zodiak variabel, yang berarti mudah beradaptasi, berubah, dan menjaga keseimbangan. Zodiak variabel lainnya adalah Pisces, Virgo, dan Sagitarius.";
      case "Cancer":
        return "Cancer adalah zodiak bagi mereka yang lahir antara 21 Juni hingga 20 Juli, dengan lambang kepiting. Cancer dikenal suka dengan rumah tangga, keluarga, kesehatan, dan makanan. Mereka memiliki simpati, kesabaran, kejujuran, serta kecerdasan. Namun, Cancer terkadang bisa bersikap kekanak-kanakan, berbolak-balik, berpura-pura, merasa tidak aman, terlalu bertahan, dan takut pada perpisahan. Cancer termasuk dalam zodiak kardinal, yang berarti aktif dan cocok untuk memulai proyek baru, bersama Aries, Capricorn, dan Libra.";
      case "Leo":
        return "Leo adalah zodiak bagi mereka yang lahir antara 21 Juli hingga 21 Agustus, dengan lambang singa. Leo dikenal mengutamakan cinta, ramah, pemurah, dan memiliki daya kepemimpinan. Mereka menonjolkan kemegahan, keberanian, serta kemampuan, dan dekat dengan anak-anak. Leo juga berbakat dan menyukai hiburan. Namun, sisi negatifnya, Leo terkadang menunjukkan ego, banyak bicara, sifat kekuasaan, suka pamer, mengejar kemewahan, serta perasaan rendah diri dan bangga diri. Leo termasuk dalam zodiak tetap, yang mencerminkan stabilitas, ketabahan, dan kesempurnaan, cocok untuk memastikan segala sesuatu berjalan lancar. Zodiak tetap lainnya adalah Taurus, Aquarius, dan Scorpio.";
      case "Virgo":
        return "Virgo adalah zodiak bagi mereka yang lahir antara 22 Agustus hingga 22 September, dengan lambang seorang gadis. Virgo dikenal suka bekerja dan mengutamakan hasil kerja sempurna. Mereka memiliki kesadaran, konsentrasi, disiplin, dan praktis, serta siap melayani dan bersikap komprehensif. Namun, Virgo terkadang bisa khawatir, cerewet, terlalu tertib, suka mengeluh, dan mengkritik. Virgo termasuk dalam zodiak variabel, yang berarti mudah beradaptasi dan berubah, serta kreatif meskipun tidak selalu praktis. Zodiak variabel lainnya adalah Gemini, Pisces, dan Sagitarius.";
      case "Libra":
        return "Libra adalah zodiak bagi mereka yang lahir antara 23 September hingga 22 Oktober, dengan lambang alat penimbang (dacin). Libra dikenal memiliki sifat harmonis, seimbang, dan menyukai pernikahan serta hubungan yang baik. Mereka mengutamakan kesetaraan, diplomasi, seniman, suka membantu, ceria, dan dapat menjadi pasangan yang ideal. Namun, Libra terkadang bisa bersikap bolak-balik, pura-pura, tidak jujur, serta kurang tegas dan seimbang dalam bertindak. Libra termasuk dalam kategori kardinal, yaitu aktif dan baik untuk memulai proyek baru. Zodiak kardinal lainnya adalah Aries, Cancer, dan Capricorn.";
      case "Scorpio":
        return "Scorpio adalah zodiak bagi mereka yang lahir antara 23 Oktober hingga 22 November, dengan lambang kalajengking. Scorpio dikenal memiliki kemewahan, kreativitas, keinginan yang kuat, stamina tinggi, dan daya sensual yang besar, serta bakat dalam menyembuhkan. Namun, Scorpio juga cenderung mudah cemburu, suka menuntut bela, ekstrim, fanatik, tamak, dan bisa sangat berbahaya saat menyerang. Scorpio termasuk dalam zodiak tetap, yang mencerminkan stabilitas, ketabahan, dan kesempurnaan, cocok untuk memastikan segala sesuatu berjalan lancar. Zodiak tetap lainnya adalah Taurus, Leo, dan Aquarius.";
      case "Sagitarius":
        return "Sagitarius adalah zodiak bagi mereka yang lahir antara 23 November hingga 20 Desember, dengan lambang pemanah. Sagitarius dikenal memiliki minat belajar, optimisme, cita-cita tinggi, dan pemahaman diri. Mereka juga memiliki hati nurani, berpegang pada agama, bijaksana, dan suka eksplorasi serta memiliki berbagai impian. Namun, Sagitarius terkadang bisa lalai, tidak mematuhi hukum, gelisah, pemboros, terlalu mengikuti kehendak hati, serta tidak jujur dan tidak bertanggung jawab. Sagitarius termasuk dalam kategori variabel, yang berarti mudah beradaptasi dan berubah, serta kreatif meskipun tidak selalu praktis. Zodiak variabel lainnya adalah Gemini, Virgo, dan Pisces.";
      default:
        return "Zodiak tidak dikenali.";
    }
  }

  // Deskripsi berdasarkan bulan lahir
  String _getMonthDescription(int month) {
    switch (month) {
      case 1:
        return "Januari, Si Ambisius\n"
            "Orang yang lahir di bulan Januari cenderung memiliki sifat keras kepala dan ambisius, terutama dalam hal karir. "
            "Mereka juga dikenal sebagai people watcher, suka mengamati orang lain untuk mempelajari kehidupan dan sifat-sifat mereka. "
            "Uniknya, mereka sering belajar mengenali diri sendiri melalui observasi terhadap orang lain. Selain itu, mereka memiliki keinginan kuat untuk membantu orang lain dalam hal improvisasi diri. "
            "Kemampuan kepemimpinan ini bisa sangat bermanfaat, namun perlu diimbangi dengan kemampuan untuk memposisikan diri agar karakteristik unik ini memberikan manfaat dalam kehidupan pribadi dan karir.";

      case 2:
        return "Februari, Si Pemikir yang Filosofis\n"
            "Individu kelahiran Februari cenderung artistik, kreatif, dan cerdas, dengan sifat sebagai free thinker. "
            "Mereka sering memberontak jika merasa aturan tidak adil dan memiliki pemahaman diri yang mendalam.";

      case 3:
        return "Maret, Si Penengah Konflik\n"
            "Mereka yang lahir di bulan Maret cenderung pemalu, namun sangat harmonis, sering dianggap sebagai penengah konflik karena kemampuan mereka untuk menciptakan keseimbangan dan kedamaian.";

      case 4:
        return "April, Si Penyuka Tantangan\n"
            "Individu kelahiran April memiliki sifat kuat dan atletis, menyukai tantangan, serta mampu mengatasi rasa takut. "
            "Mereka cenderung cepat merasa senang ketika dihargai atas kerja keras mereka.";

      case 5:
        return "Mei, Si Cerdas yang Atraktif\n"
            "Lahir di bulan Mei, individu dikenal cerdas, logis, dan atraktif. Mereka cenderung sukses di bidang ilmiah dan sangat suka bermain dengan fakta serta memiliki rencana masa depan yang jelas.";

      case 6:
        return "Juni, Si Kalem\n"
            "Mereka yang lahir di bulan Juni sensitif, peka, dan pendengar yang baik. Sifat peduli mereka sering membuat orang datang untuk mencari saran, meski terkadang mereka cenderung mengalah demi orang lain.";

      case 7:
        return "Juli, Si Extrovert\n"
            "Individu kelahiran Juli sangat enerjik, memiliki pesona yang membuat orang nyaman berada di sekitar mereka, dan senang menghibur orang lain dengan selera humor mereka.";

      case 8:
        return "Agustus, Si Pemimpin Alami\n"
            "Mereka yang lahir di Agustus memiliki bakat alami dalam kepemimpinan, meskipun tidak selalu menyadari potensi ini. "
            "Karakter mereka mengagumkan dan mereka bisa sukses baik dalam bisnis maupun kehidupan pribadi.";

      case 9:
        return "September, Si Penyuka Detail\n"
            "Individu kelahiran September sangat perfeksionis dan fokus pada detail. Mereka memiliki manajemen waktu yang baik dan ekspektasi tinggi terhadap hal-hal yang berhubungan dengan organisasi.";

      case 10:
        return "Oktober, Si Penebar Aura Positif\n"
            "Lahir di bulan Oktober, individu bersifat independen dan selalu melihat sisi positif dari hidup. "
            "Mereka menyenangkan, mudah bergaul, dan sering dijadikan tempat bergantung oleh orang lain.";

      case 11:
        return "November, Si Pengamat yang Misterius\n"
            "Mereka yang lahir di bulan November cenderung keras kepala dan sangat tertutup tentang kehidupan pribadi mereka. "
            "Sifat mereka yang fokus, peka, dan mandiri membuat mereka tidak mudah menerima bantuan dari orang lain.";

      case 12:
        return "Desember, Si Kuat yang Inspiratif\n"
            "Individu kelahiran Desember aktif, senang menjadi pusat perhatian, dan sangat gigih membela harga diri. "
            "Mereka dikenal karena keberanian dan kesetiaan terhadap prinsip mereka.";

      default:
        return "Bulan tidak dikenali.";
    }
  }
}
