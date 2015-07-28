/*default boolean behaviour foun here: http://stackoverflow.com/questions/2221069/create-table-in-mysql-with-default-boolean-false */
CREATE TABLE `sat_input` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`sensor id` int(11) NOT NULL,
`satlevel` int(11) NOT NULL,
`waterdepth` int(11) NOT NULL,
`day` int(11),
`month` VARCHAR(255),
`year` int(11),
`hour` int(11),
`minute` int(11),
`ampm` varchar(255),
PRIMARY KEY (`id`),
CONSTRAINT `sat_fk_1` FOREIGN KEY (`sensor id`) REFERENCES `sensorcrop` (`sid`)
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
