
DROP PROCEDURE IF EXISTS `del_in_reviews`;
DROP PROCEDURE IF EXISTS `add_in_reviews`;
DELIMITER $$
CREATE PROCEDURE  `add_in_reviews`(IN rev_id INT, IN comp_id INT, IN rating INT)
BEGIN


	CASE rating
		WHEN 1 THEN
			UPDATE olit_insurance_rating SET `olit_insurance_rating`.`one_star` = `olit_insurance_rating`.`one_star`+1,
			`olit_insurance_rating`.`count` = `olit_insurance_rating`.`count`+1, `olit_insurance_rating`.`average`= (
			(1*`olit_insurance_rating`.`one_star` + 2*`olit_insurance_rating`.`two_star`+ 3*`olit_insurance_rating`.`three_star` +
			 4*`olit_insurance_rating`.`four_star` +  5*`olit_insurance_rating`.`five_star`) /(`olit_insurance_rating`.`count`+1))
			 WHERE `olit_insurance_rating`.`company_id` = comp_id;

		WHEN 2 THEN
			UPDATE olit_insurance_rating SET `olit_insurance_rating`.`two_star` = `olit_insurance_rating`.`two_star`+1,
			`olit_insurance_rating`.`count` = `olit_insurance_rating`.`count`+1, `olit_insurance_rating`.`average`= (
			(1*`olit_insurance_rating`.`one_star` + 2*`olit_insurance_rating`.`two_star`+ 3*`olit_insurance_rating`.`three_star` +
			 4*`olit_insurance_rating`.`four_star` +  5*`olit_insurance_rating`.`five_star`) /(`olit_insurance_rating`.`count`+1))
			 WHERE `olit_insurance_rating`.`company_id` = comp_id;

		WHEN 3 THEN
			UPDATE olit_insurance_rating SET `olit_insurance_rating`.`three_star` = `olit_insurance_rating`.`three_star`+1,
			`olit_insurance_rating`.`count` = `olit_insurance_rating`.`count`+1, `olit_insurance_rating`.`average`= (
			(1*`olit_insurance_rating`.`one_star` + 2*`olit_insurance_rating`.`two_star`+ 3*`olit_insurance_rating`.`three_star` +
			 4*`olit_insurance_rating`.`four_star` +  5*`olit_insurance_rating`.`five_star`) /(`olit_insurance_rating`.`count`+1))
			 WHERE `olit_insurance_rating`.`company_id` = comp_id;

		WHEN 4 THEN
			UPDATE olit_insurance_rating SET `olit_insurance_rating`.`four_star` = `olit_insurance_rating`.`four_star`+1,
			`olit_insurance_rating`.`count` = `olit_insurance_rating`.`count`+1, `olit_insurance_rating`.`average`= (
			(1*`olit_insurance_rating`.`one_star` + 2*`olit_insurance_rating`.`two_star`+ 3*`olit_insurance_rating`.`three_star` +
			 4*`olit_insurance_rating`.`four_star` +  5*`olit_insurance_rating`.`five_star`) /(`olit_insurance_rating`.`count`+1))
			 WHERE `olit_insurance_rating`.`company_id` = comp_id;

		WHEN 5 THEN
			UPDATE olit_insurance_rating SET `olit_insurance_rating`.`five_star` = `olit_insurance_rating`.`five_star`+1,
			`olit_insurance_rating`.`count` = `olit_insurance_rating`.`count`+1, `olit_insurance_rating`.`average`= (
			(1*`olit_insurance_rating`.`one_star` + 2*`olit_insurance_rating`.`two_star`+ 3*`olit_insurance_rating`.`three_star` +
			 4*`olit_insurance_rating`.`four_star` +  5*`olit_insurance_rating`.`five_star`) /(`olit_insurance_rating`.`count`+1))
			 WHERE `olit_insurance_rating`.`company_id` = comp_id;

		ELSE
                        BEGIN
                        END;
	END CASE;

