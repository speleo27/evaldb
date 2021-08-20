
-- creation de la base de données
# CREATE DATABASE cinema;

-- Procedure de création des tables
DELIMITER //
CREATE PROCEDURE creationTable

BEGIN

-- creation  de la table cinemarooms
CREATE TABLE cinemarooms (
                               cinemaRoomId INT(2) PRIMARY KEY AUTO_INCREMENT NOT NULL,
                               roomNumber int DEFAULT NULL,
                               numberPlace int NOT NULL
);

-- creation de la table complexes
CREATE TABLE complexes(
                          id INT(2) PRIMARY KEY AUTO_INCREMENT NOT NULL,
                          name varchar(255) NOT NULL,
                          address varchar(255) NOT NULL,
                          city varchar(255) NOT NULL,
                          slug varchar(255)  NULL

);

-- creation de la table listOfRoomComplexes
Create TABLE ListOfRoomComplexe(
                                    listOfRoomId int(2) PRIMARY KEY AUTO_INCREMENT NOT NULL,
                                    complexeId int NOT NULL,
                                    cinemaRoomId int NOT NULL

);

-- creation de la table customer

CREATE TABLE customers(
                         customerId int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
                         customerFirstname varchar(255) NOT NULL,
                         customerLastname varchar(255) NOT NULL,
                         customerAddress varchar(255) NOT NULL,
                         customerCity varchar(255) NOT NULL,
                         customerEmail varchar(255) NOT NULL,
                         customerPass varchar(255) NOT NULL
);

-- creation de la table movies

CREATE TABLE movies(
                       movieId INT(2) PRIMARY KEY AUTO_INCREMENT NOT NULL,
                       movieName varchar(255) NOT NULL,
                       moviePicture varchar(255) NOT NULL,
                       movieDesc text,
                       slug varchar(255)  NULL
);

-- creation de la table prices

CREATE TABLE prices(
                       priceId INT(2) PRIMARY KEY AUTO_INCREMENT NOT NULL,
                       priceName varchar(255)  NOT NULL,
                       amount varchar(25) NOT NULL
);

-- creation de la table sessions

CREATE TABLE sessions(
                         sessionId int PRIMARY KEY AUTO_INCREMENT NOT NULL,
                         listOfRoom int NOT NULL,
                         movieId int NOT NULL,
                         date datetime NOT NULL

);

-- creation de la table reservations

CREATE TABLE reservations(
                             reservationId INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
                             customerId int DEFAULT NULL,
                             numberPlace int NOT NULL,
                             total varchar(5) DEFAULT NULL,
                             sessionId int NOT NULL

);

-- Contraintes pour la table `listofroomcomplexe`

ALTER TABLE `listOfRoomComplexe`
    ADD CONSTRAINT listOfRoomComplexe_constraint_1 FOREIGN KEY (`complexeId`) REFERENCES `complexes` (`id`),
    ADD CONSTRAINT listOfRoomComplexe_constraint_2 FOREIGN KEY (`cinemaRoomId`) REFERENCES `cinemarooms` (`cinemaRoomId`);


-- Contraintes pour la table `reservations`

ALTER TABLE `reservations`
    ADD CONSTRAINT reservations_constraint_1 FOREIGN KEY (`customerId`) REFERENCES `customers` (`customerId`),
    ADD CONSTRAINT reservations_constraint_2 FOREIGN KEY (`sessionId`) REFERENCES `sessions` (`sessionId`);

--
-- Contraintes pour la table `sessions`
--
ALTER TABLE `sessions`
    ADD CONSTRAINT sessions_constraint_1 FOREIGN KEY (`listOfRoom`) REFERENCES `listofroomcomplexe`(`listOfRoomId`),
    ADD CONSTRAINT sessions_constraint_2 FOREIGN KEY (`movieId`) REFERENCES `movies` (`movieId`);


END //
DELIMITER ;



