-- ============================================
--   1) CREATE DATABASES
-- ============================================

DROP DATABASE IF EXISTS STAGING;
DROP DATABASE IF EXISTS DATASTORE;
DROP DATABASE IF EXISTS DATAMART_DEV;
DROP DATABASE IF EXISTS DATAMART_PRD;
DROP DATABASE IF EXISTS METADATA;

CREATE DATABASE STAGING CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE DATASTORE CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE DATAMART_DEV CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE DATAMART_PRD CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE METADATA CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- ============================================
--   2) CREATE TABLES IN STAGING (MASTER MODEL)
-- ============================================

USE STAGING;

CREATE TABLE country (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    main_link VARCHAR(255),
    description TEXT,
    title VARCHAR(255),
    area VARCHAR(100),
    language VARCHAR(100),
    capital VARCHAR(100),
    currency VARCHAR(50),
    population VARCHAR(50),
    picture_name VARCHAR(255),
    picture_path VARCHAR(255),
    available TINYINT(1),
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    date_modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    modified_by_user VARCHAR(50)
);

CREATE TABLE country_highlights (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    country_id INT NOT NULL,
    description TEXT,
    link VARCHAR(255),
    picture_name VARCHAR(255),
    picture_path VARCHAR(255),
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    date_modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    modified_by_user VARCHAR(50),
    FOREIGN KEY (country_id) REFERENCES country(id) ON DELETE CASCADE
);

CREATE TABLE category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    picture_name VARCHAR(255),
    picture_path VARCHAR(255),
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    date_modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    modified_by_user VARCHAR(50)
);

CREATE TABLE customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    birthdate DATE,
    email VARCHAR(100),
    country VARCHAR(100),
    city VARCHAR(100),
    street VARCHAR(100),
    postal_code VARCHAR(20),
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    date_modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    modified_by_user VARCHAR(50)
);

CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    birthdate DATE,
    email VARCHAR(100),
    country VARCHAR(100),
    city VARCHAR(100),
    street VARCHAR(100),
    postal_code VARCHAR(20),
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    date_modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    modified_by_user VARCHAR(50)
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    country_id INT,
    description TEXT,
    price DECIMAL(10,2),
    city VARCHAR(100),
    street VARCHAR(100),
    postal_code VARCHAR(20),
    contact_id INT,
    picture_name VARCHAR(255),
    picture_path VARCHAR(255),
    link VARCHAR(255),
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    date_modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    modified_by_user VARCHAR(50),
    FOREIGN KEY (contact_id) REFERENCES contacts(id) ON DELETE SET NULL
    FOREIGN KEY (country_id) REFERENCES country(id) ON DELETE SET NULL
);

CREATE TABLE booking (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    price DECIMAL(10,2),
    days INT,
    date_start DATE,
    date_end DATE,
    payment_type VARCHAR(50),
    product INT,
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    date_modified DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    modified_by_user VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customer(id) ON DELETE CASCADE,
    FOREIGN KEY (product) REFERENCES products(id) ON DELETE SET NULL
);



-- =======================================================
--   3) CREATE TABLES IN OTHER DATABASES (LIKE STAGING)
-- =======================================================

-- ---------- DATASTORE ----------
USE DATASTORE;

CREATE TABLE country LIKE STAGING.country;
CREATE TABLE country_highlights LIKE STAGING.country_highlights;
CREATE TABLE category LIKE STAGING.category;
CREATE TABLE customer LIKE STAGING.customer;
CREATE TABLE contacts LIKE STAGING.contacts;
CREATE TABLE products LIKE STAGING.products;
CREATE TABLE booking LIKE STAGING.booking;

-- Add foreign keys manually (same as STAGING)
ALTER TABLE country_highlights
    ADD FOREIGN KEY (country_id) REFERENCES country(id) ON DELETE CASCADE;

ALTER TABLE products
    ADD FOREIGN KEY (contact_id) REFERENCES contacts(id) ON DELETE SET NULL;

ALTER TABLE booking
    ADD FOREIGN KEY (customer_id) REFERENCES customer(id) ON DELETE CASCADE,
    ADD FOREIGN KEY (product) REFERENCES products(id) ON DELETE SET NULL;



-- ---------- DATAMART_DEV ----------
USE DATAMART_DEV;

CREATE TABLE country LIKE STAGING.country;
CREATE TABLE country_highlights LIKE STAGING.country_highlights;
CREATE TABLE category LIKE STAGING.category;
CREATE TABLE customer LIKE STAGING.customer;
CREATE TABLE contacts LIKE STAGING.contacts;
CREATE TABLE products LIKE STAGING.products;
CREATE TABLE booking LIKE STAGING.booking;

ALTER TABLE country_highlights
    ADD FOREIGN KEY (country_id) REFERENCES country(id) ON DELETE CASCADE;

ALTER TABLE products
    ADD FOREIGN KEY (contact_id) REFERENCES contacts(id) ON DELETE SET NULL;

ALTER TABLE booking
    ADD FOREIGN KEY (customer_id) REFERENCES customer(id) ON DELETE CASCADE,
    ADD FOREIGN KEY (product) REFERENCES products(id) ON DELETE SET NULL;



-- ---------- DATAMART_PRD ----------
USE DATAMART_PRD;

CREATE TABLE country LIKE STAGING.country;
CREATE TABLE country_highlights LIKE STAGING.country_highlights;
CREATE TABLE category LIKE STAGING.category;
CREATE TABLE customer LIKE STAGING.customer;
CREATE TABLE contacts LIKE STAGING.contacts;
CREATE TABLE products LIKE STAGING.products;
CREATE TABLE booking LIKE STAGING.booking;

ALTER TABLE country_highlights
    ADD FOREIGN KEY (country_id) REFERENCES country(id) ON DELETE CASCADE;

ALTER TABLE products
    ADD FOREIGN KEY (contact_id) REFERENCES contacts(id) ON DELETE SET NULL;

ALTER TABLE booking
    ADD FOREIGN KEY (customer_id) REFERENCES customer(id) ON DELETE CASCADE,
    ADD FOREIGN KEY (product) REFERENCES products(id) ON DELETE SET NULL;


-- -----------------------------------------
-- METADATA + PROCEDURE
-- -----------------------------------------

USE METADATA;

DELIMITER $$

CREATE PROCEDURE swap_table(
    IN db1 VARCHAR(64),
    IN db2 VARCHAR(64),
    IN tbl VARCHAR(64)
)
BEGIN
    SET @tmp = CONCAT(db1, '.', tbl, '_tmp_swap');

    SET @sql1 = CONCAT('RENAME TABLE ', db1, '.', tbl, ' TO ', @tmp);
    SET @sql2 = CONCAT('RENAME TABLE ', db2, '.', tbl, ' TO ', db1, '.', tbl);
    SET @sql3 = CONCAT('RENAME TABLE ', @tmp, ' TO ', db2, '.', tbl);

    PREPARE stmt1 FROM @sql1;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;

    PREPARE stmt2 FROM @sql2;
    EXECUTE stmt2;
    DEALLOCATE PREPARE stmt2;

    PREPARE stmt3 FROM @sql3;
    EXECUTE stmt3;
    DEALLOCATE PREPARE stmt3;
END $$

DELIMITER ;