END$$
DELIMITER ;
DELIMITER $$
CREATE PROCEDURE `del_in_reviews`(IN rev_id INT, IN comp_id INT, IN rating INT)
BEGIN
	DELETE FROM `olit_comments_2` WHERE `olit_comments_2`.`entity_id` = rev_id;

	CASE rating
		WHEN 1 THEN
			UPDATE olit_insurance_rating SET `olit_insurance_rating`.`one_star` = `olit_insurance_rating`.`one_star`-1,
			`olit_insurance_rating`.`count` = `olit_insurance_rating`.`count`-1, `olit_insurance_rating`.`average`= (
			(1*`olit_insurance_rating`.`one_star` + 2*`olit_insurance_rating`.`two_star`+ 3*`olit_insurance_rating`.`three_star` +
			 4*`olit_insurance_rating`.`four_star` +  5*`olit_insurance_rating`.`five_star`) /(`olit_insurance_rating`.`count`-1))
			 WHERE `olit_insurance_rating`.`company_id` = comp_id;

		WHEN 2 THEN
			UPDATE olit_insurance_rating SET `olit_insurance_rating`.`two_star` = `olit_insurance_rating`.`two_star`-1,
			`olit_insurance_rating`.`count` = `olit_insurance_rating`.`count`-1, `olit_insurance_rating`.`average`= (
			(1*`olit_insurance_rating`.`one_star` + 2*`olit_insurance_rating`.`two_star`+ 3*`olit_insurance_rating`.`three_star` +
			 4*`olit_insurance_rating`.`four_star` +  5*`olit_insurance_rating`.`five_star`) /(`olit_insurance_rating`.`count`-1))
			 WHERE `olit_insurance_rating`.`company_id` = comp_id;

		WHEN 3 THEN
			UPDATE olit_insurance_rating SET `olit_insurance_rating`.`three_star` = `olit_insurance_rating`.`three_star`-1,
			`olit_insurance_rating`.`count` = `olit_insurance_rating`.`count`-1, `olit_insurance_rating`.`average`= (
			(1*`olit_insurance_rating`.`one_star` + 2*`olit_insurance_rating`.`two_star`+ 3*`olit_insurance_rating`.`three_star` +
			 4*`olit_insurance_rating`.`four_star` +  5*`olit_insurance_rating`.`five_star`) /(`olit_insurance_rating`.`count`-1))
			 WHERE `olit_insurance_rating`.`company_id` = comp_id;

		WHEN 4 THEN
			UPDATE olit_insurance_rating SET `olit_insurance_rating`.`four_star` = `olit_insurance_rating`.`four_star`-1,
			`olit_insurance_rating`.`count` = `olit_insurance_rating`.`count`-1, `olit_insurance_rating`.`average`= (
			(1*`olit_insurance_rating`.`one_star` + 2*`olit_insurance_rating`.`two_star`+ 3*`olit_insurance_rating`.`three_star` +
			 4*`olit_insurance_rating`.`four_star` +  5*`olit_insurance_rating`.`five_star`) /(`olit_insurance_rating`.`count`-1))
			 WHERE `olit_insurance_rating`.`company_id` = comp_id;

		WHEN 5 THEN
			UPDATE olit_insurance_rating SET `olit_insurance_rating`.`five_star` = `olit_insurance_rating`.`five_star`-1,
			`olit_insurance_rating`.`count` = `olit_insurance_rating`.`count`-1, `olit_insurance_rating`.`average`= (
			(1*`olit_insurance_rating`.`one_star` + 2*`olit_insurance_rating`.`two_star`+ 3*`olit_insurance_rating`.`three_star` +
			 4*`olit_insurance_rating`.`four_star` +  5*`olit_insurance_rating`.`five_star`) /(`olit_insurance_rating`.`count`-1))
			 WHERE `olit_insurance_rating`.`company_id` = comp_id;

		ELSE
                        BEGIN
                        END;
	END CASE;

END$$
DELIMITER ;

DELETE FROM `olit_insurance_reviews` WHERE company_id = -1;
DELETE FROM `olit_insurance_reviews` WHERE company_id = 0;