INSERT INTO cinemarooms (roomNumber, numberPlace) VALUES( 1, 80);
INSERT INTO cinemarooms (roomNumber, numberPlace)  VALUES( 2, 180);
INSERT INTO cinemarooms (roomNumber, numberPlace)  VALUES( 3, 300);
INSERT INTO cinemarooms (roomNumber, numberPlace)  VALUES( 4, 280);
INSERT INTO cinemarooms (roomNumber, numberPlace)  VALUES( 5, 180);
INSERT INTO cinemarooms (roomNumber, numberPlace)  VALUES( 6, 200);
INSERT INTO cinemarooms (roomNumber, numberPlace)  VALUES( 7, 200);
INSERT INTO cinemarooms (roomNumber, numberPlace)  VALUES( 8, 200);
INSERT INTO cinemarooms (roomNumber, numberPlace)  VALUES( 9, 150);
INSERT INTO cinemarooms (roomNumber, numberPlace)  VALUES( 10, 200);
INSERT INTO cinemarooms (roomNumber, numberPlace)  VALUES( 11, 300);
INSERT INTO cinemarooms (roomNumber, numberPlace)  VALUES( 12, 100);
INSERT INTO cinemarooms (roomNumber, numberPlace)  VALUES( 13, 200);
INSERT INTO cinemarooms (roomNumber, numberPlace)  VALUES( 14, 300);
INSERT INTO cinemarooms (roomNumber, numberPlace)  VALUES( 15, 80);
INSERT INTO cinemarooms (roomNumber, numberPlace)  VALUES( 16, 300);
INSERT INTO cinemarooms (roomNumber, numberPlace)  VALUES( 17, 200);
INSERT INTO cinemarooms (roomNumber, numberPlace)  VALUES( 18, 200);
INSERT INTO cinemarooms (roomNumber, numberPlace)  VALUES( 19, 200);
INSERT INTO cinemarooms (roomNumber, numberPlace)  VALUES( 20, 250);

# insertion de données dans la table complexes

INSERT INTO complexes (name, address, city, slug)  VALUES( 'cinepolis', '15, chemin des greve', 'bordeaux', 'cinepolis/bordeaux');
 INSERT INTO complexes (name, address, city, slug)  VALUES( 'cinepolis', '18, place du capitol', 'toulouse', 'cinepolis/toulouse');
 INSERT INTO complexes (name, address, city, slug)  VALUES( 'cinepolis', '1, rue des chats', 'troyes', 'cinepolis/troyes');
 INSERT INTO complexes (name, address, city, slug)  VALUES( 'cinepolis', '5, rue de la grande armée', 'paris', 'cinepolis/paris');

# insertion de données dans la table customer

INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Ennis', 'Von Salzberg', 'Grim', 'Molave', 'evonsalzberg0@nifty.com', '6e574a8e768211a2000d88ff492c54e6ef65976e');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass)  VALUES( 'Gerome', 'Corbally', 'Susan', 'Yujin', 'gcorbally1@wunderground.com', '546d5f077889a3b18d8e44e527366fba44e7e3e0');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass)  VALUES( 'Sunshine', 'Radolf', 'Schiller', 'Darunban', 'sradolf2@sciencedaily.com', '0689614b4e766bf53c944961c325be4c24b1a2ac');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass)  VALUES( 'Georgianne', 'Ruggieri', 'Merry', 'Ulety', 'gruggieri3@senate.gov', '5b7dfc5495c6cc282b76901c7ad767d269e0a6e1');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass)  VALUES( 'Pen', 'Zienkiewicz', 'Nova', 'Três Rios', 'pzienkiewicz4@prlog.org', 'c8c5e4cfe9238c20cf782bd65acf03accab8d8d8');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass)  VALUES( 'Clifford', 'Escott', 'Oneill', 'Thành phố Bạc Liêu', 'cescott5@trellian.com', '4e759b12b3f638b3f6432581fbd860031f9cad1f');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass)  VALUES( 'Emerson', 'Boakes', 'Heffernan', 'Siquisique', 'eboakes6@zdnet.com', 'd98b0ac9438dc678fb93cb965094476599f647b4');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass)  VALUES( 'Philippine', 'Bodd', 'Red Cloud', 'Shitun', 'pbodd7@blogspot.com', '049a5451327ad7efe06366a816d20fc21483c9fe');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Harriott', 'Bicksteth', 'Coolidge', 'Windusakti Hilir', 'hbicksteth8@oakley.com', 'cf8db657f5e875cedee2f476e8cfd4e8ccac87d3');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Homerus', 'Shevlan', 'Texas', 'Vanáton', 'hoshevlan9@macromedia.com', 'b5b4c911965fad093759df89d40c81edd1f092ea');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Sax', 'Bullus', 'Kingsford', 'Poitiers', 'sbullusa@fastcompany.com', '6c785e4bad9518564f0a60480cd2b8a826930b50');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Bibi', 'Connal', 'Reinke', 'Anxi', 'bconnalb@fotki.com', '15fd98119edaeb8d57fddcacdbf1b04befe91b0d');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Coralie', 'Toulmin', 'New Castle', 'Almaty', 'ctoulminc@cbslocal.com', '02cc4481b461d700303b3292851feb5d67bcd95c');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Chicky', 'Heindl', 'Thackeray', 'Debre Tabor', 'cheindld@altervista.org', 'c74f3ee8dd43a2ac960dbdaf4693dfeddb30ddab');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Stewart', 'Garnall', 'Sullivan', 'Yulao', 'sgarnalle@narod.ru', 'e3956a19215225e9c1da245dd107089936489f6b');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Garold', 'Janodet', 'Mallard', 'Castelo', 'gjanodetf@uol.com.br', '8330bef5006ea1e7dd41e0f4b02c2fe3a7a20bdd');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Pepita', 'Tarver', '1st', 'Yangping', 'ptarverg@acquirethisname.com', '530b98255ea35b8e8e64af3da90ba73e63a9461d');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Edvard', 'Reddle', 'Algoma', 'Tanabe', 'ereddleh@cpanel.net', 'd8e80dcae313817fc96c65be485f769441314a6b');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Neale', 'Halso', '2nd', 'Dubiecko', 'nhalsoi@photobucket.com', 'e870e94fbdf7d588342708f944d27fbe15b0c840');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Helga', 'Crathorne', 'Butternut', 'Casma', 'hcrathornej@archive.org', '13bb30e309f73d12a0ac2ea8d8502c6afe7e4431');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Constanta', 'Blackway', 'Rutledge', 'Banjar Laing', 'cblackwayk@youku.com', '370e6ba61a4210364116f5e67812b8aaf294b7a0');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Sean', 'Pentecost', 'Towne', 'Tangchi', 'spentecostl@facebook.com', '50fcfd9ec33e0eb3ec87b9b33ffa75112922ba00');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Irene', 'Rosewarne', 'Sunfield', 'Nashville', 'irosewarnem@google.co.uk', '312563b48313c9bcd54c6629489f66e965e482fb');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Evelyn', 'Naptine', 'Maryland', 'Červená Voda', 'enaptinen@studiopress.com', 'e23abb2b1ede967a5b4599a58f0340085a6c79ba');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Winny', 'Haysey', 'Prairieview', 'Hulu', 'whayseyo@npr.org', '4660faba0bc1d5d7dcdf8eae15830e84c7779168');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Rolland', 'Hise', 'Bashford', 'Benito Juarez', 'rhisep@google.com.au', '532642a3ef6388d1a2cd4d18f50c004eafcc9ad0');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Maritsa', 'Bereford', 'Evergreen', 'Struga', 'mberefordq@google.fr', 'f346a4f5ccd9e4d6125569f297644f688cf24ede');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Odetta', 'Boriston', 'Debs', 'Jing’an', 'oboristonr@yelp.com', 'ffa30690fddc1f868e18c42d091412f430bf99f1');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Elladine', 'Umbers', 'Alpine', 'Desa Kertasari', 'eumberss@hatena.ne.jp', '4976595a3b7cb403fedfefb4a4aaeb000d9bed41');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Pancho', 'Field', 'Sundown', 'Fiditi', 'pfieldt@gov.uk', '335b512a6b4a83fc276a541a618b569844ec5f4f');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Kelwin', 'Gaynesford', 'Forster', 'Libertad', 'kgaynesfordu@nifty.com', '085cba6a46b7d707b8897ab855cd98cc50dccdb9');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Denys', 'McCudden', 'Linden', 'Pasirlaja', 'dmccuddenv@sphinn.com', '4eb57ffbcbf1512b8f79c696accf925707278d78');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Cyril', 'Jaouen', 'Fieldstone', 'Bahía Blanca', 'cjaouenw@cpanel.net', 'fe0a0dc0da4dcce5b3dc1eb8b531ebb5c77cffbd');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Perry', 'Preddy', 'Grasskamp', 'Naran-mandokhu Somon', 'ppreddyx@amazon.de', '90d728c4936d5848a09e3ea4725920aa42c900cb');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Madelaine', 'Ramet', 'Kenwood', 'Norsborg', 'mramety@php.net', '24bc8b233df58ea2d783c65e0532465a7cfdc015');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Fancy', 'O Hogan', 'Brown', 'Kołbiel', 'fohoganz@apache.org', 'f0c1cf33f7b805377a870f45ae65147ec6a38fb0');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Wilmette', 'Swaton', 'Kinsman', 'Atlanta', 'wswaton10@answers.com', '1454d4cc0de73a309912fb3c0aa0562f7ccc7e40');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Verine', 'McElrea', 'Lighthouse Bay', 'Miðvágur', 'vmcelrea11@nifty.com', '0e53c7c257a7ce4a5a7231c56b29f9d3cc415102');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Cirillo', 'Kember', 'Marquette', 'Tianta', 'ckember12@patch.com', '619b54db9c2f66604282e6a99cbcf55dab53e0ba');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Aubert', 'Steggles', 'Nova', 'Las Tejerías', 'asteggles13@cbc.ca', '6878575eabab98ffeb6d0ce7e9eebe879c84c043');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Lenora', 'Tattam', 'Cody', 'Obala', 'ltattam14@youku.com', '71900fa9de1cb2191bb6378966d3c20a16d78dfe');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Emmeline', 'Wyness', 'Merry', 'Dhībīn', 'ewyness15@springer.com', 'c91fba6d0bf82f4e704cb8a2b05ff28a78569159');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Cicely', 'Keppel', 'Petterle', 'Jishui', 'ckeppel16@unesco.org', 'ee49eacef5fa4ac76760d718b43ba561ff230d89');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Sheeree', 'Caris', 'Blackbird', 'Hastings', 'scaris17@ted.com', '41976bc43ba83eb09637b249957f731bb0b81e56');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Erminia', 'Digman', 'Trailsway', 'Lamotrek', 'edigman18@unc.edu', '0fa1a6453ae825a250c9bc8b0377979e9ae92171');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Heywood', 'Dexter', 'Vera', 'Eauripik', 'hdexter19@youtu.be', '4ffe58f06db9c49d47c400871175dbb173082209');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Jannelle', 'Philliskirk', 'Blackbird', 'Paisha', 'jphilliskirk1a@nature.com', '9cd9094b3bfd3f9d4f830684995d93a5e85a8e42');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Donny', 'Ciobutaru', 'Reinke', 'San José de Colinas', 'dciobutaru1b@posterous.com', '464ba341e07efb98257a3e9d9d49c5d289ce1d66');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Concordia', 'Eberle', 'Green', 'Novyye Cherëmushki', 'ceberle1c@nature.com', 'cb10afc3c5386cf360b997f021da43c974144fcb');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Rodolphe', 'Hodgets', 'Lawn', 'Créteil', 'rhodgets1d@home.pl', 'e34bab61a0b5215d89e2dc498a1ad42abd0f317f');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Cathyleen', 'Acock', 'Golden Leaf', 'Rietavas', 'cacock1e@npr.org', '8bc2626ff373001693a9c7e6a422ed931f889a57');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Seth', 'Farfull', 'Rusk', 'Huangpu', 'sfarfull1f@cam.ac.uk', 'f69f257ec1ff52552d5ac672a99a1b026b014065');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Ddene', 'Hulse', 'Jackson', 'Gandapura', 'dhulse1g@goo.ne.jp', 'fd1baa77393b9e8cb867059b7a5098e5cb6cef1d');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Leesa', 'Minero', 'Mockingbird', 'Pinayagan Norte', 'lminero1h@studiopress.com', 'e99713a7ed766ef2a3583712ee999b4d5f4cd920');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Drucy', 'Sollon', 'Grover', 'Moriki', 'dsollon1i@booking.com', '63204c12f2c3494b6ddae4b897f20e689071b455');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Niels', 'Bonavia', 'Vera', 'Atlanta', 'nbonavia1j@tripod.com', '1a700594db2823f8fe666da6d2e262f9f1aca8fa');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Cahra', 'De Ambrosis', 'Cody', 'Al Maḩwīt', 'cdeambrosis1k@usa.gov', '3e7a705c35be252002d4ce12685c7c1d2ccf4006d');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Matias', 'Blazynski', 'Dunning', 'Dębowa Łąka', 'mblazynski1l@senate.gov', '7d9550803f63677689ca46124db949908da5bb0a');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Jefferey', 'Dragge', 'Gateway', 'El Perico', 'jdragge1m@adobe.com', 'e4508f69d040f4ec26ed4de375188b600b616a62');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Alyse', 'Avrashin', 'Hovde', 'Blaye', 'aavrashin1n@house.gov', '2e2da27d65531e134129e8dfd1f2d642e33388fe');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Andras', 'de la Tremoille', 'Crowley', 'Liminka', 'adelatremoille1o@irs.gov', '3d85fa9f972a4ea5e5871de0af6cefa9295803e7');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Shelia', 'Scarbarrow', 'Golf Course', 'Bajo Naranjillo', 'sscarbarrow1p@buzzfeed.com', 'a77a277d329b970e9d06f57cf8cac9abe6bc0adf');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Angelia', 'Kedward', 'Monterey', 'Żurowa', 'akedward1q@a8.net', '6434df031d269e2ce1fbcd68c07d388479a8856c');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Olav', 'Dunlap', 'Hermina', 'Congas', 'odunlap1r@samsung.com', '5bae7731f8f520ef9dc482a4a8da4aaba34577b2');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Samantha', 'Willshear', 'Summer Ridge', 'Passal', 'swillshear1s@shop-pro.jp', 'd2e4e817c8b354b7ef85402f7ad624215c586a5f');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Bonita', 'Cadlock', 'Blaine', 'Greensboro', 'bcadlock1t@ezinearticles.com', '56eba5d9fb1442115b9463d441291e6422ee06a6');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Gwynne', 'Yersin', 'Oneill', 'Sam Phran', 'gyersin1u@bandcamp.com', 'c1924eaca54af9c3cffb6258871f0a2736f271c9');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Bat', 'Spellicy', 'Hovde', 'Matara', 'bspellicy1v@smh.com.au', 'ae0b0d7b9e98939f2bfcd4e79743a3d472760055');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Lynea', 'Rosnau', 'Bayside', 'Las Palmas', 'lrosnau1w@imdb.com', '3f5317c76847b7de920fbff70e446e81f22c7128');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Loni', 'Manklow', 'Tennessee', 'Tacoma', 'lmanklow1x@washington.edu', '6d40a0c6271334f8bd8d4053717e47670a69ef94');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Frans', 'Tournay', 'Westerfield', 'Pasirtundun', 'ftournay1y@flavors.me', '275ba0d211823fea9c9cc423d505d340b0e0fe1e');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Octavius', 'Waskett', 'Parkside', 'Tawaramoto', 'owaskett1z@imgur.com', '1fdae113a2061ee36c1538470e8095a88fd0fd1f');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Nealon', 'Denisovich', 'Park Meadow', 'Odesskoye', 'ndenisovich20@google.ca', 'fff6a9bf4f4175025ea89ab4ef01f03a0e8b5f2f');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Yvonne', 'Cortin', 'Stang', 'Khulo', 'ycortin21@amazonaws.com', '4df53382f2b729e71e869b0c21421fd9ec61c614');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Ewart', 'Bowerman', 'Sommers', 'Dioknisi', 'ebowerman22@wordpress.com', '6866e31dd644fac44942b67341b8d6547e1c910d');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Jerry', 'Bello', 'Orin', 'Houping', 'jbello23@last.fm', 'da78de2d8a2c526f41530826023bb659d7d45538');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Arabelle', 'Jaggar', 'Kipling', 'Beloye', 'ajaggar24@ucla.edu', '201dcb8ddbe50960590106e8985bb1c48a697863');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Charlot', 'Follin', 'Northwestern', 'Chenfangji', 'cfollin25@intel.com', '23bdb8ba69d9b206b49f85d04180081877384c2f');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Kirsteni', 'Koubek', 'Mariners Cove', 'Ōtake', 'kkoubek26@discuz.net', '809559c5683b40282839e315cbb7fa4775cb7177');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Raymund', 'Tellenbach', 'Brickson Park', 'Soubré', 'rtellenbach27@salon.com', '2165b1caac810e781db7bab35dfce72a4d5b9453');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Tootsie', 'Cordelette', 'Warner', 'Dongxin', 'tcordelette28@geocities.com', '455ef289d305f238ca85f2563fdfc98df36f6ff3');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Lon', 'Rowthorne', 'Monument', 'Yixin', 'lrowthorne29@latimes.com', '2d2db86c2aab325705788a8b969118a4240b64eb');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Godfree', 'Darrington', 'Darwin', 'Vitanje', 'gdarrington2a@engadget.com', '25d9f5f95176fd3c87644f87aabd3bbc9fa1d05b');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Willyt', 'Fabry', 'Jenifer', 'Drummondville', 'wfabry2b@whitehouse.gov', 'f404d34836a1a5bb886fe62ba097671ddd41ca8a');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Lowell', 'Duckerin', 'Lakewood Gardens', 'Tulsa', 'lduckerin2c@japanpost.jp', '68e966981e9399f15259315a7186de9d1e62527c');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Cobbie', 'Cuchey', 'Longview', 'Batiano', 'ccuchey2d@ezinearticles.com', '42f4b6d325b265b7c32a879ea68900f562cd879f');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Feodor', 'Kneebone', 'Killdeer', 'Saint-Herblain', 'fkneebone2e@umich.edu', 'ce720c35c1282577260d97db852d5f09381eb7ba');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Gaby', 'Linskill', 'Scoville', 'Huangtian', 'glinskill2f@mashable.com', '9e4e4de303e32f595cc1f41151c515b579792d56');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Barrie', 'OReilly', 'Caliangt', 'Umeå', 'boreilly2g@bbc.co.uk', 'c77ae72175cd87f23dbefe5d7ed0370d5d8a69ff');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Muriel', 'Keatch', 'Coolidge', 'Bezhta', 'mkeatch2h@purevolume.com', 'ed1659f56ef5769e22ad30a158fd7241614c8940');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Katheryn', 'Pentland', 'Grover', 'Tuofeng', 'kpentland2i@dot.gov', '64fd8d5d8c15a00f0d4bc89b5449ba3b3e8e519a');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Godard', 'Summersby', 'Mallard', 'Karangpete', 'gsummersby2j@github.io', '43a17c06557ef0f3537312f432dcfb5cf7aa2981');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Ambur', 'Tunnicliffe', 'Di Loreto', 'Caotan', 'atunnicliffe2k@ow.ly', 'e2120edd2f4f05a43a2fe97b56944d222b139c1f');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Tamar', 'Logsdale', 'Pine View', 'Ilare', 'tlogsdale2l@people.com.cn', '4e8d86c97eca84a7e3dce846b911fa60cca35495');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Romeo', 'Towriss', 'Arizona', 'Dédougou', 'rtowriss2m@ted.com', '5870e262d7e3eda5270c7f3ee2086b1e902f6354');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Mala', 'Jendrich', 'Main', 'Agbannawag', 'mjendrich2n@fema.gov', '83a8152152996e9e89368368e9edfff5323b6c33');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Yvette', 'Gavrieli', 'Mariners Cove', 'Banjar Jagasatru', 'ygavrieli2o@blogspot.com', '2dbe0ebffb7e8822ce7ca91e8be755d9b483e20f');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Averil', 'Mc Ilory', 'Annamark', 'Guaraciaba do Norte', 'amcilory2p@reference.com', 'e0c83460a280ba58972429fffda515eab58e849b');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Troy', 'Rodger', 'Rieder', 'Tamahú', 'trodger2q@exblog.jp', '5adfe779b5526ee6c1399ac864393463eba482e8');
INSERT INTO customers (customerFirstname, customerLastname, customerAddress, customerCity, customerEmail, customerPass) VALUES( 'Eunice', 'Hynam', 'Westend', 'Kangasala', 'ehynam2r@irs.gov', '0080ac730765debd3edd024dea45e76a03475017');

