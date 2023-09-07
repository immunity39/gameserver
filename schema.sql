use webapp;

DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `room`;
DROP TABLE IF EXISTS `room_member`;

CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `leader_card_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
);

CREATE TABLE `room` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `live_id` int NOT NULL,
    `room_master` bigint NOT NULL,
    `joined_user_count` int NOT NULL,
    `max_user_count` int NOT NULL,
    `exist` boolean NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`room_master`) REFERENCES `user`(`id`)
);

CREATE TABLE `room_member` (
    `room_id` bigint NOT NULL,
    `user_id` bigint NOT NULL,
    `difficulty` int NOT NULL,
    PRIMARY KEY (`room_id`, `user_id`),
    FOREIGN KEY (`user_id`) REFERENCES `user`(`id`),
    FOREIGN KEY (`room_id`) REFERENCES `room`(`id`)
);