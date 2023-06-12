DROP DATABASE IF EXISTS baseballdb;

CREATE DATABASE IF NOT EXISTS baseballdb 
  DEFAULT CHARACTER SET utf8mb4 
  DEFAULT COLLATE utf8mb4_general_ci;

USE baseballdb;

# 선수 테이블 생성
CREATE TABLE player (
  id INT NOT NULL AUTO_INCREMENT,
  pname VARCHAR(100) NOT NULL,
  position VARCHAR(100),
  age INT,
  batting_average FLOAT NULL,
  home_run INT NULL,
  ERA FLOAT NULL,
  wins INT NULL,
  war FLOAT,
  picture VARCHAR(100),
  PRIMARY KEY(id)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8mb4 
  DEFAULT COLLATE utf8mb4_general_ci;

# 팀 테이블 생성
CREATE TABLE team (
  id INT NOT NULL AUTO_INCREMENT,
  tname VARCHAR(255) NOT NULL,
  city VARCHAR(100) NULL,
  league VARCHAR(100),
  PRIMARY KEY(id)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8mb4 
  DEFAULT COLLATE utf8mb4_general_ci;

# 선수 기록 테이블 생성 => 선수 테이블과 병합
# CREATE TABLE stat (
#   id INT NOT NULL AUTO_INCREMENT,
#   batting_average FLOAT,
#   home_run INT,
#   ERA FLOAT,
#   wins_losses INT,
# ) ENGINE = InnoDB
#   DEFAULT CHARACTER SET utf8mb4 
#   DEFAULT COLLATE utf8mb4_general_ci;

# 선수 리스트 테이블 생성
CREATE TABLE playerlist (
   playid INT NOT NULL,
   teamid INT NOT NULL,
   #statid INT NOT NULL,
   #PRIMARY KEY(playid, teamid, statid),
   PRIMARY KEY(playid, teamid),
   FOREIGN KEY(playid) REFERENCES player(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
   FOREIGN KEY(teamid) REFERENCES team(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
   # FOREIGN KEY(statid) REFERENCES stat(id)
   #    ON DELETE CASCADE
   #    ON UPDATE CASCADE,
   INDEX(playid)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8mb4 
  DEFAULT COLLATE utf8mb4_general_ci;

INSERT INTO player VALUES (null, "김상수", "SS", 33, 0.293, 0, null, null, 1.43, "KimSangSu");
INSERT INTO player VALUES (null, "이재현", "SS", 20, 0.227, 4, null, null, 0.10, "LeeJaeHyeon");
INSERT INTO player VALUES (null, "나균안", "P", 25 ,null, null, 2.36, 5, 2.31, "NaGyunAn");
INSERT INTO player (pname, position, age, war, picture) VALUES ("김광현", "P", 34, 0.81, "KwangHyunKim");
INSERT INTO player (pname, position, age, war, picture) VALUES 
  ("강백호", "RF", 23, 0.71, "KangBaekho"),
  ("이정후", "CF", 24, 1.79, "LeeJunghoo"),
  ("노시환", "3B", 22, 2.77, "RohSihwan"),
  ("오타니 쇼헤이", "P", 28, 3.00, "ShoheiOhtani"),
  ("양석환", "1B", 31, 1.08, "YangSukHwan"),
  ("문보경", "3B", 22, 1.76, "MoonBoGyeong"),
  ("최형우", "DH", 39, 1.55, "ChoiHyoungWoo"),
  ("손아섭", "LF", 35, 1.49, "SonAhSeop"),
  ("김지찬", "2B", 22, 1.29, "KimJichan"),
  ("강민호", "C", 37, 1.94, "KangMinho");
SELECT * FROM player;

INSERT INTO team VALUES (1, '삼성 라이온즈', '대구', 'KBO');
INSERT INTO team (tname, league) VALUES
  ("KT 위즈", "KBO"),
  ("롯데 자이언츠", "KBO"),
  ("키움 히어로즈", "KBO"),
  ("SSG 랜더스", "KBO"),
  ("대한민국 야구 국가대표 팀", "WBSC"),
  ("한화 이글스", "KBO"),
  ("로스앤젤레스 에인절스", "MLB"),
  ("일본 야구 국가대표 팀", "WBSC"),
  ("두산 베어스", "KBO"),
  ("LG 트윈스", "KBO"),
  ("KIA 타이거즈", "KBO"),
  ("NC 다이노스", "KBO");
SELECT * FROM team;

SELECT * FROM team;
SELECT * FROM player;

INSERT INTO playerlist VALUES (1,2);
INSERT INTO playerlist VALUES 
  (2, 1),
  (3, 3),
  (4, 5),
  (5, 2),
  (6, 4),
  (4, 6),
  (5, 6),
  (6, 6),
  (7, 7),
  (8, 8),
  (8, 9),
  (9, 10),
  (10, 11),
  (11, 12),
  (12, 13),
  (13, 1),
  (14, 1);
SELECT * FROM playerlist;

SELECT * FROM team;
SELECT * FROM playerlist;
SELECT * FROM player;

SELECT picture, league, tname, pname, position, age, war FROM team
  LEFT JOIN playerlist ON team.id = playerlist.teamid
  LEFT JOIN player ON playerlist.playid = player.id;
  