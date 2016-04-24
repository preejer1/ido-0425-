DROP TABLE RE_REPLY_TB;
DROP TABLE CONTENTS_REPLY_TB;
DROP TABLE SURVEY_CONTENTS_TB;
DROP TABLE SURVEY_TYPE_TB;
DROP TABLE SURVEY_TB;
DROP TABLE CONTENTS_IMAGE_TB;
DROP TABLE IDO_CONTENTS_TB;
DROP TABLE GIVEAWAY_TB;
DROP TABLE COUPON_TB;
DROP TABLE PARTNER_TB;
DROP TABLE FACEBOOK_USER_TB;
DROP TABLE KAKAO_USER_TB;
DROP TABLE DETAIL_TB;
DROP TABLE IDO_USER_TB;
DROP TABLE PARTNER_TB;

#PARTNER 유저 테이블
CREATE TABLE PARTNER_TB(PARTNER_ID MEDIUMINT NOT NULL AUTO_INCREMENT, DOCUMENT VARCHAR(20), REG_DATE DATE, PRIMARY KEY(PARTNER_ID));
#COUPON 테이블 
CREATE TABLE COUPON_TB(COUPON_ID MEDIUMINT NOT NULL AUTO_INCREMENT, PARTNER_ID MEDIUMINT NOT NULL, COUPON_NAME VARCHAR(100) NOT NULL, REG_DATE DATE NOT NULL, COUPON_EXPIRATION DATE NOT NULL, PRIMARY KEY(COUPON_ID), FOREIGN KEY(PARTNER_ID) REFERENCES PARTNER_TB(PARTNER_ID));


#IDO_USER 테이블
CREATE TABLE IDO_USER_TB(USER_ID MEDIUMINT NOT NULL AUTO_INCREMENT, PARTNER_ID MEDIUMINT NULL, USER_TYPE CHARACTER, USER_EMAIL VARCHAR(50), PASSWORD VARCHAR(50), SEX CHARACTER, PROFILE_PICTURE_PATH VARCHAR(100), NIKNAME VARCHAR(20), DETAIL CHARACTER, GIVEAWAY CHARACTER, USER_CODE VARCHAR(10), PRIMARY KEY(USER_ID), FOREIGN KEY(PARTNER_ID) REFERENCES PARTNER_TB(PARTNER_ID));
#DETAIL 정보입력 테이블
CREATE TABLE DETAIL_TB(USER_ID MEDIUMINT NOT NULL, USER_ADDRESS VARCHAR(100) NOT NULL, USER_AUTHENTICATION ENUM('Y','N') NOT NULL, USER_JOB TINYINT NOT NULL, USER_MARRY ENUM('Y','N') NOT NULL, PRIMARY KEY(USER_ID), FOREIGN KEY(USER_ID) REFERENCES IDO_USER_TB(USER_ID));
#GIVEAWAY_TB
CREATE TABLE GIVEAWAY_TB(GIVEAWAY_ID MEDIUMINT NOT NULL AUTO_INCREMENT, USER_ID MEDIUMINT NOT NULL, COUPON_ID MEDIUMINT NOT NULL, GIVEAWAY_NAME VARCHAR(100) NOT NULL, RECEIVE_DAY DATE NOT NULL, PRIMARY KEY(GIVEAWAY_ID), FOREIGN KEY(USER_ID) REFERENCES IDO_USER_TB(USER_ID), FOREIGN KEY(COUPON_ID) REFERENCES COUPON_TB(COUPON_ID));
#KAKAO_USER 테이블 // FACEBOOK_USER 테이블
CREATE TABLE FACEBOOK_USER_TB(FACEBOOK_USER_ID MEDIUMINT NOT NULL AUTO_INCREMENT, USER_EMAIL VARCHAR(50) NOT NULL, PRIMARY KEY(FACEBOOK_USER_ID));


