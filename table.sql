/*default boolean behaviour foun here: http://stackoverflow.com/questions/2221069/create-table-in-mysql-with-default-boolean-false */
CREATE TABLE `sat_input` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`sensorid` int(11) NOT NULL,
`satlevel` int(11) NOT NULL,
`waterdepth` int(11) NOT NULL,
`day` int(11),
`month` VARCHAR(255),
`year` int(11),
`hour` int(11),
`minute` int(11),
`ampm` varchar(255),
PRIMARY KEY (`id`),
CONSTRAINT `sat_fk_1` FOREIGN KEY (`sensorid`) REFERENCES `sensorcrop` (`sid`)
)ENGINE = InnoDB, DEFAULT CHARSET = latin1;

CREATE TABLE `sensorcrop` (
`sid` int(11) NOT NULL AUTO_INCREMENT,
`crop` int(11) NOT NULL,
PRIMARY KEY (`sid`),
CONSTRAINT `sensorcrop_fk_1` FOREIGN KEY (`crop`) REFERENCES `croplevel` (`cid`)
)ENGINE = InnoDB, DEFAULT CHARSET = latin1;


CREATE TABLE `croplevel` (
`cid` int(11) NOT NULL AUTO_INCREMENT,
`crop` varchar(255) NOT NULL,
`satlevel` int(11) NOT NULL,
`depth` int(11) NOT NULL,
PRIMARY KEY (`cid`)
)ENGINE = InnoDB, DEFAULT CHARSET = latin1;

//some crops with levels to check against, these are the acceptable levels 
INSERT INTO croplevel (crop, satlevel, depth) 
VALUES ('corn', '30', '2');
INSERT INTO croplevel (crop, satlevel, depth) 
VALUES ('lettuce', '40', '3');
INSERT INTO croplevel (crop, satlevel, depth) 
VALUES ('yellow squash', '35', '1');
INSERT INTO croplevel (crop, satlevel, depth) 
VALUES ('strawberries', '50', '1');
INSERT INTO croplevel (crop, satlevel, depth) 
VALUES ('tomatoes', '15', '4'); 

//some sensors and the crops theyre planted in, likely multiple sensors per field.
INSERT INTO sensorcrop (crop) 
VALUES ('1'); 
INSERT INTO sensorcrop (crop) 
VALUES ('5'); 
INSERT INTO sensorcrop (crop) 
VALUES ('3'); 
INSERT INTO sensorcrop (crop) 
VALUES ('5'); 
INSERT INTO sensorcrop (crop) 
VALUES ('4'); 
INSERT INTO sensorcrop (crop) 
VALUES ('2'); 
INSERT INTO sensorcrop (crop) 
VALUES ('4'); 
