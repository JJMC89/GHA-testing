CREATE TABLE IF NOT EXISTS `diffs` (
  `diff_id`          INT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `project`          VARBINARY(20)    NOT NULL,
  `lang`             VARBINARY(20)    NOT NULL,
  `page_namespace`   INT(11)          NOT NULL,
  `page_title`       VARBINARY(255)   NOT NULL,
  `rev_id`           INT(10) UNSIGNED NOT NULL,
  `rev_timestamp`    BINARY(14)       NOT NULL,
  `document_id`      INT(10) UNSIGNED DEFAULT NULL,
  `report_id`        INT(10) UNSIGNED DEFAULT NULL,
  `status`           TINYINT          NOT NULL,
  `status_timestamp` BINARY(14)       NOT NULL,
  `status_user`      VARBINARY(255)   DEFAULT NULL,
  UNIQUE KEY `rev_idx` (`project`, `lang`, `rev_id`),
  KEY `document_idx` (`document_id`),
  KEY `report_idx` (`report_id`),
  KEY `page_idx` (`project`, `lang`, `page_namespace`, `page_title`),
  KEY `rev_time_idx` (`project`, `lang`, `rev_timestamp`)
) ENGINE = InnoDB, DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `report_urls` (
  `report_id`        INT(10) UNSIGNED NOT NULL,
                     CONSTRAINT `fk_report_id`
                     FOREIGN KEY (`report_id`) REFERENCES `diffs` (`report_id`)
                     ON DELETE CASCADE
                     ON UPDATE CASCADE,
  `url`              BLOB             NOT NULL,
  `percent`          INT(10) UNSIGNED NOT NULL,
  `word_count`       INT(10) UNSIGNED NOT NULL,
  KEY `report_idx` (`report_id`)
) ENGINE = InnoDB, DEFAULT CHARACTER SET = utf8mb4;
