import '../models/champion.dart';

class ChampionService {
  static final List<Champion> champions = [
    // ㄱ
    const Champion(id: 'Garen', name: '가렌', imageUrl: 'Garen'),
    const Champion(id: 'Galio', name: '갈리오', imageUrl: 'Galio'),
    const Champion(id: 'Gangplank', name: '갱플랭크', imageUrl: 'Gangplank'),
    const Champion(id: 'Gragas', name: '그라가스', imageUrl: 'Gragas'),
    const Champion(id: 'Graves', name: '그레이브즈', imageUrl: 'Graves'),
    const Champion(id: 'Gwen', name: '그웬', imageUrl: 'Gwen'),
    // ㄴ
    const Champion(id: 'Gnar', name: '나르', imageUrl: 'Gnar'),
    const Champion(id: 'Nami', name: '나미', imageUrl: 'Nami'),
    const Champion(id: 'Nasus', name: '나서스', imageUrl: 'Nasus'),
    const Champion(id: 'Naafiri', name: '나피리', imageUrl: 'Naafiri'),
    const Champion(id: 'Nautilus', name: '노틸러스', imageUrl: 'Nautilus'),
    const Champion(id: 'Nocturne', name: '녹턴', imageUrl: 'Nocturne'),
    const Champion(id: 'Nunu', name: '누누와 윌럼프', imageUrl: 'Nunu'),
    const Champion(id: 'Nidalee', name: '니달리', imageUrl: 'Nidalee'),
    const Champion(id: 'Neeko', name: '니코', imageUrl: 'Neeko'),
    const Champion(id: 'Nilah', name: '닐라', imageUrl: 'Nilah'),
    // ㄷ
    const Champion(id: 'Darius', name: '다리우스', imageUrl: 'Darius'),
    const Champion(id: 'Diana', name: '다이애나', imageUrl: 'Diana'),
    const Champion(id: 'Draven', name: '드레이븐', imageUrl: 'Draven'),
    // ㄹ
    const Champion(id: 'Ryze', name: '라이즈', imageUrl: 'Ryze'),
    const Champion(id: 'Rakan', name: '라칸', imageUrl: 'Rakan'),
    const Champion(id: 'Rammus', name: '람머스', imageUrl: 'Rammus'),
    const Champion(id: 'Lux', name: '럭스', imageUrl: 'Lux'),
    const Champion(id: 'Rumble', name: '럼블', imageUrl: 'Rumble'),
    //레나타
    const Champion(id: 'Renata', name: '레나타', imageUrl: 'Renata'),
    const Champion(id: 'Renekton', name: '레넥톤', imageUrl: 'Renekton'),
    const Champion(id: 'Leona', name: '레오나', imageUrl: 'Leona'),
    const Champion(id: 'RekSai', name: '렉사이', imageUrl: 'RekSai'),
    const Champion(id: 'Rell', name: '렐', imageUrl: 'Rell'),
    const Champion(id: 'Rengar', name: '렝가', imageUrl: 'Rengar'),
    // 렉사이
    //렐
    // 렝가
    const Champion(id: 'Lucian', name: '루시안', imageUrl: 'Lucian'),
    const Champion(id: 'Lulu', name: '룰루', imageUrl: 'Lulu'),
    const Champion(id: 'Leblanc', name: '르블랑', imageUrl: 'Leblanc'),
    const Champion(id: 'LeeSin', name: '리신', imageUrl: 'LeeSin'),
    const Champion(id: 'Riven', name: '리븐', imageUrl: 'Riven'),
    const Champion(id: 'Lissandra', name: '리산드라', imageUrl: 'Lissandra'),
    const Champion(id: 'Lillia', name: '릴리아', imageUrl: 'Lillia'),
    const Champion(id: 'MasterYi', name: '마스터 이', imageUrl: 'MasterYi'),
    const Champion(id: 'Maokai', name: '마오카이', imageUrl: 'Maokai'),
    const Champion(id: 'Malzahar', name: '말자하', imageUrl: 'Malzahar'),

    // ㅁ
    const Champion(id: 'Malphite', name: '말파이트', imageUrl: 'Malphite'),
    const Champion(id: 'Mordekaiser', name: '모데카이저', imageUrl: 'Mordekaiser'),
    const Champion(id: 'Morgana', name: '모르가나', imageUrl: 'Morgana'),
    // 문도바사
    const Champion(id: 'DrMundo', name: '문도 박사', imageUrl: 'DrMundo'),
    const Champion(id: 'MissFortune', name: '미스 포츈', imageUrl: 'MissFortune'),
    const Champion(id: 'Milio', name: '밀리오', imageUrl: 'Milio'),
    // ㅂ
    const Champion(id: 'Bard', name: '바드', imageUrl: 'Bard'),
    const Champion(id: 'Varus', name: '바루스', imageUrl: 'Varus'),

    const Champion(id: 'Vi', name: '바이', imageUrl: 'Vi'),
    const Champion(id: 'Veigar', name: '베이가', imageUrl: 'Veigar'),
    const Champion(id: 'Vayne', name: '베인', imageUrl: 'Vayne'),
    const Champion(id: 'Vex', name: '벡스', imageUrl: 'Vex'),
    const Champion(id: 'Velkoz', name: '벨코즈', imageUrl: 'Velkoz'),
    const Champion(id: 'Belveth', name: '벨베스', imageUrl: 'Belveth'),
    const Champion(id: 'Volibear', name: '볼리베어', imageUrl: 'Volibear'),
    const Champion(id: 'Braum', name: '브라움', imageUrl: 'Braum'),
    const Champion(id: 'Brand', name: '브랜드', imageUrl: 'Brand'),
    const Champion(id: 'Briar', name: '브라이어', imageUrl: 'Briar'),
    const Champion(id: 'Vladimir', name: '블라디미르', imageUrl: 'Vladimir'),
    const Champion(id: 'Blitzcrank', name: '블리츠크랭크', imageUrl: 'Blitzcrank'),
    const Champion(id: 'Viego', name: '비에고', imageUrl: 'Viego'),
    const Champion(id: 'Viktor', name: '빅토르', imageUrl: 'Viktor'),

    //ㅃ
    const Champion(id: 'Poppy', name: '뽀삐', imageUrl: 'Poppy'),

    // ㅅ
    const Champion(id: 'Samira', name: '사미라', imageUrl: 'Samira'),
    const Champion(id: 'Sion', name: '사이온', imageUrl: 'Sion'),
    const Champion(id: 'Sylas', name: '사일러스', imageUrl: 'Sylas'),
    const Champion(id: 'Shaco', name: '샤코', imageUrl: 'Shaco'),
    const Champion(id: 'Senna', name: '세나', imageUrl: 'Senna'),
    const Champion(id: 'Seraphine', name: '세라핀', imageUrl: 'Seraphine'),
    const Champion(id: 'Sejuani', name: '세주아니', imageUrl: 'Sejuani'),
    const Champion(id: 'Sett', name: '세트', imageUrl: 'Sett'),
    const Champion(id: 'Sona', name: '소나', imageUrl: 'Sona'),
    const Champion(id: 'Soraka', name: '소라카', imageUrl: 'Soraka'),
    const Champion(id: 'Shen', name: '쉔', imageUrl: 'Shen'),
    const Champion(id: 'Shyvana', name: '쉬바나', imageUrl: 'Shyvana'),
    const Champion(id: 'Smolder', name: '스몰더', imageUrl: 'Smolder'),

    const Champion(id: 'Swain', name: '스웨인', imageUrl: 'Swain'),
    const Champion(id: 'Skarner', name: '스카너', imageUrl: 'Skarner'),
    const Champion(id: 'Sivir', name: '시비르', imageUrl: 'Sivir'),
    const Champion(id: 'XinZhao', name: '신 짜오', imageUrl: 'XinZhao'),

    const Champion(id: 'Syndra', name: '신드라', imageUrl: 'Syndra'),
    const Champion(id: 'Singed', name: '신지드', imageUrl: 'Singed'),
    const Champion(id: 'Thresh', name: '스레시', imageUrl: 'Thresh'),
    //스레시
    // ㅇ
    const Champion(id: 'Ahri', name: '아리', imageUrl: 'Ahri'),
    const Champion(id: 'Amumu', name: '아무무', imageUrl: 'Amumu'),
    const Champion(id: 'AurelionSol', name: '아우렐리온 솔', imageUrl: 'AurelionSol'),
    const Champion(id: 'Ivern', name: '아이번', imageUrl: 'Ivern'),
    const Champion(id: 'Azir', name: '아지르', imageUrl: 'Azir'),

    const Champion(id: 'Akali', name: '아칼리', imageUrl: 'Akali'),
    //아크샨
    const Champion(id: 'Akshan', name: '아크샨', imageUrl: 'Akshan'),
    const Champion(id: 'Aatrox', name: '아트록스', imageUrl: 'Aatrox'),
    const Champion(id: 'Aphelios', name: '아펠리오스', imageUrl: 'Aphelios'),

    const Champion(id: 'Alistar', name: '알리스타', imageUrl: 'Alistar'),
    const Champion(id: 'Annie', name: '애니', imageUrl: 'Annie'),
    const Champion(id: 'Anivia', name: '애니비아', imageUrl: 'Anivia'),
    const Champion(id: 'Ashe', name: '애쉬', imageUrl: 'Ashe'),


    //야스오
    const Champion(id: 'Yasuo', name: '야스오', imageUrl: 'Yasuo'),
    const Champion(id: 'Ekko', name: '에코', imageUrl: 'Ekko'),
    const Champion(id: 'Elise', name: '엘리스', imageUrl: 'Elise'),
    const Champion(id: 'MonkeyKing', name: '오공', imageUrl: 'MonkeyKing'),

    const Champion(id: 'Aurora', name: '오로라', imageUrl: 'Aurora'),
    const Champion(id: 'Ornn', name: '오른', imageUrl: 'Ornn'),
    const Champion(id: 'Orianna', name: '오리아나', imageUrl: 'Orianna'),
    const Champion(id: 'Olaf', name: '올라프', imageUrl: 'Olaf'),

    const Champion(id: 'Yone', name: '요네', imageUrl: 'Yone'),
    const Champion(id: 'Yorick', name: '요릭', imageUrl: 'Yorick'),
    const Champion(id: 'Udyr', name: '우디르', imageUrl: 'Udyr'),
    const Champion(id: 'Urgot', name: '우르곳', imageUrl: 'Urgot'),

    const Champion(id: 'Warwick', name: '워윅', imageUrl: 'Warwick'),
    const Champion(id: 'Yuumi', name: '유미', imageUrl: 'Yuumi'),
    const Champion(id: 'Irelia', name: '이렐리아', imageUrl: 'Irelia'),
    const Champion(id: 'Evelynn', name: '이블린', imageUrl: 'Evelynn'),

    const Champion(id: 'Ezreal', name: '이즈리얼', imageUrl: 'Ezreal'),
    const Champion(id: 'Illaoi', name: '일라오이', imageUrl: 'Illaoi'),
    const Champion(id: 'Ambessa', name: '암베사', imageUrl: 'Ambessa'),
    // ㅈ
    const Champion(id: 'JarvanIV', name: '자르반 4세', imageUrl: 'JarvanIV'),
    const Champion(id: 'Xayah', name: '자야', imageUrl: 'Xayah'),

    const Champion(id: 'Zyra', name: '자이라', imageUrl: 'Zyra'),
    const Champion(id: 'Zac', name: '자크', imageUrl: 'Zac'),
    const Champion(id: 'Janna', name: '잔나', imageUrl: 'Janna'),
    const Champion(id: 'Jax', name: '잭스', imageUrl: 'Jax'),

    const Champion(id: 'Zed', name: '제드', imageUrl: 'Zed'),
    const Champion(id: 'Xerath', name: '제라스', imageUrl: 'Xerath'),
    const Champion(id: 'Zeri', name: '제리', imageUrl: 'Zeri'),
    const Champion(id: 'Jayce', name: '제이스', imageUrl: 'Jayce'),

    const Champion(id: 'Zoe', name: '조이', imageUrl: 'Zoe'),
    const Champion(id: 'Ziggs', name: '직스', imageUrl: 'Ziggs'),
    const Champion(id: 'Jhin', name: '진', imageUrl: 'Jhin'),
    const Champion(id: 'Zilean', name: '질리언', imageUrl: 'Zilean'),

    const Champion(id: 'Jinx', name: '징크스', imageUrl: 'Jinx'),
    // ㅊ
    const Champion(id: 'Chogath', name: '초가스', imageUrl: 'ChoGath'),
    // ㅋ
    const Champion(id: 'Karma', name: '카르마', imageUrl: 'Karma'),
    const Champion(id: 'Camille', name: '카밀', imageUrl: 'Camille'),

    const Champion(id: 'Kassadin', name: '카사딘', imageUrl: 'Kassadin'),
    const Champion(id: 'Karthus', name: '카서스', imageUrl: 'Karthus'),
    const Champion(id: 'Cassiopeia', name: '카시오페아', imageUrl: 'Cassiopeia'),
    const Champion(id: 'Kaisa', name: '카이사', imageUrl: 'KaiSa'),

    const Champion(id: 'Khazix', name: '카직스', imageUrl: 'KhaZix'),
    const Champion(id: 'Katarina', name: '카타리나', imageUrl: 'Katarina'),
    const Champion(id: 'Kalista', name: '칼리스타', imageUrl: 'Kalista'),
    const Champion(id: 'Kennen', name: '케넨', imageUrl: 'Kennen'),

    const Champion(id: 'Caitlyn', name: '케이틀린', imageUrl: 'Caitlyn'),
    const Champion(id: 'Kayn', name: '케인', imageUrl: 'Kayn'),
    const Champion(id: 'Kayle', name: '케일', imageUrl: 'Kayle'),
    const Champion(id: 'KogMaw', name: '코그모', imageUrl: 'KogMaw'),

    const Champion(id: 'Corki', name: '코르키', imageUrl: 'Corki'),
    const Champion(id: 'Quinn', name: '퀸', imageUrl: 'Quinn'),
    const Champion(id: 'KSante', name: '크산테', imageUrl: 'KSante'),
    const Champion(id: 'Kled', name: '클레드', imageUrl: 'Kled'),

    const Champion(id: 'Qiyana', name: '키아나', imageUrl: 'Qiyana'),
    // ㅌ
    const Champion(id: 'Kindred', name: '킨드레드', imageUrl: 'Kindred'),
    const Champion(id: 'Taric', name: '타릭', imageUrl: 'Taric'),
    const Champion(id: 'Talon', name: '탈론', imageUrl: 'Talon'),


    const Champion(id: 'Taliyah', name: '탈리야', imageUrl: 'Taliyah'),
    const Champion(id: 'TahmKench', name: '탐 켄치', imageUrl: 'TahmKench'),
    const Champion(id: 'Trundle', name: '트런들', imageUrl: 'Trundle'),
    const Champion(id: 'Tristana', name: '트리스타나', imageUrl: 'Tristana'),

    const Champion(id: 'Tryndamere', name: '트린다미어', imageUrl: 'Tryndamere'),
    const Champion(id: 'TwistedFate', name: '트위스티드 페이트', imageUrl: 'TwistedFate'),
    const Champion(id: 'Twitch', name: '트위치', imageUrl: 'Twitch'),
    const Champion(id: 'Teemo', name: '티모', imageUrl: 'Teemo'),

    const Champion(id: 'Pyke', name: '파이크', imageUrl: 'Pyke'),
    const Champion(id: 'Pantheon', name: '판테온', imageUrl: 'Pantheon'),
    const Champion(id: 'Fiddlesticks', name: '피들스틱', imageUrl: 'Fiddlesticks'),
    const Champion(id: 'Fiora', name: '피오라', imageUrl: 'Fiora'),
    // ㅍ
    const Champion(id: 'Fizz', name: '피즈', imageUrl: 'Fizz'),
    const Champion(id: 'Heimerdinger', name: '하이머딩거', imageUrl: 'Heimerdinger'),
    // ㅎ
    const Champion(id: 'Hecarim', name: '헤카림', imageUrl: 'Hecarim'),
    const Champion(id: 'Hwei', name: '흐웨이', imageUrl: 'Hwei'),
    //흐웨이

  ];

  static int get championLength => champions.length;

  static List<Champion> getAvailableChampions({
    required List<Champion> bannedChampions,
    required List<Champion> pickedChampions,
  }) {
    final unavailableChampions = [...bannedChampions, ...pickedChampions];
    return champions
        .where((champion) => !unavailableChampions.contains(champion))
        .toList();
  }

  static List<Champion> searchChampions(String query) {
    if (query.isEmpty) return champions;

    return champions
        .where((champion) =>
            champion.name.toLowerCase().contains(query.toLowerCase()) ||
            champion.id.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