# insertion des données pour la table listOfRoomComplexes

INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 1, 2);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 1, 3);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 1, 4);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 1, 5);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 1, 6);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 2, 1);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 2, 3);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 2, 4);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 2, 5);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 2, 8);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 2, 9);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 2, 10);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 3, 1);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 3, 10);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 3, 11);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 3, 12);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 3, 13);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 3, 14);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 3, 15);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 3, 16);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 4, 1);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 4, 5);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 4, 8);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 4, 9);
INSERT INTO listofroomcomplexe (complexeId, cinemaRoomId)  VALUES( 4, 10);

# insertion de données dans la table movie

INSERT INTO movies (movieName, moviePicture, movieDesc, slug) VALUES( 'Kaamelot volet 1', 'https://fr.web.img3.acsta.net/pictures/21/06/29/12/45/0400641.jpg', 'un film sympa', 'film/kaamelot');
INSERT INTO movies (movieName, moviePicture, movieDesc, slug)  VALUES( 'Kaamelot volet 2', 'https://fr.web.img3.acsta.net/pictures/21/06/29/12/45/0400641.jpg', 'un film sympa', 'film/kaamelot2');
INSERT INTO movies (movieName, moviePicture, movieDesc, slug)  VALUES( 'Kaamelot volet 3', 'https://fr.web.img3.acsta.net/pictures/21/06/29/12/45/0400641.jpg', 'un film sympa', 'film/kaamelot3');
INSERT INTO movies (movieName, moviePicture, movieDesc, slug)  VALUES( 'fast furious 10', 'https://fr.web.img4.acsta.net/pictures/19/06/13/16/39/3685647.jpg', 'un film qui va vite', 'film/fatsfurious10');
INSERT INTO movies (movieName, moviePicture, movieDesc, slug)  VALUES( 'fast furious 9', 'https://fr.web.img4.acsta.net/pictures/19/06/13/16/39/3685647.jpg', 'un film qui va vite', 'film/fatsfurious9');
INSERT INTO movies (movieName, moviePicture, movieDesc, slug)  VALUES( 'fast furious 8', 'https://fr.web.img4.acsta.net/pictures/19/06/13/16/39/3685647.jpg', 'un film qui va vite', 'film/fatsfurious8');
INSERT INTO movies (movieName, moviePicture, movieDesc, slug)  VALUES( 'fast furious 7', 'https://fr.web.img4.acsta.net/pictures/19/06/13/16/39/3685647.jpg', 'un film qui va vite', 'film/fatsfurious7');
INSERT INTO movies (movieName, moviePicture, movieDesc, slug)  VALUES( 'fast furious 6', 'https://fr.web.img4.acsta.net/pictures/19/06/13/16/39/3685647.jpg', 'un film qui va vite', 'film/fatsfurious6');