DROP TABLE IF EXISTS olit_insurance_rating;
CREATE TABLE IF NOT EXISTS olit_insurance_rating (
	rating_id int NOT NULL AUTO_INCREMENT,
	company_id int NOT NULL ,
	one_star int UNSIGNED,
	two_star int UNSIGNED,
	three_star int UNSIGNED,
	four_star int UNSIGNED,
	five_star int UNSIGNED,
	count int UNSIGNED,
        countreviews int UNSIGNED,
	average float,
	PRIMARY KEY(rating_id)
) CHARACTER SET utf8 COLLATE utf8_unicode_ci;


INSERT INTO olit_insurance_rating (company_id)
SELECT user_id FROM olit_insurance_users GROUP BY user_id;

UPDATE olit_insurance_rating
SET olit_insurance_rating.one_star=(
SELECT count(olit_insurance_reviews.rating) FROM olit_insurance_reviews
WHERE olit_insurance_reviews.company_id=olit_insurance_rating.company_id AND olit_insurance_reviews.rating=1);

UPDATE olit_insurance_rating
SET olit_insurance_rating.two_star=(
SELECT count(olit_insurance_reviews.rating) FROM olit_insurance_reviews
WHERE olit_insurance_reviews.company_id=olit_insurance_rating.company_id AND olit_insurance_reviews.rating=2);

UPDATE olit_insurance_rating
SET olit_insurance_rating.three_star=(
SELECT count(olit_insurance_reviews.rating) FROM olit_insurance_reviews
WHERE olit_insurance_reviews.company_id=olit_insurance_rating.company_id AND olit_insurance_reviews.rating=3);

UPDATE olit_insurance_rating
SET olit_insurance_rating.four_star=(
SELECT count(olit_insurance_reviews.rating) FROM olit_insurance_reviews
WHERE olit_insurance_reviews.company_id=olit_insurance_rating.company_id AND olit_insurance_reviews.rating=4);

UPDATE olit_insurance_rating
SET olit_insurance_rating.five_star=(
SELECT count(olit_insurance_reviews.rating) FROM olit_insurance_reviews
WHERE olit_insurance_reviews.company_id=olit_insurance_rating.company_id AND olit_insurance_reviews.rating=5);

UPDATE olit_insurance_rating
SET olit_insurance_rating.count=(
SELECT count(olit_insurance_reviews.rating) FROM olit_insurance_reviews
WHERE olit_insurance_reviews.company_id=olit_insurance_rating.company_id AND
    (olit_insurance_reviews.rating=5 OR olit_insurance_reviews.rating=4
        OR olit_insurance_reviews.rating=3 OR olit_insurance_reviews.rating=2 OR olit_insurance_reviews.rating=1));

UPDATE olit_insurance_rating
SET olit_insurance_rating.countreviews=(
SELECT count(olit_insurance_reviews.rating) FROM olit_insurance_reviews
WHERE olit_insurance_reviews.company_id=olit_insurance_rating.company_id);

UPDATE olit_insurance_rating
SET olit_insurance_rating.average=(
SELECT avg(olit_insurance_reviews.rating) FROM olit_insurance_reviews
WHERE olit_insurance_reviews.company_id=olit_insurance_rating.company_id AND
    (olit_insurance_reviews.rating=5 OR olit_insurance_reviews.rating=4 OR
        olit_insurance_reviews.rating=3 OR olit_insurance_reviews.rating=2 OR olit_insurance_reviews.rating=1));




DROP TRIGGER IF EXISTS `after_del_in_reviews`;
DROP TRIGGER IF EXISTS `after_update_status_in_reviews`;
DROP TRIGGER IF EXISTS `after_add_in_reviews`;

DELIMITER //

CREATE TRIGGER `after_del_in_reviews` AFTER DELETE ON `olit_insurance_reviews`
FOR EACH ROW BEGIN
  CALL	del_in_reviews(old.review_id, old.company_id, old.rating);
END //

CREATE TRIGGER `after_update_status_in_reviews` AFTER UPDATE ON `olit_insurance_reviews`
FOR EACH ROW BEGIN
if(old.status = 0 and new.status = 1) THEN
  CALL	add_in_reviews(new.review_id, new.company_id, new.rating);
