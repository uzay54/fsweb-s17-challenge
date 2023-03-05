CREATE TABLE `yorum`(
    `yorum_id` INT auto_increment PRIMARY KEY,
    `haber_id` INT NOT NULL,
    `kullanici_id` INT NOT NULL,
    `yzamani` TIME NOT NULL,
    `yazar_id` INT NOT NULL
);
CREATE TABLE `guides`(
    `guide_id` INT auto_increment PRIMARY KEY,
    `guide_name` TEXT NOT NULL,
    `yazar_id` INT NOT NULL
);
CREATE TABLE `haberler`(
    `haber_id` INT auto_increment PRIMARY KEY,
    `ad` TEXT NOT NULL,
    `yazar_id` INT  NOT NULL,
    `urun_id` INT  NOT NULL,
    `yorum_id` INT NOT NULL
);
CREATE TABLE `yazar`(
    `yazar_id` INT auto_increment PRIMARY KEY,
    `ad` TEXT NOT NULL,
    `soyad` TEXT NOT NULL,
    `kullanici_id` INT NOT NULL
);
CREATE TABLE `urunler`(
    `urun_id` INT auto_increment PRIMARY KEY,
    `urun_adi` TEXT NOT NULL,
    `haber_id` INT NOT NULL
);
CREATE TABLE `kullanici`(
    `kullanici_id` INT auto_increment PRIMARY KEY,
    `ad` TEXT NOT NULL,
    `soyad` TEXT NOT NULL,
    `cinsiyet` TEXT NOT NULL,
    `uyelik_tarihi` DATETIME NOT NULL
);
ALTER TABLE haberler ADD foreign KEY (yazar_id) REFERENCES yazar(yazar_id);
ALTER TABLE guides ADD foreign KEY (yazar_id) REFERENCES yazar(yazar_id);
ALTER TABLE yorum ADD foreign KEY (yazar_id) REFERENCES yazar(yazar_id);
ALTER TABLE haberler ADD foreign KEY (urun_id) REFERENCES urunler(urun_id);
ALTER TABLE
    `yorum` ADD CONSTRAINT `yorum_haber_id_foreign` FOREIGN KEY(`haber_id`) REFERENCES `haberler`(`haber_id`);
ALTER TABLE
    `haberler` ADD CONSTRAINT `haberler_yorum_id_foreign` FOREIGN KEY(`yorum_id`) REFERENCES `yorum`(`yorum_id`);
ALTER TABLE
    `yazar` ADD CONSTRAINT `yazar_kullanici_id_foreign` FOREIGN KEY(`kullanici_id`) REFERENCES `kullanici`(`kullanici_id`);
ALTER TABLE yorum ADD foreign KEY (kullanici_id) REFERENCES kullanici(kullanici_id);