# insertion des données dans la table sessions

INSERT INTO sessions (listOfRoom, movieId, date) VALUES( 1, 1, '2021-08-18 17:00:00');
INSERT INTO sessions (listOfRoom, movieId, date)  VALUES( 2, 3, '2021-08-18 17:00:00');
INSERT INTO sessions (listOfRoom, movieId, date)  VALUES( 2, 2, '2021-08-18 19:00:00');
INSERT INTO sessions (listOfRoom, movieId, date)  VALUES( 1, 1, '2021-08-18 19:00:00');
INSERT INTO sessions (listOfRoom, movieId, date)  VALUES( 2, 1, '2021-08-18 19:00:00');
INSERT INTO sessions (listOfRoom, movieId, date)  VALUES( 3, 5, '2021-08-18 17:00:00');
INSERT INTO sessions (listOfRoom, movieId, date)  VALUES( 6, 6, '2021-08-18 17:00:00');
INSERT INTO sessions (listOfRoom, movieId, date)  VALUES( 7, 3, '2021-08-18 17:00:00');
INSERT INTO sessions (listOfRoom, movieId, date)  VALUES( 7, 3, '2021-08-18 19:00:00');
INSERT INTO sessions (listOfRoom, movieId, date)  VALUES( 10, 5, '2021-08-18 17:00:00');
INSERT INTO sessions (listOfRoom, movieId, date)  VALUES( 10, 5, '2021-08-18 19:00:00');