END IF;
END //


DROP TRIGGER IF EXISTS `after_insert_in_card_post`;
DROP TRIGGER IF EXISTS `after_update_in_card_post`;
DROP TRIGGER IF EXISTS `after_delete_in_card_post`;
DELIMITER //

CREATE TRIGGER `after_insert_in_card_post` AFTER INSERT ON `olit_card_category`
FOR EACH ROW BEGIN
  INSERT INTO `olit_card_count` (card_id, name) VALUES(new.id, new.name);
END //
delimiter ;

delimiter //

CREATE TRIGGER `after_update_in_card_post` AFTER UPDATE ON `olit_card_category`
FOR EACH ROW BEGIN

  if NOT EXISTS (SELECT count(`olit_card_count`.`card_id`) FROM `olit_card_count` WHERE `olit_card_count`.`card_id` = new.id)
  then INSERT INTO `olit_card_count` (card_id, name) VALUES(new.id, new.name);
  end if;

END//

delimiter ;

CREATE TABLE IF NOT EXISTS `olit_card_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `descr` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` int(11) NOT NULL,
  `status_post` smallint(6) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `for_key` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;




CREATE TABLE IF NOT EXISTS `olit_card_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `aliase` varchar(255) DEFAULT NULL,
  `descr` varchar(255) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL DEFAULT '',
  `status_cat` smallint(6) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `olit_card_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `card_id` (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

DROP TRIGGER IF EXISTS `after_insert_in_card_post`;
DROP TRIGGER IF EXISTS `after_update_in_card_post`;
DROP TRIGGER IF EXISTS `after_delete_in_card_post`;
DELIMITER //

CREATE TRIGGER `after_insert_in_card_post` AFTER INSERT ON `olit_card_category`
FOR EACH ROW BEGIN
  INSERT INTO `olit_card_count` (card_id, name) VALUES(new.id, new.name);
END //
delimiter ;

delimiter //

CREATE TRIGGER `after_update_in_card_post` AFTER UPDATE ON `olit_card_category`
FOR EACH ROW BEGIN

  if NOT EXISTS (SELECT count(`olit_card_count`.`card_id`) FROM `olit_card_count` WHERE `olit_card_count`.`card_id` = new.id)
  then INSERT INTO `olit_card_count` (card_id, name) VALUES(new.id, new.name);
  end if;

END//

delimiter ;

ALTER TABLE `olit_card_count`
  ADD CONSTRAINT `for_key_count` FOREIGN KEY (`card_id`) REFERENCES `olit_card_category` (`id`) ON DELETE CASCADE;


ALTER TABLE `olit_card_post`
  ADD CONSTRAINT `for_key` FOREIGN KEY (`category_id`) REFERENCES `olit_card_category` (`id`) ON DELETE CASCADE;

  SELECT *
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA ='711-dev' AND TABLE_NAME ='olit_card_post' AND
CONSTRAINT_NAME <>'PRIMARY' AND REFERENCED_TABLE_NAME is not null;

ALTER TABLE olit_card_post DROP FOREIGN KEY for_key;

 SELECT *
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA ='711-dev' AND TABLE_NAME ='log_email_sending' AND
CONSTRAINT_NAME <>'PRIMARY' AND REFERENCED_TABLE_NAME is not null;

ALTER TABLE log_email_sending DROP index `Индекс 2`;

CREATE UNIQUE INDEX subscr_mailing
ON mailing_subscribers (email, type);

ALTER TABLE `mailing_options`
ADD CONSTRAINT `fk_mailing_email`
FOREIGN KEY (`email` )
REFERENCES mailing_subscribers (`email`)
ON DELETE CASCADE;

ALTER TABLE `mailing_options`
ADD CONSTRAINT `fk_mailing_type`
FOREIGN KEY (`type` )
REFERENCES mailing_subscribers (`type`)
ON DELETE CASCADE;




INSERT INTO `mailing_subscribers`(email, type)
SELECT email, 'mailing_reviews' FROM `olit_insurance_reviews`
WHERE email NOT IN (SELECT email FROM disabled_email_sending)
AND email REGEXP "^([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}$"
GROUP BY email;

CREATE TABLE IF NOT EXISTS `mailing_subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscr_mailing` (`email`,`type`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32771 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mailing_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `param` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_mailing_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



INSERT INTO `mailing_subscribers`(email, type)
SELECT email, 'mailing_reviews' FROM `olit_insurance_reviews`
WHERE email NOT IN (SELECT email FROM disabled_email_sending)
AND email REGEXP "^([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}$"
GROUP BY email;

ALTER TABLE `log_email_sending` ADD mailing_type VARCHAR(255) DEFAULT 'mailing_reviews' AFTER id ;
ALTER TABLE `disabled_email_sending` ADD mailing_type VARCHAR(255) DEFAULT 'mailing_reviews' AFTER id ;

CREATE TABLE `mailing_articles` (
    `id` INT(11) NOT NULL AUTO_INCREMENT , `to` VARCHAR(255) NOT NULL ,
    `from` VARCHAR(255) NOT NULL , `subject` VARCHAR(255) NOT NULL , `message` TEXT NOT NULL ,
    `day_add` DATE NOT NULL , `is_send` TINYINT NOT NULL ,
     PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

INSERT INTO `mailing_options` (email, type, param)
SELECT email, 'mailing_reviews' ,company_id FROM `olit_insurance_reviews`
WHERE email REGEXP "^([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}$" AND
company_id REGEXP "[0-9]+" AND
email NOT IN (SELECT email FROM disabled_email_sending)
GROUP BY email, company_id
SELECT
			`rev`.`review_id` as `review_id`,
            `rev`.`comment` as `comment`,
            `rev`.`comment` as `title`,
            `rev`.`date_add` as `date`,
            `rev`.`company_id` as `company_id`,
            `rev`.`email` as `email`,
            `rev`.`company_name`
FROM `olit_insurance_reviews` as `rev`


CREATE TABLE IF NOT EXISTS `olit_search` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) ,
  `company_id` int(11),
	`post_id` int(11),
	`static_id` int(11),
	`name` VARCHAR(255),
	`descr` VARCHAR(255),
	`search_fild` VARCHAR(255),
	`link` VARCHAR(255)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO olit_search (name, descr, photo, link, branch_id)
SELECT olit_insurance_users.company_name,
CONCAT_WS(' ',olit_company_branch.branch,olit_company_branch.functions, olit_company_branch.city,olit_company_branch.address), CONCAT('http://images.711.ru', olit_insurance_users.photo),
CONCAT_WS('/','/branch', olit_company_branch.id), olit_company_branch.id
FROM olit_company_branch JOIN olit_insurance_users
ON olit_company_branch.company_id=olit_insurance_users.user_id
WHERE olit_company_branch.id NOT IN (SELECT olit_search.branch_id FROM olit_search );


INSERT INTO olit_search (name, descr, photo, link, post_id, search_fild)
SELECT olit_post.title, CONCAT_WS(' ', olit_post.descr, olit_post.short_story),'/images/news-main/6.jpg', CONCAT('/news/', olit_category.alt_name,'/', olit_post.id, '-',olit_post.alt_name, '.html'),
olit_post.id, olit_post.keywords
FROM olit_post JOIN olit_category ON olit_post.category=olit_category.id and olit_post.id NOT IN (SELECT olit_search.post_id FROM olit_search);

INSERT INTO olit_search (name, descr, photo, link, static_id)
SELECT descr, concat_ws(' ',descr, metadescr, metatitle), '/images/news-main/4.jpg', concat('/', name, '.html'), id FROM `olit_static`
WHERE id NOT IN (SELECT olit_search.static_id FROM olit_search );

INSERT INTO `olit_post` ( short_story, keywords, title, category, alt_name, approve )
SELECT descr, keywords, name, category_id, aliase, 1 FROM olit_card_category WHERE id = 4


