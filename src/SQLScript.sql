--删除数据库
DROP DATABASE IF EXISTS bookstore;
--创建数据库
CREATE DATABASE bookstore CHARACTER SET UTF8;
--使用bookstore数据库
USE bookstore;
--删除数据表
DROP TABLE IF EXISTS details;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS admin;
--创建数据表
--1.创建图书类型表
CREATE TABLE item(
iid          INT   AUTO_INCREMENT,
title        VARCHAR(200)  NOT NULL,
CONSTRAINT pk_iid PRIMARY KEY(iid)
)type=innodb;
--2.创建管理员信息表
CREATE TABLE admin(
aid         VARCHAR(50),
password    VARCHAR(32) NOT NULL,
lastdate    DATETIME,
CONSTRAINT pk_aid PRIMARY KEY(aid)
)type=innodb;
--3.创建用户信息表
CREATE TABLE member(
mid         VARCHAR(50),
password    VARCHAR(32) NOT NULL,
name        VARCHAR(50),
phone       VARCHAR(50),
address     VARCHAR(100),
code        VARCHAR(100),
regdate     DATETIME     NOT NULL,
photo       VARCHAR(50)  DEFAULT 'nophoto.jpg',
CONSTRAINT  pk_mid       PRIMARY KEY(mid)
)type=innodb;
--4.创建图书信息表
--主键是能确定一条记录的唯一标识，比如，一条记录包括身份正号，姓名，年龄。
--身份证号是唯一能确定你这个人的，其他都可能有重复，所以，身份证号是主键。
--外键用于与另一张表的关联。是能确定另一张表记录的字段，用于保持数据的一致性。
--比如，A表中的一个字段，是B表的主键，那他就可以是A表的外键。
CREATE TABLE books(
bid         INT AUTO_INCREMENT,
iid         INT,
aid         VARCHAR(50),
title       VARCHAR(50),
writer      VARCHAR(50),
publisher   VARCHAR(50),
isbn        VARCHAR(50),
pubdate     DATETIME,
price       FLOAT,
amount      INT,
bow         INT,
note        TEXT,
photo       VARCHAR(100),
status      INT,
CONSTRAINT  pk_bid     PRIMARY KEY(bid),
CONSTRAINT  fk_iid     FOREIGN KEY(iid) REFERENCES item(iid) ON DELETE SET NULL,
CONSTRAINT  fk_aid     FOREIGN KEY(aid) REFERENCES admin(aid) ON DELETE SET NULL
)type=innodb;
--5.创建订单信息表
CREATE TABLE orders(
oid         INT        AUTO_INCREMENT,
mid         VARCHAR(50),
name        VARCHAR(50),
phone       VARCHAR(50),
address     VARCHAR(100),
credate     DATETIME,
pay         FLOAT,
CONSTRAINT  pk_oid     FOREIGN KEY(oid),
CONSTRAINT  fk_mid     FOREIGN KEY(mid) REFERENCES member(mid) ON DELETE CASCADE,
)type=innodb;
--6.创建订单详情表
CREATE TABLE details(
odid         INT          AUTO_INCREMENT,
oid          INT          NOT NULL,
bid          INT,
title        VARCHAR(50)  NOT NULL,
price        FLOAT        NOT NULL,
amount       INT          NOT NULL,
CONSTRAINT   pk_odid      PRIMARY KEY(odid),
CONSTRAINT   fk_oid       FOREIGN KEY(oid) REFERENCES orders(oid) ON DELETE CASCADE,
CONSTRAINT   fk_bid       FOREIGN KEY(bid) REFERENCES books(bid) ON DELETE SET NULL
)type=innodb;