# insertion de données pour la table prices
INSERT INTO prices (priceName, amount)  VALUES( 'plein tarif', '9€20');
INSERT INTO prices (priceName, amount)  VALUES( 'etudiant', '7€60');
INSERT INTO prices (priceName, amount)  VALUES( 'moins de 14 ans', '5€90');

# insertion de données pour la table reservations

INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 54, 3, NULL, 9);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 70, 10, NULL, 1);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 65, 10, NULL, 1);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 76, 6, NULL, 5);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 9, 9, NULL, 2);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 40, 2, NULL, 11);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 39, 8, NULL, 9);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 82, 9, NULL, 3);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 90, 10, NULL, 2);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 47, 8, NULL, 9);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 10, 8, NULL, 10);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 80, 3, NULL, 1);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 2, 9, NULL, 10);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 36, 8, NULL, 3);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 96, 6, NULL, 5);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 9, 10, NULL, 5);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 62, 5, NULL, 9);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 99, 5, NULL, 6);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 85, 2, NULL, 2);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 38, 7, NULL, 4);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 92, 8, NULL, 1);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 3, 1, NULL, 4);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 97, 3, NULL, 8);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 54, 2, NULL, 5);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 87, 2, NULL, 2);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 84, 3, NULL, 3);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 36, 7, NULL, 7);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 76, 9, NULL, 3);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 99, 10, NULL, 1);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 94, 6, NULL, 5);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 88, 6, NULL, 7);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 9, 4, NULL, 1);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 53, 10, NULL, 7);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 50, 9, NULL, 6);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 46, 5, NULL, 1);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 28, 8, NULL, 4);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 85, 4, NULL, 11);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 55, 2, NULL, 5);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 27, 1, NULL, 4);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 62, 3, NULL, 5);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 29, 5, NULL, 10);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 17, 6, NULL, 5);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 99, 6, NULL, 9);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 94, 7, NULL, 4);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 1, 1, NULL, 3);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 18, 3, NULL, 7);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 52, 5, NULL, 10);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 7, 5, NULL, 10);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 27, 1, NULL, 8);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 35, 6, NULL, 5);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 78, 5, NULL, 11);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 26, 5, NULL, 2);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 60, 10, NULL, 3);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 67, 4, NULL, 6);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 83, 9, NULL, 2);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 73, 3, NULL, 11);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 6, 3, NULL, 9);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 94, 3, NULL, 8);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 62, 8, NULL, 4);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 18, 1, NULL, 5);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 51, 4, NULL, 11);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 21, 4, NULL, 8);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 95, 1, NULL, 10);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 29, 9, NULL, 10);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 16, 8, NULL, 3);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 65, 7, NULL, 7);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 78, 7, NULL, 10);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 56, 1, NULL, 2);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 6, 10, NULL, 1);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 12, 2, NULL, 4);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 65, 10, NULL, 11);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 83, 5, NULL, 1);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 45, 4, NULL, 9);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 84, 5, NULL, 6);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 38, 1, NULL, 6);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 53, 7, NULL, 2);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 68, 4, NULL, 3);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 66, 8, NULL, 2);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 58, 7, NULL, 1);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 53, 6, NULL, 11);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 22, 10, NULL, 11);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 61, 3, NULL, 7);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 64, 3, NULL, 2);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 16, 6, NULL, 8);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 27, 4, NULL, 2);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 88, 3, NULL, 9);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 33, 1, NULL, 8);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 88, 3, NULL, 2);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 8, 7, NULL, 5);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 16, 3, NULL, 6);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 41, 1, NULL, 4);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 45, 6, NULL, 7);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 97, 2, NULL, 4);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 19, 3, NULL, 4);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 20, 1, NULL, 9);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 98, 5, NULL, 5);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 88, 10, NULL, 9);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 26, 1, NULL, 3);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 100, 6, NULL, 10);
INSERT INTO reservations (reservationId, customerId, numberPlace, total, sessionId) VALUES( 98, 9, NULL, 1);




DELIMITER $$
CREATE PROCEDURE createAdmin (in userName CHAR(30), in psswd CHAR(30))
BEGIN

# creation des administratreurs et user

CREATE USER userName@'localhost' IDENTIFIED WITH psswd;
 GRANT ALL ON cinema.* TO userName@'localhost';
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE createUser(in userName CHAR(30), in psswd CHAR(30))
BEGIN
CREATE USER userName@'localhost' IDENTIFIED WITH psswd;
GRANT INSERT,DELETE, UPDATE,SELECT ON cinema.movies TO userName@'localhost';
GRANT INSERT,DELETE, UPDATE,SELECT ON cinema.sessions TO userName@'localhost';
END $$
DELIMITER ;

-- Pour réaliser une sauvegarde nous devons utiliser la commande
# mysqldump -u -p databasename >fileName

-- concernant la sécurité de la base de données