#CONTENTS 테이블
CREATE TABLE IDO_CONTENTS_TB(CONTENTS_ID MEDIUMINT NOT NULL AUTO_INCREMENT, PARTNER_ID MEDIUMINT NOT NULL, TITLE VARCHAR(100) NOT NULL, THUMBNAIL_IMAGE_PATH VARCHAR(100) NOT NULL, REG_DATE DATE NOT NULL, CATEGORY VARCHAR(30) NOT NULL, IMAGE_TYPE VARCHAR(10) NOT NULL, SURVEY CHARACTER, CLICK_COUNT INTEGER, PRIMARY KEY(CONTENTS_ID), FOREIGN KEY(PARTNER_ID) REFERENCES PARTNER_TB(PARTNER_ID));
#CONTENTS_IMAGE 테이블, ** contents_id -"not null로 변경되야함."
CREATE TABLE CONTENTS_IMAGE_TB(CONTENTS_IMAGE_ID MEDIUMINT NOT NULL AUTO_INCREMENT, CONTENTS_ID MEDIUMINT NOT NULL, LI_VALUE MEDIUMINT NOT NULL, CONTENTS_TYPE SMALLINT NOT NULL, CONTENTS_IMAGE_PATH VARCHAR(200) NOT NULL, CONTENTS_IMAGE_ORIGIN VARCHAR(100) NOT NULL, CONTENTS VARCHAR(200) NOT NULL, ORDER_NUM SMALLINT NOT NULL, PRIMARY KEY(CONTENTS_IMAGE_ID), CONSTRAINT CONTENTS_IMAGE_TB_ibfk_1 FOREIGN KEY(CONTENTS_ID) REFERENCES IDO_CONTENTS_TB(CONTENTS_ID));
#CONTENTS -> 설문 테이블
CREATE TABLE SURVEY_TB(SURVEY_ID MEDIUMINT NOT NULL, CONTENTS_ID MEDIUMINT NOT NULL, SURVEY_TITLE VARCHAR(50) NOT NULL, PRIMARY KEY(SURVEY_ID), FOREIGN KEY(CONTENTS_ID) REFERENCES IDO_CONTENTS_TB(CONTENTS_ID));
#SURVEY TYPE_TB
CREATE TABLE SURVEY_TYPE_TB(SURVEY_TYPE_ID SMALLINT NOT NULL, SURVEY_ID MEDIUMINT NOT NULL, SURVEY_TYPE CHARACTER NOT NULL, SECOND_SURVEY_TITLE VARCHAR(100) NOT NULL, PRIMARY KEY(SURVEY_TYPE_ID), FOREIGN KEY(SURVEY_ID) REFERENCES SURVEY_TB(SURVEY_ID));
#SURVEY_CONTENTS
CREATE TABLE SURVEY_CONTENTS_TB(SURVEY_CONTENTS_ID SMALLINT NOT NULL, SURVEY_TYPE_ID SMALLINT NOT NULL, SURVEY_CONTENTS VARCHAR(100) NOT NULL, SURVEY_IMAGE_PATH VARCHAR(200) NOT NULL, PRIMARY KEY(SURVEY_CONTENTS_ID), FOREIGN KEY(SURVEY_TYPE_ID) REFERENCES SURVEY_TYPE_TB(SURVEY_TYPE_ID));
#CONTENTS_REPLY
CREATE TABLE CONTENTS_REPLY_TB(CONTENTS_REPLY_ID MEDIUMINT NOT NULL, CONTENTS_ID MEDIUMINT NOT NULL, USER_ID MEDIUMINT NOT NULL, REPLY VARCHAR(200) NOT NULL, REG_DATE DATE NOT NULL, RECOMMENDATION INTEGER, PRIMARY KEY(CONTENTS_REPLY_ID), FOREIGN KEY(CONTENTS_ID) REFERENCES IDO_CONTENTS_TB(CONTENTS_ID), FOREIGN KEY(USER_ID) REFERENCES IDO_USER_TB(USER_ID));
#RE_REPLY_TB
CREATE TABLE RE_REPLY_TB(CONTENTS_REPLY_ID MEDIUMINT NOT NULL, USER_ID MEDIUMINT NOT NULL, RE_REPLY VARCHAR(200) NOT NULL, REG_DATE DATE NOT NULL, PRIMARY KEY(CONTENTS_REPLY_ID), FOREIGN KEY(USER_ID) REFERENCES IDO_USER_TB(USER_ID));






#삭제
DROP TABLE CONTENTS_IMAGE_TB;
DROP TABLE IDO_CONTENTS_TB;
CREATE TABLE IDO_CONTENTS_TB(CONTENTS_ID MEDIUMINT NOT NULL AUTO_INCREMENT, PARTNER_ID MEDIUMINT NOT NULL, TITLE VARCHAR(100) NOT NULL, THUMBNAIL_IMAGE_PATH VARCHAR(100) NOT NULL, REG_DATE DATE NOT NULL, CATEGORY VARCHAR(30) NOT NULL, SURVEY CHARACTER, CLICK_COUNT INTEGER, PRIMARY KEY(CONTENTS_ID), FOREIGN KEY(PARTNER_ID) REFERENCES PARTNER_TB(PARTNER_ID));
CREATE TABLE CONTENTS_IMAGE_TB(CONTENTS_IMAGE_ID MEDIUMINT NOT NULL AUTO_INCREMENT, CONTENTS_ID MEDIUMINT NOT NULL, LI_VALUE MEDIUMINT NOT NULL, CONTENTS_TYPE SMALLINT NOT NULL, CONTENTS_IMAGE_PATH VARCHAR(200) NOT NULL, CONTENTS_IMAGE_ORIGIN VARCHAR(100) NOT NULL, CONTENTS VARCHAR(200) NOT NULL, ORDER_NUM SMALLINT NOT NULL, PRIMARY KEY(CONTENTS_IMAGE_ID), CONSTRAINT CONTENTS_IMAGE_TB_ibfk_1 FOREIGN KEY(CONTENTS_ID) REFERENCES IDO_CONTENTS_TB(CONTENTS_ID));

