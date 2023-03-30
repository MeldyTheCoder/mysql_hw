CREATE TABLE hello (
id INTEGER NOT NULL UNIQUE AUTO_INCREMENT,
url VARCHAR(255) NOT NULL,
comment VARCHAR(255) NULL,
PRIMARY KEY (id)
);

INSERT INTO hello (url, comment) VALUES (
"https://github.com/MeldyTheCoder/mysql_hw",
"Домашнее задание №1"
);