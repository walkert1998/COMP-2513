#
# TABLE STRUCTURE FOR: contacts
#

CREATE DATABASE contacts;
USE contacts;

CREATE USER 'contactsdb'@'localhost' IDENTIFIED BY 'contactsdb';
GRANT ALL PRIVILEGES ON * . * TO 'contactsdb'@'localhost';
FLUSH PRIVILEGES;

DROP TABLE IF EXISTS `contacts`;

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  `added` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (1, 'Angus', 'Harris', 'ubergstrom@example.com', '2005-12-21', '1992-06-11 06:53:12');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (2, 'Eleazar', 'Mraz', 'kertzmann.pink@example.com', '2006-10-13', '2009-01-06 11:28:13');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (3, 'Viviane', 'Hermiston', 'quigley.sydney@example.org', '1973-01-12', '2010-01-13 16:18:25');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (4, 'Freeda', 'Cartwright', 'von.emmitt@example.com', '1978-04-14', '1982-07-30 01:48:53');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (5, 'Jasen', 'Cummerata', 'yessenia70@example.org', '1995-04-24', '2013-08-04 07:49:50');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (6, 'Natasha', 'Kris', 'lonie02@example.net', '1978-09-08', '2006-08-29 19:26:48');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (7, 'Ari', 'Greenholt', 'hettinger.imani@example.net', '2011-12-22', '1993-06-03 11:03:32');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (8, 'Bernhard', 'Brown', 'rmayer@example.net', '1992-04-26', '1991-02-18 00:44:00');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (9, 'Berneice', 'Gulgowski', 'antoinette64@example.net', '1983-11-02', '2011-04-07 18:43:14');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (10, 'Alexandre', 'Hessel', 'raquel05@example.com', '1973-02-26', '1996-11-05 14:32:43');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (11, 'Aniya', 'Gusikowski', 'fullrich@example.net', '2002-06-26', '2000-09-13 01:36:29');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (12, 'Jaylin', 'Ortiz', 'williamson.osbaldo@example.org', '1991-12-12', '1987-12-16 06:35:46');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (13, 'Kenyon', 'Lang', 'wilbert89@example.org', '2000-04-22', '1977-06-01 08:03:35');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (14, 'Jolie', 'Hane', 'madge26@example.com', '1992-08-15', '1995-05-24 01:49:56');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (15, 'Hazle', 'Rau', 'bruen.haskell@example.com', '1993-08-27', '2010-08-17 11:53:42');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (16, 'Antwon', 'Graham', 'precious.vandervort@example.com', '1985-12-01', '1994-08-26 19:24:37');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (17, 'Ayana', 'Oberbrunner', 'dan69@example.com', '1978-03-20', '2009-12-16 02:44:15');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (18, 'Mario', 'Keebler', 'enola20@example.net', '1993-12-11', '2011-01-23 06:06:36');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (19, 'Zetta', 'Gaylord', 'koch.eulalia@example.net', '1974-04-10', '1977-10-22 03:18:41');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (20, 'Shawna', 'Herzog', 'farrell.jimmie@example.com', '1975-05-19', '2005-08-19 15:08:36');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (21, 'Gregoria', 'Lindgren', 'wcarter@example.net', '1979-05-17', '1973-03-11 10:35:24');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (22, 'Verdie', 'Funk', 'goldner.camille@example.net', '1991-07-05', '1987-07-29 09:18:15');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (23, 'Fiona', 'Fritsch', 'abagail.hand@example.net', '1987-09-20', '1991-07-05 21:12:34');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (24, 'Stephon', 'Paucek', 'jharvey@example.net', '1986-12-16', '1975-01-17 16:19:24');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (25, 'Van', 'Toy', 'jaskolski.rocio@example.com', '1993-11-14', '1991-08-21 01:21:41');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (26, 'Breanne', 'Wiza', 'blick.lavonne@example.com', '1987-08-03', '1993-12-13 05:05:56');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (27, 'Alfonso', 'Gusikowski', 'scarroll@example.com', '1990-12-31', '2015-01-12 06:31:58');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (28, 'Susan', 'Terry', 'ohara.alphonso@example.net', '2017-04-22', '1987-02-19 01:18:36');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (29, 'Eda', 'Walker', 'jrunolfsson@example.com', '1999-05-03', '2010-06-13 06:46:13');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (30, 'Chandler', 'Keeling', 'cordia.bahringer@example.org', '1970-09-02', '1985-02-22 08:34:31');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (31, 'Alene', 'Schmidt', 'vito.stehr@example.net', '1970-05-10', '2000-01-08 14:35:25');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (32, 'Willa', 'Rohan', 'kkling@example.org', '2008-08-02', '2017-03-28 03:04:35');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (33, 'Howard', 'Koch', 'purdy.harmony@example.com', '1983-11-08', '1973-01-24 12:26:58');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (34, 'Melvina', 'Miller', 'uriel76@example.org', '1980-09-04', '1992-12-06 19:09:27');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (35, 'Sammy', 'McLaughlin', 'rutherford.dudley@example.net', '1989-03-03', '2011-02-27 18:46:05');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (36, 'Nayeli', 'Rempel', 'shanahan.gordon@example.net', '1992-07-31', '2010-10-29 03:27:41');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (37, 'Guy', 'Fisher', 'ztrantow@example.com', '2019-09-29', '1987-05-18 01:13:42');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (38, 'Bailey', 'Friesen', 'reggie90@example.com', '1972-01-15', '2008-02-16 18:57:50');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (39, 'Mireya', 'Kiehn', 'deonte14@example.org', '2018-02-24', '1990-08-27 06:13:27');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (40, 'Carmelo', 'Legros', 'eulalia.lubowitz@example.org', '1989-01-13', '1988-01-04 05:21:52');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (41, 'Gregoria', 'Langworth', 'ihartmann@example.com', '1977-04-22', '2014-05-28 04:27:42');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (42, 'Jalyn', 'Harvey', 'hrowe@example.com', '1970-06-09', '1987-05-31 06:58:26');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (43, 'Donavon', 'Schamberger', 'montana52@example.net', '2001-11-30', '1996-11-13 06:35:13');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (44, 'Reanna', 'Smith', 'weimann.myron@example.com', '2004-05-04', '2014-06-13 20:09:12');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (45, 'Orrin', 'Batz', 'gregoria.keebler@example.org', '2014-01-07', '1992-08-11 17:34:56');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (46, 'Carissa', 'Macejkovic', 'ben95@example.com', '1985-04-01', '2011-02-17 23:57:09');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (47, 'Shemar', 'Jacobs', 'lynch.rogelio@example.com', '1980-01-13', '1973-09-13 00:50:45');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (48, 'Garett', 'Monahan', 'wmorissette@example.org', '2009-11-04', '1988-03-03 04:27:26');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (49, 'Zora', 'Ondricka', 'bergnaum.hillard@example.com', '2015-02-04', '1981-08-09 19:52:39');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (50, 'Isaias', 'Kulas', 'udamore@example.net', '1976-12-02', '2008-11-05 08:33:38');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (51, 'Hortense', 'VonRueden', 'shanahan.omer@example.org', '2003-12-17', '2000-07-23 18:19:41');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (52, 'Celine', 'Yost', 'gayle69@example.org', '2010-10-21', '1995-04-27 08:41:51');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (53, 'Brandon', 'Johnston', 'paucek.ivy@example.org', '2004-10-14', '2007-11-11 09:34:38');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (54, 'Patsy', 'Mraz', 'kovacek.aiyana@example.net', '2001-03-10', '1984-07-20 12:57:43');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (55, 'Ena', 'Little', 'shawn.satterfield@example.net', '2011-08-25', '1988-06-13 04:42:44');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (56, 'Paolo', 'Maggio', 'rahul.kihn@example.org', '1981-10-07', '1983-01-11 09:48:52');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (57, 'Krista', 'Hayes', 'lydia08@example.net', '1975-08-27', '1998-10-05 15:54:33');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (58, 'Zachariah', 'Koch', 'goldner.yvonne@example.com', '2003-12-13', '1981-11-22 10:21:53');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (59, 'Alex', 'Abshire', 'arnold95@example.org', '1986-11-10', '1972-02-14 15:28:22');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (60, 'Opal', 'Conroy', 'ian42@example.com', '1993-02-23', '2018-12-01 13:27:42');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (61, 'Zackary', 'Witting', 'frami.dan@example.net', '2003-01-10', '2003-05-03 09:03:49');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (62, 'Frederic', 'Wolff', 'ubins@example.org', '2016-08-27', '1985-10-03 09:33:05');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (63, 'Una', 'Feeney', 'orrin76@example.net', '1975-10-17', '1982-02-05 15:04:57');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (64, 'Graciela', 'Schneider', 'dach.cassie@example.org', '1973-10-14', '2013-12-05 15:25:20');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (65, 'Joana', 'Haley', 'rogers.grady@example.com', '1984-04-16', '1973-12-17 01:58:37');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (66, 'Eloy', 'Stark', 'courtney.armstrong@example.com', '2011-04-12', '1999-10-10 22:44:45');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (67, 'Genesis', 'Pollich', 'morton21@example.com', '1973-11-11', '1994-01-30 03:50:45');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (68, 'George', 'Reichel', 'tavares05@example.com', '2015-12-10', '1989-11-14 01:27:32');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (69, 'Beverly', 'Kiehn', 'arianna22@example.net', '2012-08-08', '2017-09-20 15:58:56');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (70, 'Mallory', 'Boehm', 'fay39@example.com', '2015-10-18', '1999-12-23 12:41:10');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (71, 'Anastacio', 'Ziemann', 'fborer@example.net', '1977-10-23', '1992-05-12 14:46:53');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (72, 'Mortimer', 'Zieme', 'kreiger.jamir@example.net', '1971-07-20', '1977-04-07 02:42:58');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (73, 'Barrett', 'Johnston', 'cheyenne.stark@example.net', '2011-04-14', '2017-02-12 19:47:00');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (74, 'Noah', 'Hackett', 'qhoppe@example.net', '2007-01-02', '1985-10-21 07:32:29');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (75, 'Ike', 'Johnston', 'gilbert.franecki@example.com', '2011-08-29', '1989-01-25 13:31:37');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (76, 'Pete', 'Lesch', 'jlubowitz@example.org', '1998-06-20', '1987-03-12 15:56:25');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (77, 'Deontae', 'Ziemann', 'lueilwitz.stevie@example.com', '1975-03-14', '2008-06-08 06:32:06');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (78, 'Marietta', 'Johnson', 'aaron.satterfield@example.org', '2015-04-04', '1978-02-09 17:56:24');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (79, 'Emmet', 'Cole', 'tmohr@example.net', '1986-07-22', '1992-09-07 02:41:32');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (80, 'Ariane', 'Kuhlman', 'smith.lambert@example.net', '2006-06-13', '1998-10-11 05:01:39');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (81, 'Brendan', 'Heathcote', 'qweber@example.com', '1984-10-18', '1994-01-20 19:20:45');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (82, 'Neal', 'Larson', 'nellie64@example.com', '1995-10-07', '1982-01-22 02:45:50');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (83, 'Peter', 'Morar', 'gerson79@example.com', '1983-02-19', '2004-10-13 15:38:26');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (84, 'Joaquin', 'Dare', 'kerluke.lucie@example.org', '2002-06-24', '1980-05-27 12:27:46');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (85, 'Everett', 'Orn', 'cummings.katharina@example.com', '2009-05-10', '2005-09-30 04:51:57');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (86, 'Greyson', 'Kuhic', 'nienow.bo@example.com', '1983-04-30', '1984-10-31 23:08:12');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (87, 'Olga', 'Cummings', 'erdman.furman@example.org', '2011-05-19', '1997-02-19 08:57:16');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (88, 'Cleta', 'Smith', 'bjacobs@example.net', '1978-12-17', '1994-11-19 09:59:16');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (89, 'Roselyn', 'Hilpert', 'njerde@example.net', '1988-02-29', '1994-10-31 02:08:33');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (90, 'Ashly', 'Klein', 'yvonne.abshire@example.com', '1997-05-24', '1979-08-16 19:07:51');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (91, 'Seamus', 'Lehner', 'melvina.lind@example.com', '2005-04-25', '1991-04-23 19:36:03');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (92, 'Sadye', 'Nolan', 'ccremin@example.org', '1985-07-04', '1977-05-13 22:36:20');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (93, 'Vada', 'Bashirian', 'will28@example.org', '1980-02-23', '2001-09-23 10:42:48');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (94, 'Daphney', 'Pollich', 'donnelly.adeline@example.com', '1983-11-22', '2002-01-23 16:48:09');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (95, 'Alexandro', 'Towne', 'briana07@example.com', '2018-01-10', '1996-05-01 03:46:15');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (96, 'Maria', 'Lowe', 'gabrielle89@example.org', '1992-06-07', '1976-09-17 00:11:51');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (97, 'Flo', 'Kulas', 'edythe.veum@example.org', '2004-01-25', '2005-11-13 04:50:32');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (98, 'Cayla', 'Cruickshank', 'francesco.witting@example.net', '1983-01-17', '1988-03-18 00:48:09');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (99, 'Gonzalo', 'Bashirian', 'leonie66@example.org', '2010-07-01', '2011-11-15 06:16:48');
INSERT INTO `contacts` (`id`, `first_name`, `last_name`, `email`, `birthdate`, `added`) VALUES (100, 'Declan', 'Friesen', 'valentine.wiza@example.net', '2007-02-05', '2008-07-21 21:17:28');
