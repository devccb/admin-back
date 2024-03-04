CREATE TABLE users (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR (80) NOT NULL,
  email VARCHAR (120) NOT NULL,
  login VARCHAR (40) NOT NULL,
  password VARCHAR (64) NOT NULL,
  status SMALLINT NOT NULL DEFAULT 1,
  updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE=InnoDB CHARACTER SET utf8mb4;

CREATE TABLE regionals (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR (100) NOT NULL,
  status SMALLINT NOT NULL DEFAULT 1,
  updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE=InnoDB CHARACTER SET utf8mb4;

CREATE TABLE administrations (
  id INT NOT NULL AUTO_INCREMENT,
  regional_id INT NOT NULL,
  name VARCHAR (100) NOT NULL,
  status SMALLINT NOT NULL DEFAULT 1,
  updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (regional_id) REFERENCES regionals (id) ON DELETE CASCADE
) ENGINE=InnoDB CHARACTER SET utf8mb4;

CREATE TABLE cities (
  id INT NOT NULL AUTO_INCREMENT,
  administration_id INT NOT NULL,
  name VARCHAR (100) NOT NULL,
  status SMALLINT NOT NULL DEFAULT 1,
  updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (administration_id) REFERENCES administrations (id) ON DELETE CASCADE
) ENGINE=InnoDB CHARACTER SET utf8mb4;

CREATE TABLE houses (
  id INT NOT NULL AUTO_INCREMENT,
  city_id INT NOT NULL,
  name VARCHAR (100) NOT NULL,
  address TEXT NOT NULL,
  code VARCHAR (20) NOT NULL,  
  status SMALLINT NOT NULL DEFAULT 1,
  updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (city_id) REFERENCES cities (id) ON DELETE CASCADE
) ENGINE=InnoDB CHARACTER SET utf8mb4;

