
-- 테이블 삭제
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE member;
DROP TABLE article;
DROP TABLE reply;
SET FOREIGN_KEY_CHECKS = 1;


-- 테이블 생성

CREATE TABLE member(
  id BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  email VARCHAR(100) NOT NULL UNIQUE KEY,
  password VARCHAR(255) NOT NULL,
  nickname VARCHAR(25) NOT NULL UNIQUE KEY,
  PRIMARY KEY (id)
);

CREATE TABLE article(
   id BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   member_id BIGINT(10) UNSIGNED NOT NULL,
   nickname VARCHAR(25) NOT NULL,
   title VARCHAR(150) NOT NULL,
   content TEXT NOT NULL,
   hit int UNSIGNED default 0,
   regdate DATETIME NOT NULL DEFAULT now(),
   update_date DATETIME NOT NULL DEFAULT now(),
   PRIMARY KEY (id)
);

CREATE TABLE reply(
  id BIGINT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  article_id BIGINT(10) UNSIGNED NOT NULL,
  member_id BIGINT(10) UNSIGNED NOT NULL,
  nickname VARCHAR(25) NOT NULL,
  content VARCHAR(255) NOT NULL,
  regdate DATETIME NOT NULL DEFAULT now(),
  update_date DATETIME NOT NULL DEFAULT now(),
  group_id BIGINT(10) UNSIGNED,
  group_order INT UNSIGNED NOT NULL DEFAULT 0,
  depth INT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
);

ALTER TABLE reply ADD FOREIGN KEY (member_id) REFERENCES member(id);
ALTER TABLE reply ADD FOREIGN KEY (article_id) REFERENCES article(id);
ALTER TABLE article ADD FOREIGN KEY (member_id) REFERENCES member(id);


-- 샘플 데이터
INSERT INTO member (email, password, nickname) VALUES ('dpudpu11@gmail.com', '1234', '대준');
INSERT INTO member (email, password, nickname) VALUES ('gildong@gmail.com', '1234', '홍길동');
INSERT INTO member (email, password, nickname) VALUES ('java@gmail.com', '1234', '자바');


INSERT INTO article (member_id, nickname, title, content) VALUES (1, '대준', '자바에 대하여', '헬로');
INSERT INTO article (member_id, nickname, title, content) VALUES (1, '대준', '서블릿에 대하여', '헬로');
INSERT INTO article (member_id, nickname, title, content) VALUES (1, '대준', 'JSP에 대하여', '헬로');

INSERT INTO reply (article_id, member_id, nickname, content, group_id, group_order, depth)
VALUES (1,1,'대준','자바 재밌나요?', 1, 0, 0);
INSERT INTO reply (article_id, member_id, nickname, content, group_id, group_order, depth)
VALUES (1,2,'홍길동','네 재미있습니다.', 1, 1, 1);
INSERT INTO reply (article_id, member_id, nickname, content, group_id, group_order, depth)
VALUES (1,3,'자바','전 재미없던데', 1, 2, 1);