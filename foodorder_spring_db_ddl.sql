CREATE TABLE `user` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `password` VARCHAR(128) NOT NULL,
    `lastLogin` DATETIME DEFAULT NULL,
    `isSuperuser` BOOLEAN NOT NULL DEFAULT FALSE,
    `username` VARCHAR(150) NOT NULL UNIQUE,
    `firstName` VARCHAR(150) NOT NULL DEFAULT '',
    `lastName` VARCHAR(150) NOT NULL DEFAULT '',
    `email` TEXT,
    `isStaff` BOOLEAN NOT NULL DEFAULT FALSE,
    `isActive` BOOLEAN NOT NULL DEFAULT TRUE,
    `dateJoined` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `avatar` TEXT,
    `name` VARCHAR(200) NOT NULL,
    `phone` VARCHAR(11) DEFAULT NULL,
    `type` VARCHAR(10) NOT NULL DEFAULT 'INDIVIDUAL',
    `dateCreated` DATE NOT NULL DEFAULT (CURRENT_DATE),
    `dateModified` DATE NOT NULL DEFAULT (CURRENT_DATE)
    
);

CREATE TABLE `order` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `userId` BIGINT,
    `isValid` BOOLEAN NOT NULL DEFAULT FALSE,
    `paymentType` VARCHAR(10) NOT NULL DEFAULT 'CASH',
    `totalPrice` FLOAT NOT NULL DEFAULT 0,
    `shipAddress` TEXT NOT NULL ,
    `dateOrder` DATE NOT NULL DEFAULT (CURRENT_DATE),
    `dateCreated` DATE NOT NULL DEFAULT (CURRENT_DATE),
    `dateModified` DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE CASCADE
);

CREATE TABLE `shop` (
    `userId` BIGINT PRIMARY KEY,
    `location` TEXT NOT NULL ,
    `isValid` BOOLEAN NOT NULL DEFAULT FALSE,
    `shipPayment` FLOAT NOT NULL DEFAULT 0,
    `dateCreated` DATE NOT NULL DEFAULT (CURRENT_DATE),
    `dateModified` DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE CASCADE
);

CREATE TABLE `dish` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `shopId` BIGINT,
    `name` VARCHAR(200) NOT NULL,
    `price` FLOAT NOT NULL DEFAULT 0,
    `picture` TEXT,
    `isAvailable` BOOLEAN DEFAULT TRUE,
    `daySession` VARCHAR(10) DEFAULT '',
    `description` TEXT ,
    `dateCreated` DATE NOT NULL DEFAULT (CURRENT_DATE),
    `dateModified` DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (`shopId`) REFERENCES `shop`(`userId`) ON DELETE CASCADE
);

CREATE TABLE `menu` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(350) NOT NULL DEFAULT 'Thực Đơn',
    `shopId` BIGINT,
    `dateCreated` DATE NOT NULL DEFAULT (CURRENT_DATE),
    `dateModified` DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (`shopId`) REFERENCES `shop`(`userId`) ON DELETE CASCADE
);

CREATE TABLE `comment` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `userId` BIGINT,
    `shopId` BIGINT,
    `dishId` BIGINT,
    `parentId` BIGINT,
    `content` TEXT ,
    `dateCreated` DATE NOT NULL DEFAULT (CURRENT_DATE),
    `dateModified` DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`shopId`) REFERENCES `shop`(`userId`) ON DELETE CASCADE,
    FOREIGN KEY (`dishId`) REFERENCES `dish`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`parentId`) REFERENCES `comment`(`id`) ON DELETE CASCADE
);

CREATE TABLE `rate` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `userId` BIGINT,
    `dishId` BIGINT,
    `stars` INT NOT NULL DEFAULT 1,
    `dateCreated` DATE NOT NULL DEFAULT (CURRENT_DATE),
    `dateModified` DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`dishId`) REFERENCES `dish`(`id`) ON DELETE CASCADE,
    UNIQUE (`userId`, `dishId`)
);

CREATE TABLE `orderDish` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `orderId` BIGINT NOT NULL,
    `dishId` BIGINT NOT NULL,
    `count` INT NOT NULL DEFAULT 0,
    `sideNote` TEXT ,
    `dateCreated` DATE NOT NULL DEFAULT (CURRENT_DATE),
    `dateModified` DATE NOT NULL DEFAULT (CURRENT_DATE) ,
    FOREIGN KEY (`orderId`) REFERENCES `order`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`dishId`) REFERENCES `dish`(`id`) ON DELETE CASCADE,
    UNIQUE (`orderId`, `dishId`)
);

CREATE TABLE `orderMenu` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `orderId` BIGINT NOT NULL,
    `menuId` BIGINT NOT NULL,
    `count` INT NOT NULL DEFAULT 0,
    `sideNote` TEXT ,
    `dateCreated` DATE NOT NULL DEFAULT (CURRENT_DATE),
    `dateModified` DATE NOT NULL DEFAULT (CURRENT_DATE ),
    FOREIGN KEY (`orderId`) REFERENCES `order`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`menuId`) REFERENCES `menu`(`id`) ON DELETE CASCADE,
    UNIQUE (`orderId`, `menuId`)
);

CREATE TABLE `menuDish` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `menuId` BIGINT NOT NULL,
    `dishIdorder` BIGINT NOT NULL,
    `count` INT NOT NULL DEFAULT 1,
    `dateCreated` DATE NOT NULL DEFAULT (CURRENT_DATE),
    `dateModified` DATE NOT NULL DEFAULT (CURRENT_DATE ),
    FOREIGN KEY (`menuId`) REFERENCES `menu`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`dishId`) REFERENCES `dish`(`id`) ON DELETE CASCADE,
    UNIQUE (`menuId`, `dishId`)
);



