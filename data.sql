drop table if exists user_authority;
drop table if exists `user`;
drop table if exists authority;

CREATE TABLE authority (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    PRIMARY KEY (id)
)  ENGINE=INNODB;
CREATE TABLE user (
    id BIGINT NOT NULL AUTO_INCREMENT,
    password VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
)  ENGINE=INNODB;
CREATE TABLE user_authority (
    user_id BIGINT NOT NULL,
    authority_id BIGINT NOT NULL,
    PRIMARY KEY (user_id , authority_id)
)  ENGINE=INNODB;

alter table user add constraint UK_sb8bbouer5wak8vyiiy4pf2bx unique (username);
alter table user_authority add constraint FKgvxjs381k6f48d5d2yi11uh89 foreign key (authority_id) references authority (id);
alter table user_authority add constraint FKpqlsjpkybgos9w2svcri7j8xy foreign key (user_id) references user (id);

INSERT INTO `authority`(`name`) VALUES ('ROLE_ADMIN');
INSERT INTO `authority`(`name`) VALUES ('ROLE_USER');

INSERT INTO `user` (`username`, `password`) VALUES ('admin','whatever the christ the hash value of admin is');

INSERT INTO `user_authority`(`authority_id`, `user_id`) VALUES (1, 1);
