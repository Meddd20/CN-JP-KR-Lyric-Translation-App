import 'dart:convert';

import 'package:Versalex/core/helpers/glossary_from_chunk.dart';
import 'package:Versalex/core/models/song_lyric.dart';
import 'package:Versalex/core/helpers/system_prompt.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_transcript_api/youtube_transcript_api.dart';

part 'gemini_services.g.dart';

class GeminiService {
  static const _baseURL = "https://api.groq.com/openai/v1/chat/completions";
  static const _cjkCode = ['ja', 'ko', 'zh-Hans', 'zh-Hant'];
  final api = YouTubeTranscriptApi();
  final jsonFormatter = JsonFormatter(pretty: true);
  final dummyData = {
    "metadata": {
      "title": "走了很遠的路 (Walking a Long Way)",
      "artist": "呂口口 (Lü Kou Kou)",
      "script_language": "zh",
      "difficulty": "Intermediate",
      "tags": ["Mandarin", "Pop", "Emotional", "Life"]
    },
    "lyrics": [
      {
        "line_id": "l1",
        "start_time": 0.0,
        "end_time": 3.0,
        "surface_text": "離開家的距離",
        "reading_text": "lí kāi jiā de jù lí",
        "translation": {"id": "Jarak meninggalkan rumah", "en": "The distance leaving home"},
        "chunks": [
          {
            "surface": "離開",
            "reading": "lí kāi",
            "meaning": {"en": "to leave", "id": "meninggalkan"},
            "is_keyword": true
          },
          {
            "surface": "家",
            "reading": "jiā",
            "meaning": {"en": "home", "id": "rumah"},
            "is_keyword": true
          },
          {
            "surface": "的",
            "reading": "de",
            "meaning": {"en": "possessive particle", "id": "partikel kepemilikan"},
            "is_keyword": true
          },
          {
            "surface": "距離",
            "reading": "jù lí",
            "meaning": {"en": "distance", "id": "jarak"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l2",
        "start_time": 3.0,
        "end_time": 6.5,
        "surface_text": "大約有好幾百公里",
        "reading_text": "dà yuē yǒu hǎo jǐ bǎi gōng lǐ",
        "translation": {"id": "Sekitar beberapa ratus kilometer jauhnya", "en": "Is about several hundred kilometers"},
        "chunks": [
          {
            "surface": "大約",
            "reading": "dà yuē",
            "meaning": {"en": "approximately", "id": "kira-kira"},
            "is_keyword": true
          },
          {
            "surface": "有",
            "reading": "yǒu",
            "meaning": {"en": "has", "id": "ada"},
            "is_keyword": true
          },
          {
            "surface": "好幾百",
            "reading": "hǎo jǐ bǎi",
            "meaning": {"en": "several hundred", "id": "beberapa ratus"},
            "is_keyword": true
          },
          {
            "surface": "公里",
            "reading": "gōng lǐ",
            "meaning": {"en": "kilometer", "id": "kilometer"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l3",
        "start_time": 6.5,
        "end_time": 10.0,
        "surface_text": "導航不太熟悉",
        "reading_text": "dǎo háng bú tài shú xī",
        "translation": {"id": "Tidak terlalu familiar dengan navigasi", "en": "Not very familiar with the navigation"},
        "chunks": [
          {
            "surface": "導航",
            "reading": "dǎo háng",
            "meaning": {"en": "navigation", "id": "navigasi"},
            "is_keyword": true
          },
          {
            "surface": "不太",
            "reading": "bú tài",
            "meaning": {"en": "not very", "id": "tidak terlalu"},
            "is_keyword": true
          },
          {
            "surface": "熟悉",
            "reading": "shú xī",
            "meaning": {"en": "familiar", "id": "akrab"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l4",
        "start_time": 10.0,
        "end_time": 14.0,
        "surface_text": "經常分不清南北東西",
        "reading_text": "jīng cháng fēn bù qīng nán běi dōng xī",
        "translation": {"id": "Seringkali tidak bisa membedakan arah", "en": "Often unable to distinguish directions"},
        "chunks": [
          {
            "surface": "經常",
            "reading": "jīng cháng",
            "meaning": {"en": "often", "id": "sering"},
            "is_keyword": true
          },
          {
            "surface": "分不清",
            "reading": "fēn bù qīng",
            "meaning": {"en": "cannot distinguish", "id": "tidak bisa membedakan"},
            "is_keyword": true
          },
          {
            "surface": "南北東西",
            "reading": "nán běi dōng xī",
            "meaning": {"en": "north south east west", "id": "utara selatan timur barat"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l5",
        "start_time": 14.0,
        "end_time": 17.5,
        "surface_text": "時常告訴自己",
        "reading_text": "shí cháng gào sù zì jǐ",
        "translation": {"id": "Sering memberitahu diri sendiri", "en": "Constantly telling myself"},
        "chunks": [
          {
            "surface": "時常",
            "reading": "shí cháng",
            "meaning": {"en": "constantly", "id": "kerap kali"},
            "is_keyword": true
          },
          {
            "surface": "告訴",
            "reading": "gào sù",
            "meaning": {"en": "to tell", "id": "memberitahu"},
            "is_keyword": true
          },
          {
            "surface": "自己",
            "reading": "zì jǐ",
            "meaning": {"en": "oneself", "id": "diri sendiri"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l6",
        "start_time": 17.5,
        "end_time": 21.0,
        "surface_text": "一個人走也沒關係",
        "reading_text": "yī gè rén zǒu yě méi guān xì",
        "translation": {"id": "Berjalan sendirian juga tidak apa-apa", "en": "It's okay to walk alone"},
        "chunks": [
          {
            "surface": "一個人",
            "reading": "yī gè rén",
            "meaning": {"en": "alone", "id": "sendirian"},
            "is_keyword": true
          },
          {
            "surface": "走",
            "reading": "zǒu",
            "meaning": {"en": "walk", "id": "berjalan"},
            "is_keyword": true
          },
          {
            "surface": "也",
            "reading": "yě",
            "meaning": {"en": "also", "id": "juga"},
            "is_keyword": true
          },
          {
            "surface": "沒關係",
            "reading": "méi guān xì",
            "meaning": {"en": "it's okay", "id": "tidak apa-apa"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l7",
        "start_time": 21.0,
        "end_time": 25.0,
        "surface_text": "受的委屈提醒著我要爭氣",
        "reading_text": "shòu de wěi qu tí xǐng zhe wǒ yào zhēng qì",
        "translation": {
          "id": "Ketidakadilan yang kualami mengingatkanku untuk sukses",
          "en": "The grievances I suffered remind me to succeed"
        },
        "chunks": [
          {
            "surface": "受",
            "reading": "shòu",
            "meaning": {"en": "suffer", "id": "menderita"},
            "is_keyword": true
          },
          {
            "surface": "的",
            "reading": "de",
            "meaning": {"en": "particle", "id": "partikel"},
            "is_keyword": true
          },
          {
            "surface": "委屈",
            "reading": "wěi qu",
            "meaning": {"en": "grievance", "id": "ketidakadilan"},
            "is_keyword": true
          },
          {
            "surface": "提醒",
            "reading": "tí xǐng",
            "meaning": {"en": "remind", "id": "mengingatkan"},
            "is_keyword": true
          },
          {
            "surface": "著",
            "reading": "zhe",
            "meaning": {"en": "aspect particle", "id": "partikel aspek"},
            "is_keyword": true
          },
          {
            "surface": "我",
            "reading": "wǒ",
            "meaning": {"en": "I", "id": "saya"},
            "is_keyword": true
          },
          {
            "surface": "要",
            "reading": "yào",
            "meaning": {"en": "must/want", "id": "harus"},
            "is_keyword": true
          },
          {
            "surface": "爭氣",
            "reading": "zhēng qì",
            "meaning": {"en": "to succeed", "id": "berusaha keras"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l8",
        "start_time": 25.0,
        "end_time": 28.0,
        "surface_text": "回頭看",
        "reading_text": "huí tóu kàn",
        "translation": {"id": "Melihat ke belakang", "en": "Looking back"},
        "chunks": [
          {
            "surface": "回頭",
            "reading": "huí tóu",
            "meaning": {"en": "turn head", "id": "menoleh"},
            "is_keyword": true
          },
          {
            "surface": "看",
            "reading": "kàn",
            "meaning": {"en": "look", "id": "melihat"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l9",
        "start_time": 28.0,
        "end_time": 32.0,
        "surface_text": "才發現自己也咬著牙",
        "reading_text": "cái fā xiàn zì jǐ yě yǎo zhe yá",
        "translation": {
          "id": "Baru menyadari bahwa aku juga mengertakkan gigi",
          "en": "Only then did I realize I was also gritting my teeth"
        },
        "chunks": [
          {
            "surface": "才",
            "reading": "cái",
            "meaning": {"en": "only then", "id": "baru"},
            "is_keyword": true
          },
          {
            "surface": "發現",
            "reading": "fā xiàn",
            "meaning": {"en": "discover", "id": "menyadari"},
            "is_keyword": true
          },
          {
            "surface": "自己",
            "reading": "zì jǐ",
            "meaning": {"en": "oneself", "id": "diri sendiri"},
            "is_keyword": true
          },
          {
            "surface": "也",
            "reading": "yě",
            "meaning": {"en": "also", "id": "juga"},
            "is_keyword": true
          },
          {
            "surface": "咬著牙",
            "reading": "yǎo zhe yá",
            "meaning": {"en": "grit teeth", "id": "mengertakkan gigi"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l10",
        "start_time": 32.0,
        "end_time": 36.0,
        "surface_text": "走了很遠的路 聽過很多謊話",
        "reading_text": "zǒu le hěn yuǎn de lù tīng guò hěn duō huǎng huà",
        "translation": {
          "id": "Telah menempuh jalan yang sangat jauh, telah mendengar banyak kebohongan",
          "en": "Walked a very long way, heard many lies"
        },
        "chunks": [
          {
            "surface": "走了",
            "reading": "zǒu le",
            "meaning": {"en": "walked", "id": "berjalan"},
            "is_keyword": true
          },
          {
            "surface": "很遠",
            "reading": "hěn yuǎn",
            "meaning": {"en": "very far", "id": "sangat jauh"},
            "is_keyword": true
          },
          {
            "surface": "的",
            "reading": "de",
            "meaning": {"en": "particle", "id": "partikel"},
            "is_keyword": true
          },
          {
            "surface": "路",
            "reading": "lù",
            "meaning": {"en": "road", "id": "jalan"},
            "is_keyword": true
          },
          {
            "surface": " ",
            "reading": " ",
            "meaning": {"en": " ", "id": " "},
            "is_keyword": false
          },
          {
            "surface": "聽過",
            "reading": "tīng guò",
            "meaning": {"en": "heard", "id": "pernah dengar"},
            "is_keyword": true
          },
          {
            "surface": "很多",
            "reading": "hěn duō",
            "meaning": {"en": "many", "id": "banyak"},
            "is_keyword": true
          },
          {
            "surface": "謊話",
            "reading": "huǎng huà",
            "meaning": {"en": "lies", "id": "kebohongan"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l11",
        "start_time": 36.0,
        "end_time": 40.0,
        "surface_text": "感受著人和人性之間的複雜",
        "reading_text": "gǎn shòu zhe rén hé rén xìng zhī jiān de fù zá",
        "translation": {
          "id": "Merasakan kompleksitas manusia dan sifatnya",
          "en": "Feeling the complexity of people and human nature"
        },
        "chunks": [
          {
            "surface": "感受",
            "reading": "gǎn shòu",
            "meaning": {"en": "feel", "id": "merasakan"},
            "is_keyword": true
          },
          {
            "surface": "著",
            "reading": "zhe",
            "meaning": {"en": "aspect particle", "id": "partikel aspek"},
            "is_keyword": true
          },
          {
            "surface": "人",
            "reading": "rén",
            "meaning": {"en": "people", "id": "orang"},
            "is_keyword": true
          },
          {
            "surface": "和",
            "reading": "hé",
            "meaning": {"en": "and", "id": "dan"},
            "is_keyword": true
          },
          {
            "surface": "人性",
            "reading": "rén xìng",
            "meaning": {"en": "human nature", "id": "sifat manusia"},
            "is_keyword": true
          },
          {
            "surface": "之間",
            "reading": "zhī jiān",
            "meaning": {"en": "between", "id": "di antara"},
            "is_keyword": true
          },
          {
            "surface": "的",
            "reading": "de",
            "meaning": {"en": "particle", "id": "partikel"},
            "is_keyword": true
          },
          {
            "surface": "複雜",
            "reading": "fù zá",
            "meaning": {"en": "complex", "id": "rumit"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l12",
        "start_time": 40.0,
        "end_time": 44.0,
        "surface_text": "那些天真的想法 讓我顯得好傻",
        "reading_text": "nà xiē tiān zhēn de xiǎng fǎ ràng wǒ xiǎn de hǎo shǎ",
        "translation": {
          "id": "Ide-ide naif itu membuatku tampak bodoh",
          "en": "Those naive thoughts make me look so silly"
        },
        "chunks": [
          {
            "surface": "那些",
            "reading": "nà xiē",
            "meaning": {"en": "those", "id": "itu"},
            "is_keyword": true
          },
          {
            "surface": "天真",
            "reading": "tiān zhēn",
            "meaning": {"en": "naive", "id": "naif"},
            "is_keyword": true
          },
          {
            "surface": "的",
            "reading": "de",
            "meaning": {"en": "particle", "id": "partikel"},
            "is_keyword": true
          },
          {
            "surface": "想法",
            "reading": "xiǎng fǎ",
            "meaning": {"en": "thought", "id": "pemikiran"},
            "is_keyword": true
          },
          {
            "surface": " ",
            "reading": " ",
            "meaning": {"en": " ", "id": " "},
            "is_keyword": false
          },
          {
            "surface": "讓",
            "reading": "ràng",
            "meaning": {"en": "let/make", "id": "membuat"},
            "is_keyword": true
          },
          {
            "surface": "我",
            "reading": "wǒ",
            "meaning": {"en": "me", "id": "saya"},
            "is_keyword": true
          },
          {
            "surface": "顯得",
            "reading": "xiǎn de",
            "meaning": {"en": "appear", "id": "tampak"},
            "is_keyword": true
          },
          {
            "surface": "好傻",
            "reading": "hǎo shǎ",
            "meaning": {"en": "so silly", "id": "sangat bodoh"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l13",
        "start_time": 44.0,
        "end_time": 47.0,
        "surface_text": "回頭看",
        "reading_text": "huí tóu kàn",
        "translation": {"id": "Melihat ke belakang", "en": "Looking back"},
        "chunks": [
          {
            "surface": "回頭",
            "reading": "huí tóu",
            "meaning": {"en": "turn around", "id": "menoleh"},
            "is_keyword": true
          },
          {
            "surface": "看",
            "reading": "kàn",
            "meaning": {"en": "look", "id": "melihat"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l14",
        "start_time": 47.0,
        "end_time": 50.0,
        "surface_text": "才發現自己也咬著牙",
        "reading_text": "cái fā xiàn zì jǐ yě yǎo zhe yá",
        "translation": {
          "id": "Baru menyadari bahwa aku juga berjuang",
          "en": "Only then did I realize I was also gritting my teeth"
        },
        "chunks": [
          {
            "surface": "才",
            "reading": "cái",
            "meaning": {"en": "only then", "id": "baru"},
            "is_keyword": true
          },
          {
            "surface": "發現",
            "reading": "fā xiàn",
            "meaning": {"en": "find", "id": "menyadari"},
            "is_keyword": true
          },
          {
            "surface": "自己",
            "reading": "zì jǐ",
            "meaning": {"en": "oneself", "id": "diri sendiri"},
            "is_keyword": true
          },
          {
            "surface": "也",
            "reading": "yě",
            "meaning": {"en": "also", "id": "juga"},
            "is_keyword": true
          },
          {
            "surface": "咬著牙",
            "reading": "yǎo zhe yá",
            "meaning": {"en": "grit teeth", "id": "mengertakkan gigi"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l15",
        "start_time": 50.0,
        "end_time": 54.0,
        "surface_text": "走了很遠的路 留下很多傷疤",
        "reading_text": "zǒu le hěn yuǎn de lù liú xià hěn duō shāng bā",
        "translation": {
          "id": "Telah berjalan jauh, meninggalkan banyak bekas luka",
          "en": "Walked a long way, left many scars"
        },
        "chunks": [
          {
            "surface": "走了",
            "reading": "zǒu le",
            "meaning": {"en": "walked", "id": "berjalan"},
            "is_keyword": true
          },
          {
            "surface": "很遠",
            "reading": "hěn yuǎn",
            "meaning": {"en": "far", "id": "jauh"},
            "is_keyword": true
          },
          {
            "surface": "的",
            "reading": "de",
            "meaning": {"en": "particle", "id": "partikel"},
            "is_keyword": true
          },
          {
            "surface": "路",
            "reading": "lù",
            "meaning": {"en": "road", "id": "jalan"},
            "is_keyword": true
          },
          {
            "surface": " ",
            "reading": " ",
            "meaning": {"en": " ", "id": " "},
            "is_keyword": false
          },
          {
            "surface": "留下",
            "reading": "liú xià",
            "meaning": {"en": "leave", "id": "meninggalkan"},
            "is_keyword": true
          },
          {
            "surface": "很多",
            "reading": "hěn duō",
            "meaning": {"en": "many", "id": "banyak"},
            "is_keyword": true
          },
          {
            "surface": "傷疤",
            "reading": "shāng bā",
            "meaning": {"en": "scar", "id": "bekas luka"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l16",
        "start_time": 54.0,
        "end_time": 58.0,
        "surface_text": "現實和想像的落差",
        "reading_text": "xiàn shí hé xiǎng xiàng de luò chā",
        "translation": {"id": "Kesenjangan kenyataan dan imajinasi", "en": "The gap between reality and imagination"},
        "chunks": [
          {
            "surface": "現實",
            "reading": "xiàn shí",
            "meaning": {"en": "reality", "id": "kenyataan"},
            "is_keyword": true
          },
          {
            "surface": "和",
            "reading": "hé",
            "meaning": {"en": "and", "id": "dan"},
            "is_keyword": true
          },
          {
            "surface": "想像",
            "reading": "xiǎng xiàng",
            "meaning": {"en": "imagination", "id": "imajinasi"},
            "is_keyword": true
          },
          {
            "surface": "的",
            "reading": "de",
            "meaning": {"en": "particle", "id": "partikel"},
            "is_keyword": true
          },
          {
            "surface": "落差",
            "reading": "luò chā",
            "meaning": {"en": "gap", "id": "kesenjangan"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l17",
        "start_time": 58.0,
        "end_time": 64.0,
        "surface_text": "失去和擁有從來都 由不得我啊",
        "reading_text": "shī qù hé yōng yǒu cóng lái dōu yóu bù dé wǒ ā",
        "translation": {
          "id": "Kehilangan dan memiliki tak pernah bisa kukontrol",
          "en": "Losing and owning have never been up to me"
        },
        "chunks": [
          {
            "surface": "失去",
            "reading": "shī qù",
            "meaning": {"en": "lose", "id": "kehilangan"},
            "is_keyword": true
          },
          {
            "surface": "和",
            "reading": "hé",
            "meaning": {"en": "and", "id": "dan"},
            "is_keyword": true
          },
          {
            "surface": "擁有",
            "reading": "yōng yǒu",
            "meaning": {"en": "possess", "id": "memiliki"},
            "is_keyword": true
          },
          {
            "surface": "從來都",
            "reading": "cóng lái dōu",
            "meaning": {"en": "always", "id": "selalu"},
            "is_keyword": true
          },
          {
            "surface": " ",
            "reading": " ",
            "meaning": {"en": " ", "id": " "},
            "is_keyword": false
          },
          {
            "surface": "由不得",
            "reading": "yóu bù dé",
            "meaning": {"en": "cannot help/not up to", "id": "tidak kuasa"},
            "is_keyword": true
          },
          {
            "surface": "我",
            "reading": "wǒ",
            "meaning": {"en": "me", "id": "saya"},
            "is_keyword": true
          },
          {
            "surface": "啊",
            "reading": "ā",
            "meaning": {"en": "ah", "id": "ah"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l18",
        "start_time": 64.0,
        "end_time": 67.0,
        "surface_text": "離開家的距離",
        "reading_text": "lí kāi jiā de jù lí",
        "translation": {"id": "Jarak meninggalkan rumah", "en": "The distance leaving home"},
        "chunks": [
          {
            "surface": "離開",
            "reading": "lí kāi",
            "meaning": {"en": "leave", "id": "meninggalkan"},
            "is_keyword": true
          },
          {
            "surface": "家",
            "reading": "jiā",
            "meaning": {"en": "home", "id": "rumah"},
            "is_keyword": true
          },
          {
            "surface": "的",
            "reading": "de",
            "meaning": {"en": "particle", "id": "partikel"},
            "is_keyword": true
          },
          {
            "surface": "距離",
            "reading": "jù lí",
            "meaning": {"en": "distance", "id": "jarak"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l19",
        "start_time": 67.0,
        "end_time": 70.0,
        "surface_text": "大約有好幾百公里",
        "reading_text": "dà yuē yǒu hǎo jǐ bǎi gōng lǐ",
        "translation": {"id": "Sekitar beberapa ratus kilometer", "en": "Approximately several hundred kilometers"},
        "chunks": [
          {
            "surface": "大約",
            "reading": "dà yuē",
            "meaning": {"en": "approximately", "id": "kira-kira"},
            "is_keyword": true
          },
          {
            "surface": "有",
            "reading": "yǒu",
            "meaning": {"en": "has", "id": "ada"},
            "is_keyword": true
          },
          {
            "surface": "好幾百",
            "reading": "hǎo jǐ bǎi",
            "meaning": {"en": "several hundred", "id": "beberapa ratus"},
            "is_keyword": true
          },
          {
            "surface": "公里",
            "reading": "gōng lǐ",
            "meaning": {"en": "kilometer", "id": "kilometer"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l20",
        "start_time": 70.0,
        "end_time": 73.0,
        "surface_text": "導航不太熟悉",
        "reading_text": "dǎo háng bú tài shú xī",
        "translation": {"id": "Navigasi tidak terlalu familiar", "en": "Not very familiar with navigation"},
        "chunks": [
          {
            "surface": "導航",
            "reading": "dǎo háng",
            "meaning": {"en": "navigation", "id": "navigasi"},
            "is_keyword": true
          },
          {
            "surface": "不太",
            "reading": "bú tài",
            "meaning": {"en": "not very", "id": "tidak terlalu"},
            "is_keyword": true
          },
          {
            "surface": "熟悉",
            "reading": "shú xī",
            "meaning": {"en": "familiar", "id": "akrab"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l21",
        "start_time": 73.0,
        "end_time": 77.0,
        "surface_text": "經常分不清南北東西",
        "reading_text": "jīng cháng fēn bù qīng nán běi dōng xī",
        "translation": {"id": "Sering tidak bisa membedakan arah", "en": "Often can't tell the directions apart"},
        "chunks": [
          {
            "surface": "經常",
            "reading": "jīng cháng",
            "meaning": {"en": "often", "id": "sering"},
            "is_keyword": true
          },
          {
            "surface": "分不清",
            "reading": "fēn bù qīng",
            "meaning": {"en": "can't distinguish", "id": "tak bisa bedakan"},
            "is_keyword": true
          },
          {
            "surface": "南北東西",
            "reading": "nán běi dōng xī",
            "meaning": {"en": "directions", "id": "arah"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l22",
        "start_time": 77.0,
        "end_time": 80.5,
        "surface_text": "時常告訴自己",
        "reading_text": "shí cháng gào sù zì jǐ",
        "translation": {"id": "Sering memberitahu diri sendiri", "en": "Often telling myself"},
        "chunks": [
          {
            "surface": "時常",
            "reading": "shí cháng",
            "meaning": {"en": "constantly", "id": "kerap kali"},
            "is_keyword": true
          },
          {
            "surface": "告訴",
            "reading": "gào sù",
            "meaning": {"en": "tell", "id": "memberitahu"},
            "is_keyword": true
          },
          {
            "surface": "自己",
            "reading": "zì jǐ",
            "meaning": {"en": "oneself", "id": "diri sendiri"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l23",
        "start_time": 80.5,
        "end_time": 84.0,
        "surface_text": "一個人走也沒關係",
        "reading_text": "yī gè rén zǒu yě méi guān xì",
        "translation": {"id": "Berjalan sendiri pun tak apa", "en": "It's okay to walk alone"},
        "chunks": [
          {
            "surface": "一個人",
            "reading": "yī gè rén",
            "meaning": {"en": "alone", "id": "sendirian"},
            "is_keyword": true
          },
          {
            "surface": "走",
            "reading": "zǒu",
            "meaning": {"en": "walk", "id": "berjalan"},
            "is_keyword": true
          },
          {
            "surface": "也",
            "reading": "yě",
            "meaning": {"en": "also", "id": "juga"},
            "is_keyword": true
          },
          {
            "surface": "沒關係",
            "reading": "méi guān xì",
            "meaning": {"en": "it's okay", "id": "tidak apa-apa"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l24",
        "start_time": 84.0,
        "end_time": 88.0,
        "surface_text": "受的委屈提醒著我要爭氣",
        "reading_text": "shòu de wěi qu tí xǐng zhe wǒ yào zhēng qì",
        "translation": {"id": "Ketidakadilan ini mengingatkanku agar sukses", "en": "Grievances remind me to succeed"},
        "chunks": [
          {
            "surface": "受",
            "reading": "shòu",
            "meaning": {"en": "suffer", "id": "terima"},
            "is_keyword": true
          },
          {
            "surface": "的",
            "reading": "de",
            "meaning": {"en": "particle", "id": "partikel"},
            "is_keyword": true
          },
          {
            "surface": "委屈",
            "reading": "wěi qu",
            "meaning": {"en": "grievance", "id": "ketidakadilan"},
            "is_keyword": true
          },
          {
            "surface": "提醒",
            "reading": "tí xǐng",
            "meaning": {"en": "remind", "id": "mengingatkan"},
            "is_keyword": true
          },
          {
            "surface": "著",
            "reading": "zhe",
            "meaning": {"en": "particle", "id": "partikel"},
            "is_keyword": true
          },
          {
            "surface": "我",
            "reading": "wǒ",
            "meaning": {"en": "me", "id": "saya"},
            "is_keyword": true
          },
          {
            "surface": "要",
            "reading": "yào",
            "meaning": {"en": "want/must", "id": "harus"},
            "is_keyword": true
          },
          {
            "surface": "爭氣",
            "reading": "zhēng qì",
            "meaning": {"en": "succeed", "id": "berusaha"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l25",
        "start_time": 88.0,
        "end_time": 91.0,
        "surface_text": "回頭看",
        "reading_text": "huí tóu kàn",
        "translation": {"id": "Melihat ke belakang", "en": "Looking back"},
        "chunks": [
          {
            "surface": "回頭",
            "reading": "huí tóu",
            "meaning": {"en": "turn around", "id": "menoleh"},
            "is_keyword": true
          },
          {
            "surface": "看",
            "reading": "kàn",
            "meaning": {"en": "look", "id": "melihat"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l26",
        "start_time": 91.0,
        "end_time": 94.5,
        "surface_text": "才發現自己也咬著牙",
        "reading_text": "cái fā xiàn zì jǐ yě yǎo zhe yá",
        "translation": {"id": "Menyadari aku juga berjuang keras", "en": "Realize I was gritting my teeth"},
        "chunks": [
          {
            "surface": "才",
            "reading": "cái",
            "meaning": {"en": "only then", "id": "baru"},
            "is_keyword": true
          },
          {
            "surface": "發現",
            "reading": "fā xiàn",
            "meaning": {"en": "realize", "id": "menyadari"},
            "is_keyword": true
          },
          {
            "surface": "自己",
            "reading": "zì jǐ",
            "meaning": {"en": "oneself", "id": "diri sendiri"},
            "is_keyword": true
          },
          {
            "surface": "也",
            "reading": "yě",
            "meaning": {"en": "also", "id": "juga"},
            "is_keyword": true
          },
          {
            "surface": "咬著牙",
            "reading": "yǎo zhe yá",
            "meaning": {"en": "grit teeth", "id": "mengertakkan gigi"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l27",
        "start_time": 94.5,
        "end_time": 98.0,
        "surface_text": "走了很遠的路 聽過很多謊話",
        "reading_text": "zǒu le hěn yuǎn de lù tīng guò hěn duō huǎng huà",
        "translation": {"id": "Jalan jauh, mendengar banyak bohong", "en": "Walked far, heard many lies"},
        "chunks": [
          {
            "surface": "走了",
            "reading": "zǒu le",
            "meaning": {"en": "walked", "id": "jalan"},
            "is_keyword": true
          },
          {
            "surface": "很遠",
            "reading": "hěn yuǎn",
            "meaning": {"en": "far", "id": "jauh"},
            "is_keyword": true
          },
          {
            "surface": "的",
            "reading": "de",
            "meaning": {"en": "particle", "id": "partikel"},
            "is_keyword": true
          },
          {
            "surface": "路",
            "reading": "lù",
            "meaning": {"en": "road", "id": "jalan"},
            "is_keyword": true
          },
          {
            "surface": " ",
            "reading": " ",
            "meaning": {"en": " ", "id": " "},
            "is_keyword": false
          },
          {
            "surface": "聽過",
            "reading": "tīng guò",
            "meaning": {"en": "heard", "id": "dengar"},
            "is_keyword": true
          },
          {
            "surface": "很多",
            "reading": "hěn duō",
            "meaning": {"en": "many", "id": "banyak"},
            "is_keyword": true
          },
          {
            "surface": "謊話",
            "reading": "huǎng huà",
            "meaning": {"en": "lies", "id": "bohong"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l28",
        "start_time": 98.0,
        "end_time": 102.0,
        "surface_text": "感受著人和人性之間的複雜",
        "reading_text": "gǎn shòu zhe rén hé rén xìng zhī jiān de fù zá",
        "translation": {"id": "Merasakan rumitnya sifat manusia", "en": "Feeling the complexity of human nature"},
        "chunks": [
          {
            "surface": "感受",
            "reading": "gǎn shòu",
            "meaning": {"en": "feel", "id": "rasakan"},
            "is_keyword": true
          },
          {
            "surface": "著",
            "reading": "zhe",
            "meaning": {"en": "particle", "id": "partikel"},
            "is_keyword": true
          },
          {
            "surface": "人",
            "reading": "rén",
            "meaning": {"en": "person", "id": "orang"},
            "is_keyword": true
          },
          {
            "surface": "和",
            "reading": "hé",
            "meaning": {"en": "and", "id": "dan"},
            "is_keyword": true
          },
          {
            "surface": "人性",
            "reading": "rén xìng",
            "meaning": {"en": "human nature", "id": "sifat manusia"},
            "is_keyword": true
          },
          {
            "surface": "之間",
            "reading": "zhī jiān",
            "meaning": {"en": "between", "id": "di antara"},
            "is_keyword": true
          },
          {
            "surface": "的",
            "reading": "de",
            "meaning": {"en": "particle", "id": "partikel"},
            "is_keyword": true
          },
          {
            "surface": "複雜",
            "reading": "fù zá",
            "meaning": {"en": "complex", "id": "rumit"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l29",
        "start_time": 102.0,
        "end_time": 105.5,
        "surface_text": "那些天真的想法 讓我顯得好傻",
        "reading_text": "nà xiē tiān zhēn de xiǎng fǎ ràng wǒ xiǎn de hǎo shǎ",
        "translation": {"id": "Pikiran naif membuatku tampak bodoh", "en": "Naive thoughts make me look silly"},
        "chunks": [
          {
            "surface": "那些",
            "reading": "nà xiē",
            "meaning": {"en": "those", "id": "itu"},
            "is_keyword": true
          },
          {
            "surface": "天真",
            "reading": "tiān zhēn",
            "meaning": {"en": "naive", "id": "naif"},
            "is_keyword": true
          },
          {
            "surface": "的",
            "reading": "de",
            "meaning": {"en": "particle", "id": "partikel"},
            "is_keyword": true
          },
          {
            "surface": "想法",
            "reading": "xiǎng fǎ",
            "meaning": {"en": "thought", "id": "pikiran"},
            "is_keyword": true
          },
          {
            "surface": " ",
            "reading": " ",
            "meaning": {"en": " ", "id": " "},
            "is_keyword": false
          },
          {
            "surface": "讓",
            "reading": "ràng",
            "meaning": {"en": "make", "id": "membuat"},
            "is_keyword": true
          },
          {
            "surface": "我",
            "reading": "wǒ",
            "meaning": {"en": "me", "id": "saya"},
            "is_keyword": true
          },
          {
            "surface": "顯得",
            "reading": "xiǎn de",
            "meaning": {"en": "seem", "id": "tampak"},
            "is_keyword": true
          },
          {
            "surface": "好傻",
            "reading": "hǎo shǎ",
            "meaning": {"en": "so silly", "id": "sangat bodoh"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l30",
        "start_time": 105.5,
        "end_time": 108.5,
        "surface_text": "回頭看",
        "reading_text": "huí tóu kàn",
        "translation": {"id": "Melihat ke belakang", "en": "Looking back"},
        "chunks": [
          {
            "surface": "回頭",
            "reading": "huí tóu",
            "meaning": {"en": "turn around", "id": "menoleh"},
            "is_keyword": true
          },
          {
            "surface": "看",
            "reading": "kàn",
            "meaning": {"en": "look", "id": "melihat"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l31",
        "start_time": 108.5,
        "end_time": 112.0,
        "surface_text": "才發現自己也咬著牙",
        "reading_text": "cái fā xiàn zì jǐ yě yǎo zhe yá",
        "translation": {"id": "Baru sadar aku juga berjuang", "en": "Realize I was gritting my teeth"},
        "chunks": [
          {
            "surface": "才",
            "reading": "cái",
            "meaning": {"en": "only then", "id": "baru"},
            "is_keyword": true
          },
          {
            "surface": "發現",
            "reading": "fā xiàn",
            "meaning": {"en": "find", "id": "menyadari"},
            "is_keyword": true
          },
          {
            "surface": "自己",
            "reading": "zì jǐ",
            "meaning": {"en": "oneself", "id": "diri sendiri"},
            "is_keyword": true
          },
          {
            "surface": "也",
            "reading": "yě",
            "meaning": {"en": "also", "id": "juga"},
            "is_keyword": true
          },
          {
            "surface": "咬著牙",
            "reading": "yǎo zhe yá",
            "meaning": {"en": "grit teeth", "id": "mengertakkan gigi"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l32",
        "start_time": 112.0,
        "end_time": 115.5,
        "surface_text": "走了很遠的路 留下很多傷疤",
        "reading_text": "zǒu le hěn yuǎn de lù liú xià hěn duō shāng bā",
        "translation": {"id": "Jalan jauh, banyak luka", "en": "Walked far, left many scars"},
        "chunks": [
          {
            "surface": "走了",
            "reading": "zǒu le",
            "meaning": {"en": "walked", "id": "berjalan"},
            "is_keyword": true
          },
          {
            "surface": "很遠",
            "reading": "hěn yuǎn",
            "meaning": {"en": "far", "id": "jauh"},
            "is_keyword": true
          },
          {
            "surface": "的",
            "reading": "de",
            "meaning": {"en": "particle", "id": "partikel"},
            "is_keyword": true
          },
          {
            "surface": "路",
            "reading": "lù",
            "meaning": {"en": "road", "id": "jalan"},
            "is_keyword": true
          },
          {
            "surface": " ",
            "reading": " ",
            "meaning": {"en": " ", "id": " "},
            "is_keyword": false
          },
          {
            "surface": "留下",
            "reading": "liú xià",
            "meaning": {"en": "leave", "id": "tinggalkan"},
            "is_keyword": true
          },
          {
            "surface": "很多",
            "reading": "hěn duō",
            "meaning": {"en": "many", "id": "banyak"},
            "is_keyword": true
          },
          {
            "surface": "傷疤",
            "reading": "shāng bā",
            "meaning": {"en": "scar", "id": "luka"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l33",
        "start_time": 115.5,
        "end_time": 119.5,
        "surface_text": "現實和想像的落差",
        "reading_text": "xiàn shí hé xiǎng xiàng de luò chā",
        "translation": {"id": "Gap kenyataan dan imajinasi", "en": "Reality vs imagination gap"},
        "chunks": [
          {
            "surface": "現實",
            "reading": "xiàn shí",
            "meaning": {"en": "reality", "id": "kenyataan"},
            "is_keyword": true
          },
          {
            "surface": "和",
            "reading": "hé",
            "meaning": {"en": "and", "id": "dan"},
            "is_keyword": true
          },
          {
            "surface": "想像",
            "reading": "xiǎng xiàng",
            "meaning": {"en": "imagination", "id": "imajinasi"},
            "is_keyword": true
          },
          {
            "surface": "的",
            "reading": "de",
            "meaning": {"en": "particle", "id": "partikel"},
            "is_keyword": true
          },
          {
            "surface": "落差",
            "reading": "luò chā",
            "meaning": {"en": "gap", "id": "kesenjangan"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l34",
        "start_time": 119.5,
        "end_time": 125.0,
        "surface_text": "失去和擁有從來都 由不得我啊",
        "reading_text": "shī qù hé yōng yǒu cóng lái dōu yóu bù dé wǒ ā",
        "translation": {"id": "Kehilangan tak bisa diatur", "en": "Loss and gain aren't up to me"},
        "chunks": [
          {
            "surface": "失去",
            "reading": "shī qù",
            "meaning": {"en": "lose", "id": "hilang"},
            "is_keyword": true
          },
          {
            "surface": "和",
            "reading": "hé",
            "meaning": {"en": "and", "id": "dan"},
            "is_keyword": true
          },
          {
            "surface": "擁有",
            "reading": "yōng yǒu",
            "meaning": {"en": "own", "id": "milik"},
            "is_keyword": true
          },
          {
            "surface": "從來都",
            "reading": "cóng lái dōu",
            "meaning": {"en": "always", "id": "selalu"},
            "is_keyword": true
          },
          {
            "surface": " ",
            "reading": " ",
            "meaning": {"en": " ", "id": " "},
            "is_keyword": false
          },
          {
            "surface": "由不得",
            "reading": "yóu bù dé",
            "meaning": {"en": "not up to", "id": "tak kuasa"},
            "is_keyword": true
          },
          {
            "surface": "我",
            "reading": "wǒ",
            "meaning": {"en": "me", "id": "saya"},
            "is_keyword": true
          },
          {
            "surface": "啊",
            "reading": "ā",
            "meaning": {"en": "ah", "id": "ah"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l35",
        "start_time": 125.0,
        "end_time": 128.0,
        "surface_text": "回頭看",
        "reading_text": "huí tóu kàn",
        "translation": {"id": "Melihat ke belakang", "en": "Looking back"},
        "chunks": [
          {
            "surface": "回頭",
            "reading": "huí tóu",
            "meaning": {"en": "turn around", "id": "menoleh"},
            "is_keyword": true
          },
          {
            "surface": "看",
            "reading": "kàn",
            "meaning": {"en": "look", "id": "melihat"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l36",
        "start_time": 128.0,
        "end_time": 131.5,
        "surface_text": "才發現自己也咬著牙",
        "reading_text": "cái fā xiàn zì jǐ yě yǎo zhe yá",
        "translation": {"id": "Baru sadar aku juga berjuang", "en": "Realize I was gritting my teeth"},
        "chunks": [
          {
            "surface": "才",
            "reading": "cái",
            "meaning": {"en": "only then", "id": "baru"},
            "is_keyword": true
          },
          {
            "surface": "發現",
            "reading": "fā xiàn",
            "meaning": {"en": "find", "id": "sadari"},
            "is_keyword": true
          },
          {
            "surface": "自己",
            "reading": "zì jǐ",
            "meaning": {"en": "oneself", "id": "diri sendiri"},
            "is_keyword": true
          },
          {
            "surface": "也",
            "reading": "yě",
            "meaning": {"en": "also", "id": "juga"},
            "is_keyword": true
          },
          {
            "surface": "咬著牙",
            "reading": "yǎo zhe yá",
            "meaning": {"en": "grit teeth", "id": "gigit gigi"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l37",
        "start_time": 131.5,
        "end_time": 135.0,
        "surface_text": "走了很遠的路 聽過很多謊話",
        "reading_text": "zǒu le hěn yuǎn de lù tīng guò hěn duō huǎng huà",
        "translation": {"id": "Jalan jauh, dengar bohong", "en": "Walked far, heard lies"},
        "chunks": [
          {
            "surface": "走了",
            "reading": "zǒu le",
            "meaning": {"en": "walked", "id": "jalan"},
            "is_keyword": true
          },
          {
            "surface": "很遠",
            "reading": "hěn yuǎn",
            "meaning": {"en": "far", "id": "jauh"},
            "is_keyword": true
          },
          {
            "surface": "的",
            "reading": "de",
            "meaning": {"en": "particle", "id": "partikel"},
            "is_keyword": true
          },
          {
            "surface": "路",
            "reading": "lù",
            "meaning": {"en": "road", "id": "jalan"},
            "is_keyword": true
          },
          {
            "surface": " ",
            "reading": " ",
            "meaning": {"en": " ", "id": " "},
            "is_keyword": false
          },
          {
            "surface": "聽過",
            "reading": "tīng guò",
            "meaning": {"en": "heard", "id": "pernah dengar"},
            "is_keyword": true
          },
          {
            "surface": "很多",
            "reading": "hěn duō",
            "meaning": {"en": "many", "id": "banyak"},
            "is_keyword": true
          },
          {
            "surface": "謊話",
            "reading": "huǎng huà",
            "meaning": {"en": "lies", "id": "bohong"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l38",
        "start_time": 135.0,
        "end_time": 139.0,
        "surface_text": "感受著人和人性之間的複雜",
        "reading_text": "gǎn shòu zhe rén hé rén xìng zhī jiān de fù zá",
        "translation": {"id": "Rumitnya sifat manusia", "en": "Complexity of human nature"},
        "chunks": [
          {
            "surface": "感受",
            "reading": "gǎn shòu",
            "meaning": {"en": "feel", "id": "rasakan"},
            "is_keyword": true
          },
          {
            "surface": "著",
            "reading": "zhe",
            "meaning": {"en": "particle", "id": "partikel"},
            "is_keyword": true
          },
          {
            "surface": "人",
            "reading": "rén",
            "meaning": {"en": "person", "id": "orang"},
            "is_keyword": true
          },
          {
            "surface": "和",
            "reading": "hé",
            "meaning": {"en": "and", "id": "dan"},
            "is_keyword": true
          },
          {
            "surface": "人性",
            "reading": "rén xìng",
            "meaning": {"en": "nature", "id": "sifat"},
            "is_keyword": true
          },
          {
            "surface": "之間",
            "reading": "zhī jiān",
            "meaning": {"en": "between", "id": "antara"},
            "is_keyword": true
          },
          {
            "surface": "的",
            "reading": "de",
            "meaning": {"en": "particle", "id": "partikel"},
            "is_keyword": true
          },
          {
            "surface": "複雜",
            "reading": "fù zá",
            "meaning": {"en": "complex", "id": "rumit"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l39",
        "start_time": 139.0,
        "end_time": 142.5,
        "surface_text": "那些天真的想法 讓我顯得好傻",
        "reading_text": "nà xiē tiān zhēn de xiǎng fǎ ràng wǒ xiǎn de hǎo shǎ",
        "translation": {"id": "Ide naif bikin bodoh", "en": "Naive ideas make me look silly"},
        "chunks": [
          {
            "surface": "那些",
            "reading": "nà xiē",
            "meaning": {"en": "those", "id": "itu"},
            "is_keyword": true
          },
          {
            "surface": "天真",
            "reading": "tiān zhēn",
            "meaning": {"en": "naive", "id": "naif"},
            "is_keyword": true
          },
          {
            "surface": "的",
            "reading": "de",
            "meaning": {"en": "particle", "id": "partikel"},
            "is_keyword": true
          },
          {
            "surface": "想法",
            "reading": "xiǎng fǎ",
            "meaning": {"en": "thought", "id": "pikiran"},
            "is_keyword": true
          },
          {
            "surface": " ",
            "reading": " ",
            "meaning": {"en": " ", "id": " "},
            "is_keyword": false
          },
          {
            "surface": "讓",
            "reading": "ràng",
            "meaning": {"en": "make", "id": "bikin"},
            "is_keyword": true
          },
          {
            "surface": "我",
            "reading": "wǒ",
            "meaning": {"en": "me", "id": "saya"},
            "is_keyword": true
          },
          {
            "surface": "顯得",
            "reading": "xiǎn de",
            "meaning": {"en": "seem", "id": "tampak"},
            "is_keyword": true
          },
          {
            "surface": "好傻",
            "reading": "hǎo shǎ",
            "meaning": {"en": "silly", "id": "bodoh"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l40",
        "start_time": 142.5,
        "end_time": 145.5,
        "surface_text": "回頭看",
        "reading_text": "huí tóu kàn",
        "translation": {"id": "Menoleh ke belakang", "en": "Look back"},
        "chunks": [
          {
            "surface": "回頭",
            "reading": "huí tóu",
            "meaning": {"en": "turn around", "id": "menoleh"},
            "is_keyword": true
          },
          {
            "surface": "看",
            "reading": "kàn",
            "meaning": {"en": "look", "id": "melihat"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l41",
        "start_time": 145.5,
        "end_time": 149.0,
        "surface_text": "才發現自己也咬著牙",
        "reading_text": "cái fā xiàn zì jǐ yě yǎo zhe yá",
        "translation": {"id": "Ternyata aku berjuang", "en": "I was gritting my teeth"},
        "chunks": [
          {
            "surface": "才",
            "reading": "cái",
            "meaning": {"en": "only then", "id": "baru"},
            "is_keyword": true
          },
          {
            "surface": "發現",
            "reading": "fā xiàn",
            "meaning": {"en": "realize", "id": "menyadari"},
            "is_keyword": true
          },
          {
            "surface": "自己",
            "reading": "zì jǐ",
            "meaning": {"en": "oneself", "id": "sendiri"},
            "is_keyword": true
          },
          {
            "surface": "也",
            "reading": "yě",
            "meaning": {"en": "also", "id": "juga"},
            "is_keyword": true
          },
          {
            "surface": "咬著牙",
            "reading": "yǎo zhe yá",
            "meaning": {"en": "grit teeth", "id": "gigit gigi"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l42",
        "start_time": 149.0,
        "end_time": 152.5,
        "surface_text": "走了很遠的路 留下很多傷疤",
        "reading_text": "zǒu le hěn yuǎn de lù liú xià hěn duō shāng bā",
        "translation": {"id": "Banyak bekas luka", "en": "Left many scars"},
        "chunks": [
          {
            "surface": "走了",
            "reading": "zǒu le",
            "meaning": {"en": "walked", "id": "jalan"},
            "is_keyword": true
          },
          {
            "surface": "很遠",
            "reading": "hěn yuǎn",
            "meaning": {"en": "far", "id": "jauh"},
            "is_keyword": true
          },
          {
            "surface": "的",
            "reading": "de",
            "meaning": {"en": "particle", "id": "partikel"},
            "is_keyword": true
          },
          {
            "surface": "路",
            "reading": "lù",
            "meaning": {"en": "road", "id": "jalan"},
            "is_keyword": true
          },
          {
            "surface": " ",
            "reading": " ",
            "meaning": {"en": " ", "id": " "},
            "is_keyword": false
          },
          {
            "surface": "留下",
            "reading": "liú xià",
            "meaning": {"en": "leave", "id": "tinggalkan"},
            "is_keyword": true
          },
          {
            "surface": "很多",
            "reading": "hěn duō",
            "meaning": {"en": "many", "id": "banyak"},
            "is_keyword": true
          },
          {
            "surface": "傷疤",
            "reading": "shāng bā",
            "meaning": {"en": "scar", "id": "bekas luka"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l43",
        "start_time": 152.5,
        "end_time": 156.5,
        "surface_text": "現實和想像的落差",
        "reading_text": "xiàn shí hé xiǎng xiàng de luò chā",
        "translation": {"id": "Ekspektasi vs realita", "en": "Reality gap"},
        "chunks": [
          {
            "surface": "現實",
            "reading": "xiàn shí",
            "meaning": {"en": "reality", "id": "kenyataan"},
            "is_keyword": true
          },
          {
            "surface": "和",
            "reading": "hé",
            "meaning": {"en": "and", "id": "dan"},
            "is_keyword": true
          },
          {
            "surface": "想像",
            "reading": "xiǎng xiàng",
            "meaning": {"en": "imagine", "id": "imajinasi"},
            "is_keyword": true
          },
          {
            "surface": "的",
            "reading": "de",
            "meaning": {"en": "particle", "id": "partikel"},
            "is_keyword": true
          },
          {
            "surface": "落差",
            "reading": "luò chā",
            "meaning": {"en": "gap", "id": "kesenjangan"},
            "is_keyword": true
          }
        ]
      },
      {
        "line_id": "l44",
        "start_time": 156.5,
        "end_time": 162.0,
        "surface_text": "失去和擁有從來都 由不得我啊",
        "reading_text": "shī qù hé yōng yǒu cóng lái dōu yóu bù dé wǒ ā",
        "translation": {"id": "Nasib tak bisa diatur", "en": "Not my choice"},
        "chunks": [
          {
            "surface": "失去",
            "reading": "shī qù",
            "meaning": {"en": "lose", "id": "hilang"},
            "is_keyword": true
          },
          {
            "surface": "和",
            "reading": "hé",
            "meaning": {"en": "and", "id": "dan"},
            "is_keyword": true
          },
          {
            "surface": "擁有",
            "reading": "yōng yǒu",
            "meaning": {"en": "own", "id": "milik"},
            "is_keyword": true
          },
          {
            "surface": "從來都",
            "reading": "cóng lái dōu",
            "meaning": {"en": "always", "id": "selalu"},
            "is_keyword": true
          },
          {
            "surface": " ",
            "reading": " ",
            "meaning": {"en": " ", "id": " "},
            "is_keyword": false
          },
          {
            "surface": "由不得",
            "reading": "yóu bù dé",
            "meaning": {"en": "not up to", "id": "tak kuasa"},
            "is_keyword": true
          },
          {
            "surface": "我",
            "reading": "wǒ",
            "meaning": {"en": "me", "id": "saya"},
            "is_keyword": true
          },
          {
            "surface": "啊",
            "reading": "ā",
            "meaning": {"en": "ah", "id": "ah"},
            "is_keyword": true
          }
        ]
      }
    ],
  };

  Future<SongLyric> transcribeLyric(String youtubeURL) async {
    // var transcriptJson = <Map<String, dynamic>>[];
    // try {
    //   final videoId = YoutubePlayer.convertUrlToId(youtubeURL) ?? "";
    //   if (videoId.isEmpty) throw Exception("Invalid YouTube URL");

    //   final transcriptList = await api.list(videoId);
    //   final originalTranscript = transcriptList.firstWhere((t) => !t.isGenerated, orElse: () => transcriptList.first);

    //   final isCJK = _cjkCode.any((code) => originalTranscript.languageCode.startsWith(code));

    //   if (isCJK) {
    //     final transcript = await api.fetch(videoId, languages: [originalTranscript.languageCode]);
    //     transcriptJson = transcript
    //         .map((snippet) => {"text": snippet.text, "start": snippet.start, "duration": snippet.duration})
    //         .toList();
    //   }
    // } finally {
    //   api.dispose();
    // }

    // final userInput = jsonEncode({
    //   "youtube_url": youtubeURL,
    //   "transcript": transcriptJson.take(10).toList(),
    // });

    // final response = await http.post(
    //   Uri.parse(_baseURL),
    //   headers: {
    //     "Content-Type": "application/json",
    //     "Authorization": "Bearer ${dotenv.env["GROQ_API_KEY"]}",
    //   },
    //   body: jsonEncode({
    //     "model": "llama-3.3-70b-versatile",
    //     "temperature": 0.2,
    //     "max_tokens": 8192,
    //     "messages": [
    //       {"role": "user", "content": "$systemPrompt\n\nINPUT:\n$userInput"}
    //     ],
    //   }),
    // );

    // final data = jsonDecode(response.body);
    // var rawText = data['choices'][0]['message']['content'] as String;
    // rawText = rawText.replaceAll('```json', '').replaceAll('```', '').trim();

    try {
      // final songJson = jsonDecode(rawText);
      final lyric = SongLyric.fromJson({
        ...dummyData,
        "youtubeURL": youtubeURL,
        "createdAt": DateTime.now().toIso8601String(),
      });
      return lyric.copyWith(globalGlossary: glossaryFromChunk(lyric.lyrics));
    } catch (e, stakc) {
      print(e.toString());
      print(stakc);
      rethrow;
    }
  }
}

@riverpod
GeminiService geminiService(Ref ref) {
  return GeminiService();
}
