import 'package:get_it_package_demo/repository/meme_repo.dart';

import '../locator.dart';

class MemeDomainController {
  getNextMeme() async {
    // TODO: Call the Repository and receive a meme
    return await getIt.get<MemeRepo>().getMeme();
  }
}
