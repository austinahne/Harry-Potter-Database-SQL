DROP TABLE characters CASCADE CONSTRAINT;
DROP TABLE school CASCADE CONSTRAINT;
DROP TABLE spells CASCADE CONSTRAINT;
DROP TABLE species CASCADE CONSTRAINT;
DROP TABLE faction CASCADE CONSTRAINT;
DROP TABLE wand CASCADE CONSTRAINT;
DROP TABLE casts CASCADE CONSTRAINT;
DROP TABLE type CASCADE CONSTRAINT;
DROP TABLE affiliates CASCADE CONSTRAINT;
DROP TABLE owner CASCADE CONSTRAINT;
DROP TABLE seen_mention CASCADE CONSTRAINT;

CREATE TABLE characters
(cname  VARCHAR2(45) CONSTRAINT characters_cname_pk PRIMARY KEY,
 marital_status VARCHAR2(1),
 Bdate DATE, 
 house varchar2 (15),
 blood_status VARCHAR2(2),
 attends_by VARCHAR2(30),
 species_relations VARCHAR2(30),
 instructs VARCHAR2(15)
);

CREATE TABLE school
(sname  VARCHAR2(45) CONSTRAINT characters_sname_pk PRIMARY KEY,
 location VARCHAR2(30),
 date_founded DATE,
 range VARCHAR(15));

CREATE TABLE Spells  
(incantation  VARCHAR2(45) CONSTRAINT spells_incantation_pk PRIMARY KEY,
 pronunciation VARCHAR2(30),
 feature VARCHAR2(35),
 seen_mention VARCHAR2(15),
 type VARCHAR2(35));

CREATE TABLE species 
(type VARCHAR2(45) CONSTRAINT species_type_pk PRIMARY KEY,
 eye_color VARCHAR2(20),
 skin VARCHAR2(35),
 hair_color VARCHAR2(30));

CREATE TABLE faction
(fname  VARCHAR2(45) CONSTRAINT faction_fame_pk PRIMARY KEY,
 intentions VARCHAR2(50),
 headquarters VARCHAR2(70), 
 founded DATE,
 enemies VARCHAR2(40));

CREATE TABLE wand
(wname  VARCHAR2(45) CONSTRAINT wand_wname_pk PRIMARY KEY,
 wood VARCHAR2(20),
 length NUMBER(4,2), 
 manufacturer VARCHAR2(18),
 flexibility VARCHAR2(25),
 core VARCHAR2(20),
 master_name VARCHAR2(30));

CREATE TABLE casts
(cincantation  VARCHAR2(45),
 ca_name VARCHAR2(30),
 CONSTRAINT casts_cincantion_ca_name_pk PRIMARY KEY(cincantation, ca_name));

CREATE TABLE type
(tincantation VARCHAR2(45),
 ttype varchar (35),
 CONSTRAINT type_tincant_ttype_pk PRIMARY KEY(tincantation, ttype));

CREATE TABLE seen_mention
(sm_incantation VARCHAR2(45),
 sm_seen_mention VARCHAR2(30),
 CONSTRAINT seen_mention_incant_sm_pk PRIMARY KEY(sm_incantation, sm_seen_mention));

CREATE TABLE owner
(char_name VARCHAR2(45),
 wand_name VARCHAR2(45),
 CONSTRAINT owner_cn_wn_pk PRIMARY KEY(char_name, wand_name));

CREATE TABLE affiliates
(char_name VARCHAR2(45),
 fac_name VARCHAR2(45),
 CONSTRAINT affiliates_cn_fn_pk PRIMARY KEY(char_name, fac_name));

ALTER TABLE characters ADD CONSTRAINT charcaters_instructs_fk FOREIGN KEY(cname) 
  REFERENCES characters(cname);

ALTER TABLE casts ADD CONSTRAINT casts_cincantation_fk FOREIGN KEY(cincantation)
  REFERENCES spells(incantation);

ALTER TABLE type ADD CONSTRAINT type_tincantation_fk FOREIGN KEY(tincantation)
  REFERENCES spells(incantation);

ALTER TABLE seen_mention ADD CONSTRAINT sm_sm_incantation_fk FOREIGN KEY(sm_incantation)
  REFERENCES spells(incantation);

ALTER TABLE owner ADD CONSTRAINT owner_char_name_fk FOREIGN KEY(char_name)
  REFERENCES characters(cname);

ALTER TABLE wand ADD CONSTRAINT wand_master_name_fk FOREIGN KEY(master_name)
  REFERENCES characters(cname);

ALTER TABLE owner ADD CONSTRAINT owner_wand_name_fk FOREIGN KEY(wand_name)
  REFERENCES wand(wname);
 
ALTER TABLE affiliates ADD CONSTRAINT aff_char_name_fk FOREIGN KEY(char_name)
  REFERENCES characters(cname);

ALTER TABLE affiliates ADD CONSTRAINT aff_fac_name_fk FOREIGN KEY(fac_name)
  REFERENCES faction(fname);
 
ALTER TABLE characters ADD CONSTRAINT chara_attendby_fk FOREIGN KEY(attends_by)
  REFERENCES school(sname);

ALTER TABLE characters ADD CONSTRAINT chara_spec_relation_fk FOREIGN KEY(species_relations)
  REFERENCES species(type);

INSERT INTO species VALUES('Phoenix', 'Black', 'Scarlet' ,'Golden');
INSERT INTO species VALUES('Owl', 'Black', ' Gray/Brown' , 'Gray/Brown');
INSERT INTO species VALUES('Cat', 'Yellow', 'Beige' , 'Brown/Yellow/Black/Gray');
INSERT INTO species VALUES('Rat', 'Black', 'Gray' , ' Gray');
INSERT INTO species VALUES('Toad', 'Various', 'Various', 'No Hair');
INSERT INTO species VALUES('Inferius', 'Cloudy White', 'Pale-White' , 'Varies');
INSERT INTO species VALUES('Boggart', 'Varies', 'Varies' , 'Varies');
INSERT INTO species VALUES('Flobberworm', 'NULL', 'Brown' , 'No Hair');
INSERT INTO species VALUES('Gnome', 'Purple', 'Brown' , 'Black');
INSERT INTO species VALUES('Bowtruckle', 'Brown', 'Green' , 'NULL');
INSERT INTO species VALUES('Ghoul', 'Green', 'Greyish Green' , 'Bald');
INSERT INTO species VALUES('Pixie', 'Black', 'Electric Blue' , 'NULL');
INSERT INTO species VALUES('Doxy', 'Red-Brown', 'Purple/Brown' , 'Black');
INSERT INTO species VALUES('Hippogriff', 'Orange', 'Stormy Gray/Bronze/Chestnut' , 'Stormy Gray/Bronze/Chestnut');
INSERT INTO species VALUES('Erumpent', 'Black', ' Gray' , 'NULL');
INSERT INTO species VALUES('Erkling', 'Yellow', 'Green-Brown' , 'No Hair');
INSERT INTO species VALUES('Winged horse', 'Black', 'Gray' , 'Gray');
INSERT INTO species VALUES('Dragon', 'Varies by breed', 'Varies by breed' , 'No Hair');
INSERT INTO species VALUES('Acromantula', 'Black', 'NULL' , 'Jet-Black');
INSERT INTO species VALUES('Werewolf', 'Varies', 'Varies' , 'Varies');
INSERT INTO species VALUES('Augurey', 'Blue', 'Greenish-Black' , 'Greenish-Black');
INSERT INTO species VALUES('Chizpurfle', 'Black', 'Black with Green Pincers' , 'No Hair');
INSERT INTO species VALUES('Clabbert', 'Yellow', 'Mottled Green' , 'No Hair');
INSERT INTO species VALUES('Diricawl', 'Black', 'Bluish-Pink' , 'Bluish-Pink');
INSERT INTO species VALUES('Fairy', 'Varies', 'Varies' , 'Varies');
INSERT INTO species VALUES('Grindylow', 'Yellow/White/Green', 'Sickly Green' ,'No Hair');
INSERT INTO species VALUES('Imp', 'Yellow', 'Grey' , 'Bald');
INSERT INTO species VALUES('Jobberknoll', 'Black', 'Speckled Blue' , 'Speckled Blue');
INSERT INTO species VALUES('Mooncalf', 'Blue-Green', 'Pink' , 'Pale Grey');
INSERT INTO species VALUES('Porlock', 'Blue', 'Red-Brown' , 'Red-Brown');
INSERT INTO species VALUES('Puffskein', 'Black', 'Purple' , 'Custard');
INSERT INTO species VALUES('Ramora', 'Black', 'Silver' , 'No Hair');
INSERT INTO species VALUES('Ashwinder', 'Red', 'Pale-Grey' , 'No Hair');
INSERT INTO species VALUES('Billywig', 'Grey', 'Bright Blue' , 'No Hair');
INSERT INTO species VALUES('Bundimun', 'Yellow', 'Green' , 'No Hair');
INSERT INTO species VALUES('Crup', 'Brown', 'White-Brown' , 'White-Brown');
INSERT INTO species VALUES('Dugbog', 'Green', 'Yellow-Green' , 'No hair');
INSERT INTO species VALUES('Fire crab', 'Black', 'Grey' , 'No Hair');
INSERT INTO species VALUES('Fwooper', 'Yellow', 'Orange/Pink/Lime Green' , 'Orange/Pink/Lime Green');
INSERT INTO species VALUES('Hippocampus', 'Varies', 'Blue/Green' , 'No Hair');
INSERT INTO species VALUES('Hodag', 'Red Glowing', 'Gray-Black' , 'Gray-Black');
INSERT INTO species VALUES('Jarvey', 'Black', 'Brown' , 'Brown');
INSERT INTO species VALUES('Knarl', 'Black', 'Spikes' , 'Brown');
INSERT INTO species VALUES('Kneazle', 'Blue', 'Gray-Black' , 'Gray-Black');
INSERT INTO species VALUES('Leprechaun', 'Green/Blue/Brown', 'Green' , 'Red');
INSERT INTO species VALUES('Mackled Malaclaw', 'Black', 'Grey with green spots' , 'No Hair');
INSERT INTO species VALUES('Moke', 'Black', 'Silver-Green', 'None');
INSERT INTO species VALUES('Murtlap', 'Black', 'Pink-Brown' , 'None');
INSERT INTO species VALUES('Niffler', 'Black', 'Black' , 'Black');
INSERT INTO species VALUES('Nogtail', 'Black', 'Gray' , ' No Hair');
INSERT INTO species VALUES('Plimpy', 'Black', 'Yellowish' , 'None');
INSERT INTO species VALUES('Pogrebin', 'Blue/Green/Brown', 'Green-Gray' , 'Bald');
INSERT INTO species VALUES('Red Cap', 'Red', 'Green' , 'No Hair');
INSERT INTO species VALUES('Salamander', 'Black', 'Scaly and Scarlet Red in Colour' , 'No hair');
INSERT INTO species VALUES('Sea serpent', 'Yellow', 'Blue' , 'None');
INSERT INTO species VALUES('Streeler', 'Black', 'Brown' , 'No Hair');
INSERT INTO species VALUES('Centaur', 'Varies', 'Varies' , 'Varies');
INSERT INTO species VALUES('Demiguise', 'Brown/Blue', 'Beige' , 'Silver');
INSERT INTO species VALUES('Golden Snidget', 'Red', 'Golden' , 'Golden');
INSERT INTO species VALUES('Graphorn', 'Yellow', 'Greyish-Purple' , 'None');
INSERT INTO species VALUES('Griffin', 'Yellow', 'Brownish-Yellow' , 'Brownish-Yellow');
INSERT INTO species VALUES('Hidebehind', 'Black', 'Silver' , 'Silver');
INSERT INTO species VALUES('Kappa', 'Black', 'Scaly' , ' None');
INSERT INTO species VALUES('Kelpie', 'White', 'Greenish-Black' , 'Black');
INSERT INTO species VALUES('Merpeople', 'Varies', 'Varies' , 'Varies');
INSERT INTO species VALUES('Occamy', 'Black ', 'Turquoise' , 'Purple');
INSERT INTO species VALUES('Reem', 'Black', 'Golden' , ' Golden');
INSERT INTO species VALUES('Runespoor', 'Green Glowing', 'Orange with White Stripes' , 'No Hair');
INSERT INTO species VALUES('Snallygaster', 'Black', 'Gray' , 'Gray');
INSERT INTO species VALUES('Sphinx ', 'Hazel/Almond-Shaped', 'Brown' , 'Brown');
INSERT INTO species VALUES('Tebo', 'Black', 'Brown' , 'Ashen');
INSERT INTO species VALUES('Thestral', 'White', 'Black' , 'Black');
INSERT INTO species VALUES('Thunderbird', 'Black', 'White' , 'Gold');
INSERT INTO species VALUES('Troll', 'Varies', ' Varies' , 'None');
INSERT INTO species VALUES('Unicorn', 'Black', 'Same as Hair Color' , 'White/Silver/Gold');
INSERT INTO species VALUES('Yeti', 'Black', 'Grey' , 'White');
INSERT INTO species VALUES('Horned Serpent', 'Blue', 'Black' , 'No Hair');
INSERT INTO species VALUES('Manticore', 'Brown', 'Brown' , 'Brown');
INSERT INTO species VALUES('Nundu', 'Black', 'Same as Hair Color' , 'Yellow with Black spots');
INSERT INTO species VALUES('Quintaped', 'Black', 'Red-Black' , 'Red-Brown');
INSERT INTO species VALUES('Wampus cat', 'Yellow', 'Brown' , 'Light Brown and White');
INSERT INTO school VALUES ('Hogwarts', 'Highlands Scotland', '05-MAY-0985', 'United Kingdom');
INSERT INTO school VALUES ('Ilvermorny', 'Mount Greylock USA', '04-JUL-1610', 'North America');
INSERT INTO school VALUES ('Beauxbatons', 'Pyrenees France', '20-SEP-1289', 'France');
INSERT INTO school VALUES ('Castelobruxo', 'Amazon Rainforest Brazil', '18-DEC-1020', 'South America');
INSERT INTO school VALUES ('Durmstrang Institute', 'Scandinavia', '13-AUG-1288', 'Slavic Europe');
INSERT INTO school VALUES ('Koldovstoretz', 'Russia', '02-JAN-1450', 'Russia');
INSERT INTO school VALUES ('Mahoutokoro', 'Minami Iwo Jima Japan', '09-OCT-0450', 'Japanese');
INSERT INTO school VALUES ('Uagadou', 'Mountains of the Moon Uganda', '16-JUL-0967', 'Africa');
INSERT INTO characters values ('Harry Potter', 'M', '31-JUL-1980', 'Gryffindor', 'PB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters values ('Hermione Granger', 'M', '15-JAN-2000', 'Gryffindor', 'MB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters values ('Ron Weasley', 'M', '15-FEB-2000', 'Gryffindor', 'PB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters values ('Luna Lovegood', 'M', '15-MAR-2000', 'Ravenclaw', 'HB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters values ('Neville Longbottom', 'M', '15-APR-2000', 'Gryffindor', 'PB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters values ('Molly Weasley', 'M', '15-MAY-2000', 'Gryffindor', 'PB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters values ('Fred Weasley', 'S', '15-JUN-2000', 'Gryffindor', 'PB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters values ('George Weasley', 'S', '15-JUL-2000', 'Gryffindor', 'PB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters values ('Vincent Crabbe', 'S', '15-AUG-2000', 'Slytherin', 'PB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters values ('Gregory Goyle', 'S', '15-SEP-2000', 'Slytherin', 'HB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters values ('Dobby', 'S', '15-OCT-2000', 'NULL', 'HB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters values ('Winky', 'S', '15-NOV-2000', 'NULL', 'HB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters values ('Tom Riddle', 'S', '15-JAN-1900', 'Slytherin', 'HB', 'Hogwarts', 'Wampus cat', 'Death Eaters');
INSERT INTO characters values ('Bellatrix Lestrange', 'S', '15-FEB-1800', 'Slytherin', 'HB', 'Hogwarts', 'Wampus cat', 'Death Eaters');
INSERT INTO characters values ('Lucius Malfoy', 'D', '15-NOV-1953', 'Slytherin', 'PB', 'Hogwarts', 'Wampus cat', 'Death Eaters');
INSERT INTO characters values ('Draco Malfoy', 'W', '15-OCT-1979', 'Slytherin', 'PB', 'Hogwarts', 'Wampus cat', 'Death Eaters');
INSERT INTO characters values ('Peter Pettigrew', 'S', '01-SEP-1959', 'Gryffindor', 'PB', 'Hogwarts', 'Wampus cat', 'Death Eaters');
INSERT INTO characters values ('Antonin Dolohov', 'W', '15-MAY-1200', 'Slytherin', 'PB', 'Hogwarts', 'Wampus cat', 'Death Eaters');
INSERT INTO characters values ('Narcissa Malfoy', 'S', '15-JUN-1100', 'Slytherin', 'PB', 'Hogwarts', 'Wampus cat', 'Death Eaters');
INSERT INTO characters values ('Albus Dumbledore', 'S', '15-JAN-2011', 'Gryffindor', 'PB', 'Hogwarts', 'Wampus cat', 'OotP');
INSERT INTO characters values ('Alastor Moody', 'M', '15-JUN-2010', 'Gryffindor', 'PB', 'Hogwarts', 'Wampus cat', 'OotP');
INSERT INTO characters values ('Kingsley Shacklebolt', 'W', '15-FEB-2009', 'Gryffindor', 'PB', 'Hogwarts', 'Wampus cat', 'OotP');
INSERT INTO characters values ('Sirius Black', 'D', '15-JUN-2008', 'Gryffindor', 'FB', 'Hogwarts', 'Wampus cat', 'OotP');
INSERT INTO characters values ('Remus Lupin', 'S', '15-JUL-2007', 'Gryffindor', 'FB', 'Hogwarts', 'Wampus cat', 'OotP');
INSERT INTO characters values ('Nymphadora Tonks', 'M', '15-AUG-2006', 'Acqua', 'FB', 'Hogwarts', 'Wampus cat', 'OotP');
INSERT INTO characters values ('Rufus Scrimgeour', 'D', '15-SEP-2005', 'Acqua', 'HB', 'Hogwarts', 'Wampus cat', 'MoM');
INSERT INTO characters values ('Cornelius Fudge', 'W', '15-OCT-2004', 'Acqua', 'HB', 'Hogwarts', 'Wampus cat', 'MoM');
INSERT INTO characters values ('Pius Thicknesse', 'M', '15-DEC-2002', 'Slytherin', 'HB', 'Hogwarts', 'Wampus cat', 'MoM');
INSERT INTO characters values ('Barty Crouch Sr', 'S', '15-MAY-2001', 'Slytherin', 'HB', 'Hogwarts', 'Wampus cat', 'Death Eaters');
INSERT INTO characters values ('Arthur Weasley', 'M', '15-APR-1999', 'Gryffindor', 'HB', 'Hogwarts', 'Wampus cat', 'MoM');
INSERT INTO characters values ('Minerva McGonagall', 'W', '15-MAY-1998', 'Gryffindor', 'HB', 'Hogwarts', 'Wampus cat', 'Teachers');
INSERT INTO characters values ('Severus Snape', 'D', '15-MAY-1997', 'Slytherin', 'HB', 'Hogwarts', 'Wampus cat', 'Teachers');
INSERT INTO characters values ('Filius Flitwick', 'D', '15-MAY-0900', 'Ravenclaw', 'HB', 'Hogwarts', 'Wampus cat', 'Teachers');
INSERT INTO characters values ('Pomona Sprout', 'S', '15-MAY-0800', 'Hufflepuff', 'HB', 'Hogwarts', 'Wampus cat', 'Teachers');
INSERT INTO characters values ('Horace Slughorn', 'S', '15-MAY-0750', 'Slytherin', 'HB', 'Hogwarts', 'Wampus cat', 'Teachers');
INSERT INTO characters values ('Rubeus Hagrid', 'M', '15-MAY-0700', 'Gryffindor', 'HB', 'Hogwarts', 'Wampus cat', 'Teachers');
INSERT INTO characters values ('Sybil Trelawney', 'M', '15-MAY-1000', 'Acqua', 'FB', 'Hogwarts', 'Wampus cat', 'Teachers');
INSERT INTO characters values ('Argus Filch', 'D', '15-MAY-1150', 'Acqua', 'FB', 'Hogwarts', 'Wampus cat', 'Teachers');
INSERT INTO characters values ('Rolanda Hooch', 'D', '15-MAY-1250', 'Acqua', 'FB', 'Hogwarts', 'Wampus cat', 'Teachers');
INSERT INTO characters values ('Alecto Carrow', 'S', '15-MAY-1350', 'Acqua', 'FB', 'Hogwarts', 'Wampus cat', 'Teachers');
INSERT INTO characters values ('Amycus Carrow', 'D', '15-MAY-1450', 'Acqua', 'FB', 'Hogwarts', 'Wampus cat', 'Teachers');
INSERT INTO characters values ('Quirinus Quirrell', 'M', '15-MAY-1550', 'Acqua', 'FB', 'Hogwarts', 'Wampus cat', 'Teachers');
INSERT INTO characters values ('Vernon Dursley', 'M', '15-JAN-1650', 'NULL', 'FB', 'Hogwarts', 'Wampus cat', 'Death Eaters');
INSERT INTO characters values ('Cedric Diggory', 'S', '15-JAN-1750', 'Hufflepuff', 'FB', 'Hogwarts', 'Wampus cat', 'Muggles');
INSERT INTO characters values ('James Potter', 'D', '15-JAN-1850', 'Gryffindor', 'FB', 'Hogwarts', 'Wampus cat', 'Muggles');
INSERT INTO characters values ('Lily Potter', 'W', '15-JAN-1950', 'Gryffindor', 'FB', 'Hogwarts', 'Wampus cat', 'Muggles');
INSERT INTO characters values ('Garrick Ollivander', 'M', '15-JAN-0650', 'Acqua', 'HB', 'Hogwarts', 'Wampus cat', 'Muggles');
INSERT INTO characters VALUES('Sir Cadogans', 'M', '30-JUL-1980', 'Gryffindor', 'PB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters VALUES('Celestina Warbeck', 'M', '29-JUL-1980', 'Gryffindor', 'PB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters VALUES('Dolores Umbridge', 'M', '28-JUL-1980', 'Gryffindor', 'PB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters VALUES('Gilderoy Lockhart', 'M', '25-JUL-1980', 'Gryffindor', 'PB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters VALUES('Charles Weasley', 'M', '14-JUL-1980', 'Gryffindor', 'PB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters VALUES('Viktor Krum', 'M', '10-JUL-1980', 'Gryffindor', 'PB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters VALUES('Ginny Weasley', 'M', '09-JUL-1980', 'Gryffindor', 'PB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters VALUES('Barty Crouch Sr.', 'M', '07-JUL-1980', 'Gryffindor', 'PB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters VALUES('Lord Voldemort', 'M', '06-JUL-1980', 'Gryffindor', 'PB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters VALUES('Petunia Dursley', 'M', '05-JUL-1980', 'Gryffindor', 'PB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters VALUES('Dudley Dursley', 'M', '04-JUL-1980', 'Gryffindor', 'PB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters VALUES('Marjorie Dursley', 'M', '03-JUL-1980', 'Gryffindor', 'PB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO characters VALUES('Frank Bryce', 'M', '02-JUL-1980', 'Gryffindor', 'PB', 'Hogwarts', 'Wampus cat', 'Main');
INSERT INTO Spells values ('Aberto','ah-bare-toh','Open Door','NULL','Charm');
INSERT INTO Spells values ('Accio','As-see-oh','Brings an object','1994','Charm');
INSERT INTO Spells values ('Age line','NULL','Creates age min or max','By Dumbledore','Charm');
INSERT INTO Spells values ('Aguamenti','Ah-gwah-men-tee','Produces water','1994','Conjuration');
INSERT INTO Spells values ('Alerte Ascendare','a-LAR-tay a-SEN-der-ay','Lifts object','1992','Charm');
INSERT INTO Spells values ('Alohomora','ah-LOH-ho-MOR-ah','Unlocks objects','1991','Charm');
INSERT INTO Spells values ('Anapneo','ah-NAP-nee-oh','Clears airway','1996','Healing');
INSERT INTO Spells values ('Anteoculatia','an-tee-oh-kyoo-LAY-chee-ah','Grows antlers','1996','Hex');
INSERT INTO Spells values ('Aparecium','AH-par-EE-see-um','Reveals secret messages','1993','Charm');
INSERT INTO Spells values ('Appare Vestigium','ah-PAR-ay ves-TEE-jee-um','Reveals marks/ footprints','By Scamander','Charm');
INSERT INTO Spells values ('Arania Exumai','ah-RAHN-ee-a EKS-su-may','Drives away spiders','By Harry','Spell');
INSERT INTO Spells values ('Arresto Momentum','ah-REST-oh mo-MEN-tum','Decreases an objects velocity','1711','Charm');
INSERT INTO Spells values ('Ascendio','ah-SEN-dee-oh','Lifts the caster','1995','Charm');
INSERT INTO Spells values ('Avada Kedavra','ah-VAH-dah keh-DAV-rah','Kills','1991','Curse');
INSERT INTO Spells values ('Avifors','AH-vi-fors','Transforms creature to bird','Video Games','Transfiguration');
INSERT INTO Spells values ('Avis','AH-viss','Conjures a flock of birds','1994','Conjuration');
INSERT INTO Spells values ('Baubillious','baw-BILL-ee-us','damaging nature','In Charms class','Charm');
INSERT INTO Spells values ('Bombarda','bom-BAR-dah','Provokes a small explosion','1994','Charm');
INSERT INTO Spells values ('Bombarda Maxima','BOM-bar-dah MAX-ih-mah','Creates a large explosion','1995','Charm');
INSERT INTO Spells values ('Brackium Emendo','BRA-key-um ee-MEN-doh','Heals broken bones','1992','Healing');
INSERT INTO Spells values ('Calvorio','cal-VOR-ee-oh','Removes hair','LEGO HP','Curse');
INSERT INTO Spells values ('Cantis','CAN-tiss','Causes victim to sing','LEGO HP','Jinx');
INSERT INTO Spells values ('Capacious Extremis','ca-PAY-shus ex-TREEM-us','Expands the interior of an object','1992','Charm');
INSERT INTO Spells values ('Carpe Retractum','CAR-pay ruh-TRACK-tum','Pulls caster towards object','1993','Charm');
INSERT INTO Spells values ('Cave Inimicum','CAH-vay uh-NIM-i-kuhm','hides caster from others','1997','Charm');
INSERT INTO Spells values ('Cistem Aperio','SIS-tem uh-PE-ree-o','Opens chests and boxes','By Tom Riddle','Charm');
INSERT INTO Spells values ('Colloportus','cul-loh-POR-tus','Locks doors','1996','Charm');
INSERT INTO Spells values ('Colloshoo','CAWL-low-shoo','Sticks shoes to ground','Potions Class','Hex');
INSERT INTO Spells values ('Colovaria','co-loh-VA-riah','Changes targets color','OWLs','Charm');
INSERT INTO Spells values ('Confringo','kon-FRING-goh','Produces fire explosion','1997','Curse');
INSERT INTO Spells values ('Confundo','con-FUN-doh','Causes confusion','1994','Charm');
INSERT INTO Spells values ('Crinus Muto','NULL','Transfigure hair','1996','Transfiguration');
INSERT INTO Spells values ('Crucio','KROO-see-oh','Inflicts pain','Fourth Book','Curse');
INSERT INTO Spells values ('Defodio','deh-FOH-dee-oh','Digs','1998','Charm');
INSERT INTO Spells values ('Aqua Eructo','A-kwa ee-RUCK-toh','Controls water','1994','Charm');
INSERT INTO Spells values ('Deletrius','deh-LEE-tree-us','Vanishing images','1994','Charm');
INSERT INTO Spells values ('Densaugeo','den-SAW-jee-oh','Grows teeth','1994','Hex');
INSERT INTO Spells values ('Depulso','deh-PUL-soh','Makes targets fly','1993','Counter-Charm');
INSERT INTO Spells values ('Descendo','deh-SEN-doh','Causes object to fall','1997','Charm');
INSERT INTO Spells values ('Deprimo','deh-PREEM-oh','Blast holes','1998','Charm');
INSERT INTO Spells values ('Diffindo','dih-FIN-doh','Cuts objects','1994','Charm');
INSERT INTO Spells values ('Diminuendo','dim-in-YEW-en-DOUGH','Shrinks target','1995','Charm');
INSERT INTO Spells values ('Dissendium','dih-SEN-dee-um','Opens secret passages','1993','Charm');
INSERT INTO Spells values ('Draconifors','drah-KOH-nih-fors','Transforms target into dragon','1993','Transfiguration');
INSERT INTO Spells values ('Ducklifors','DUCK-lih-fors','Transforms target into duck','1994','Transfiguration');
INSERT INTO Spells values ('Duro','DYOO-roh','Turns an object into stone','1998','Charm');
INSERT INTO Spells values ('Ebublio','ee-BUB-lee-oh','Inflates and explodes target','1994','Jinx');
INSERT INTO Spells values ('Engorgio','en-GOR-jee-oh','Swells target','1992','Charm');
INSERT INTO Spells values ('Engorgio Skullus','in-GORE-jee-oh SKUH-las','Swells targets skull','In Diagon Alley','Hex');
INSERT INTO Spells values ('Entomorphis','en-TOE-morph-is','Turns target to insectoid','1995','Transfiguration');
INSERT INTO faction VALUES('British Ministry of Magic', 'British Wizarding Government','Whitehall, London, England, Great Britain', '15-JAN-1707' ,'Lord Voldemort, Death Eaters');
INSERT INTO faction VALUES('Death Eaters', 'Purify the Wizarding race by Killing Muggles','Riddle House, Little Hangleton', '17-JUN-1950' ,'Muggles, Blood Traitors, Harry Potter');
INSERT INTO faction VALUES('Order of the Phoenix', 'Protect the Wizarding and Muggle World','12 Grimmauld Place', '07-AUG-1970','Lord Voldemort, Death Eaters');
INSERT INTO faction VALUES('Macusa', 'Govern the magical community of the USA','Appalachian Mountains, Washington', '12-MAR-1693','NULL');
INSERT INTO faction VALUES('French Ministry of Magic', 'Governing Wizarding France','French Ministry of Magic Paris, France', '31-OCT-1790','Gellert Grindelwald');
INSERT INTO faction VALUES('Snatchers', 'Capture Undesirables','Ministry of Magic under Voldemort', '01-SEP-1997','Undesirables');
INSERT INTO faction VALUES('Gringotts Wizarding Bank', 'Only Bank in the Wizarding World','North Side of Diagon Alley London, England', '25-DEC-1474','NULL');
INSERT INTO casts VALUES('Aberto','Harry Potter');
INSERT INTO casts VALUES('Accio','Harry Potter');
INSERT INTO casts VALUES('Age line','Harry Potter');
INSERT INTO casts VALUES('Aguamenti','Harry Potter');
INSERT INTO casts VALUES('Alerte Ascendare','Harry Potter');
INSERT INTO casts VALUES('Alohomora','Harry Potter');
INSERT INTO casts VALUES('Anapneo','Harry Potter');
INSERT INTO casts VALUES('Anteoculatia','Harry Potter');
INSERT INTO casts VALUES('Aparecium','Harry Potter');
INSERT INTO casts VALUES('Appare Vestigium','Harry Potter');
INSERT INTO casts VALUES('Arania Exumai','Harry Potter');
INSERT INTO casts VALUES('Arresto Momentum','Harry Potter');
INSERT INTO casts VALUES('Ascendio','Harry Potter');
INSERT INTO casts VALUES('Avada Kedavra','Harry Potter');
INSERT INTO casts VALUES('Avifors','Harry Potter');
INSERT INTO casts VALUES('Avis','Harry Potter');
INSERT INTO casts VALUES('Baubillious','Harry Potter');
INSERT INTO casts VALUES('Bombarda','Harry Potter');
INSERT INTO casts VALUES('Bombarda Maxima','Harry Potter');
INSERT INTO casts VALUES('Brackium Emendo','Harry Potter');
INSERT INTO casts VALUES('Calvorio','Harry Potter');
INSERT INTO casts VALUES('Cantis','Harry Potter');
INSERT INTO casts VALUES('Capacious Extremis','Harry Potter');
INSERT INTO casts VALUES('Carpe Retractum','Harry Potter');
INSERT INTO casts VALUES('Cave Inimicum','Harry Potter');
INSERT INTO casts VALUES('Cistem Aperio','Harry Potter');
INSERT INTO casts VALUES('Colloportus','Harry Potter');
INSERT INTO casts VALUES('Colloshoo','Harry Potter');
INSERT INTO casts VALUES('Colovaria','Harry Potter');
INSERT INTO casts VALUES('Confringo','Harry Potter');
INSERT INTO casts VALUES('Confundo','Harry Potter');
INSERT INTO casts VALUES('Crinus Muto','Harry Potter');
INSERT INTO casts VALUES('Crucio','Harry Potter');
INSERT INTO casts VALUES('Defodio','Harry Potter');
INSERT INTO casts VALUES('Aqua Eructo','Harry Potter');
INSERT INTO casts VALUES('Deletrius','Harry Potter');
INSERT INTO casts VALUES('Densaugeo','Harry Potter');
INSERT INTO casts VALUES('Depulso','Harry Potter');
INSERT INTO casts VALUES('Descendo','Harry Potter');
INSERT INTO casts VALUES('Deprimo','Harry Potter');
INSERT INTO casts VALUES('Diffindo','Harry Potter');
INSERT INTO casts VALUES('Diminuendo','Harry Potter');
INSERT INTO casts VALUES('Dissendium','Harry Potter');
INSERT INTO casts VALUES('Draconifors','Harry Potter');
INSERT INTO casts VALUES('Ducklifors','Harry Potter');
INSERT INTO casts VALUES('Duro','Harry Potter');
INSERT INTO casts VALUES('Ebublio', 'Harry Potter');
INSERT INTO casts VALUES('Engorgio', 'Harry Potter');
INSERT INTO casts VALUES('Engorgio Skullus', 'Harry Potter');
INSERT INTO casts VALUES('Entomorphis', 'Harry Potter');
INSERT INTO type values ('Aberto', 'NULL');
INSERT INTO type values ('Accio', 'NULL');
INSERT INTO type values ('Age line', 'NULL');
INSERT INTO type values ('Aguamenti', 'Charm');
INSERT INTO type values ('Alerte Ascendare', 'NULL');
INSERT INTO type values ('Alohomora', 'NULL');
INSERT INTO type values ('Anapneo', 'NULL');
INSERT INTO type values ('Anteoculatia','NULL');
INSERT INTO type values ('Aparecium','NULL');
INSERT INTO type values ('Appare Vestigium','NULL');
INSERT INTO type values ('Arania Exumai','NULL');
INSERT INTO type values ('Arresto Momentum','NULL');
INSERT INTO type values ('Ascendio','NULL');
INSERT INTO type values ('Avada Kedavra','NULL');
INSERT INTO type values ('Avifors','NULL');
INSERT INTO type values ('Avis','NULL');
INSERT INTO type values ('Baubillious','NULL');
INSERT INTO type values ('Bombarda','NULL');
INSERT INTO type values ('Bombarda Maxima','NULL');
INSERT INTO type values ('Brackium Emendo','Charm');
INSERT INTO type values ('Calvorio','NULL');
INSERT INTO type values ('Cantis','NULL');
INSERT INTO type values ('Capacious Extremis','NULL');
INSERT INTO type values ('Carpe Retractum','NULL');
INSERT INTO type values ('Cave Inimicum','NULL');
INSERT INTO type values ('Cistem Aperio','NULL');
INSERT INTO type values ('Colloportus','NULL');
INSERT INTO type values ('Colloshoo','NULL');
INSERT INTO type values ('Colovaria','NULL');
INSERT INTO type values ('Confringo','NULL');
INSERT INTO type values ('Confundo','NULL');
INSERT INTO type values ('Crinus Muto','NULL');
INSERT INTO type values ('Crucio','NULL');
INSERT INTO type values ('Defodio','NULL');
INSERT INTO seen_mention values ('Aberto','NULL');
INSERT INTO seen_mention values ('Accio','15-JUN-1995');
INSERT INTO seen_mention values ('Age line','NULL');
INSERT INTO seen_mention values ('Aguamenti','15-JUN-1997');
INSERT INTO seen_mention values ('Alerte Ascendare','NULL');
INSERT INTO seen_mention values ('Alohomora','15-JUN-1993');
INSERT INTO seen_mention values ('Anapneo','NULL');
INSERT INTO seen_mention values ('Anteoculatia','NULL');
INSERT INTO seen_mention values ('Aparecium','NULL');
INSERT INTO seen_mention values ('Appare Vestigium','NULL');
INSERT INTO seen_mention values ('Arania Exumai','Diary');
INSERT INTO seen_mention values ('Arresto Momentum','15-JUN-1998');
INSERT INTO seen_mention values ('Ascendio','NULL');
INSERT INTO seen_mention values ('Avada Kedavra','By Draco Malfoy');
INSERT INTO seen_mention values ('Avifors','NULL');
INSERT INTO seen_mention values ('Avis','By Granger');
INSERT INTO seen_mention values ('Baubillious','NULL');
INSERT INTO seen_mention values ('Bombarda','NULL');
INSERT INTO seen_mention values ('Bombarda Maxima','NULL');
INSERT INTO seen_mention values ('Brackium Emendo','NULL');
INSERT INTO seen_mention values ('Calvorio','NULL');
INSERT INTO seen_mention values ('Cantis','Hogwarts');
INSERT INTO seen_mention values ('Capacious Extremis','15-JUN-1994');
INSERT INTO seen_mention values ('Carpe Retractum','15-JUN-1994');
INSERT INTO seen_mention values ('Cave Inimicum','15-JUN-1998');
INSERT INTO seen_mention values ('Cistem Aperio','NULL');
INSERT INTO seen_mention values ('Colloportus','NULL');
INSERT INTO seen_mention values ('Colloshoo','Vindictus Viridian');
INSERT INTO seen_mention values ('Colovaria','NULL');
INSERT INTO seen_mention values ('Confringo','By Hermione Granger');
INSERT INTO seen_mention values ('Confundo','15-JUN-1998');
INSERT INTO seen_mention values ('Crinus Muto','NULL');
INSERT INTO seen_mention values ('Crucio','NULL');
INSERT INTO seen_mention values ('Defodio','By Harry Potter');
INSERT INTO seen_mention values ('Aqua Eructo','NULL');
INSERT INTO seen_mention values ('Deletrius','15-JUN-1995');
INSERT INTO seen_mention values ('Descendo','By Crabbe');
INSERT INTO seen_mention values ('Deprimo','NULL');
INSERT INTO seen_mention values ('Diffindo','By Ron Weasley');
INSERT INTO seen_mention values ('Diminuendo','NULL');
INSERT INTO seen_mention values ('Dissendium','15-JUN-1997');
INSERT INTO seen_mention values ('Draconifors','15-JUN-1994');
INSERT INTO seen_mention values ('Ducklifors','15-JUN-1995');
INSERT INTO seen_mention values ('Duro','NULL');
INSERT INTO seen_mention values ('Ebublio','NULL');
INSERT INTO seen_mention values ('Engorgio','15-JUN-1994');
INSERT INTO seen_mention values ('Engorgio Skullus','NULL');
INSERT INTO seen_mention values ('Entomorphis','LEGO World');
INSERT INTO wand VALUES('The Elder Wand', 'Elder', 15.00, 'Death', 'Unknown', 'Thestral Tail Hair', 'Albus Dumbledore');
INSERT INTO wand VALUES('Bellatrix Lestrange Wand', 'Walnut', 12.75, 'Ollivander', 'Unyielding', 'Dragon Heartstring', 'Hermione Granger');
INSERT INTO wand VALUES('Sir Cadogans Wand', 'Blackthorn', 09.00, 'Ollivander', 'Combustible', 'Troll Whisker', 'Ron Weasley');
INSERT INTO wand VALUES('Celestina Warbeck Wand', 'Larch', 10.50, 'Ollivander', 'Flexible', 'Phoenix Feather', 'Ron Weasley');
INSERT INTO wand VALUES('Dolores Umbridge Wand', 'Birch', 08.00, 'Ollivander', 'Unknown', 'Dragon Heartstring', 'Dolores Umbridge');
INSERT INTO wand VALUES('Draco Malfoy Wand', 'Hawthorne', 10.00, 'Ollivander', 'Reasonably Springy', 'Unicorn Hair', 'Harry Potter');
INSERT INTO wand VALUES('Gilderoy Lockhart Wand', 'Cherry', 09.00, 'Ollivander', 'Slightly Bendy', 'Dragon Heartstring', 'Ron Weasley');
INSERT INTO wand VALUES('Harry Potter Wand', 'Holly', 11.00, 'Ollivander', 'Nice and Supple', 'Phoenix Feather', 'Harry Potter');
INSERT INTO wand VALUES('Snatchers Wand', 'Blackthorn', 10.00, 'Ollivander', 'Unknown', 'Unknown', 'Ron Weasley');
INSERT INTO wand VALUES('Hermione Granger Wand', 'Wine', 10.75, 'Ollivander', 'Unknown', 'Dragon Heartstring', 'Hermione Granger');
INSERT INTO wand VALUES('Horace Slughorn Wand', 'Cedar', 10.25, 'Ollivander', 'Fairly Flexible', 'Dragon Heartstring', 'Horace Slughorn');
INSERT INTO wand VALUES('James Potter Wand', 'Mahogany', 11.00, 'Ollivander', 'Pliable', 'Unknown', 'James Potter');
INSERT INTO wand VALUES('Lily Evans Wand', 'Willow', 10.25, 'Ollivander', 'Swishy', 'Unknown', 'Lily Potter');
INSERT INTO wand VALUES('Lucius Malfoy Wand', 'Elm', 18.00, 'Ollivander', 'Unknown', 'Dragon Heartstring', 'Tom Riddle');
INSERT INTO wand VALUES('Minerva McGonagall Wand', 'Fir', 09.50, 'Ollivander', 'Stiff', 'Dragon Heartstring', 'Minerva McGonagall');
INSERT INTO wand VALUES('Neville Longbottom Wand', 'Cherry', 10.00, 'Ollivander', 'Unknown', 'Unicorn Hair', 'Neville Longbottom');
INSERT INTO wand VALUES('Peter Pettigrew Wand', 'Chestnut', 09.25, 'Ollivander', 'Brittle', 'Dragon Heartstring', 'Ron Weasley');
INSERT INTO wand VALUES('Quirinus Quirrell Wand', 'Alder', 09.00, 'Ollivander', 'Bendy', 'Unicorn Hair', 'Quirinus Quirrell');
INSERT INTO wand VALUES('Remus Lupin Wand', 'Cypress', 10.25, 'Ollivander', 'Pliable', 'Unicorn Hair', 'Remus Lupin');
INSERT INTO wand VALUES('Ron Weasley First Wand', 'Ash', 12.00, 'Ollivander', 'Unknown', 'Unicorn Hair', 'Ron Weasley');
INSERT INTO wand VALUES('Ron Weasley Wand', 'Willow', 14.00, 'Ollivander', 'Unknown', 'Unicorn Hair', 'Ron Weasley');
INSERT INTO wand VALUES('Rubeus Hagrid Umbrella', 'Oak', 16.00, 'Ollivander', 'Rather Bendy', 'Unknown', 'Rubeus Hagrid');
INSERT INTO wand VALUES('Tom Riddle Wand', 'Yew', 13.50, 'Ollivander', 'Unknown', 'Phoenix Feather', 'Tom Riddle');
INSERT INTO wand VALUES('Viktor Krum Wand', 'Hornbeam', 10.25, 'Gregorovitch', 'Quite Rigid', 'Dragon Heartstring', 'Ron Weasley');
INSERT INTO wand VALUES('Ginny Weasley Wand', 'Yew', 11.50, 'Ollivander', 'Unknown', 'Unknown', 'Ron Weasley');
INSERT INTO wand VALUES('Sybil Trelawney Wand', 'Hazel', 09.50, 'Ollivander', 'Very Flexible', 'Unicorn Hair', 'Sybil Trelawney');
INSERT INTO owner VALUES('Albus Dumbledore','The Elder Wand');
INSERT INTO owner VALUES('Hermione Granger','Bellatrix Lestrange Wand');
INSERT INTO owner VALUES('Sir Cadogans','Sir Cadogans Wand');
INSERT INTO owner VALUES('Celestina Warbeck','Celestina Warbeck Wand');
INSERT INTO owner VALUES('Dolores Umbridge','Dolores Umbridge Wand');
INSERT INTO owner VALUES('Harry Potter','Draco Malfoy Wand');
INSERT INTO owner VALUES('Gilderoy Lockhart','Gilderoy Lockhart Wand');
INSERT INTO owner VALUES('Harry Potter','Harry Potter Wand');
INSERT INTO owner VALUES('Ron Weasley','Snatchers Wand');
INSERT INTO owner VALUES('Hermione Granger','Hermione Granger Wand');
INSERT INTO owner VALUES('Horace Slughorn','Horace Slughorn Wand');
INSERT INTO owner VALUES('James Potter','James Potter Wand');
INSERT INTO owner VALUES('Lily Potter','Lily Evans Wand');
INSERT INTO owner VALUES('Minerva McGonagall','Minerva McGonagall Wand');
INSERT INTO owner VALUES('Neville Longbottom','Neville Longbottom Wand');
INSERT INTO owner VALUES('Ron Weasley','Peter Pettigrew Wand');
INSERT INTO owner VALUES('Quirinus Quirrell','Quirinus Quirrell Wand');
INSERT INTO owner VALUES('Remus Lupin','Remus Lupin Wand');
INSERT INTO owner VALUES('Charles Weasley','Ron Weasley First Wand');
INSERT INTO owner VALUES('Ron Weasley','Ron Weasley Wand');
INSERT INTO owner VALUES('Rubeus Hagrid','Rubeus Hagrid Umbrella');
INSERT INTO owner VALUES('Tom Riddle','Tom Riddle Wand');
INSERT INTO owner VALUES('Viktor Krum','Viktor Krum Wand');
INSERT INTO owner VALUES('Ginny Weasley','Ginny Weasley Wand');
INSERT INTO owner VALUES('Sybil Trelawney','Sybil Trelawney Wand');
INSERT INTO affiliates VALUES('Albus Dumbledore', 'Order of the Phoenix');
INSERT INTO affiliates VALUES('Alastor Moody', 'Order of the Phoenix');
INSERT INTO affiliates VALUES('Kingsley Shacklebolt', 'Order of the Phoenix');
INSERT INTO affiliates VALUES('Sirius Black', 'Order of the Phoenix');
INSERT INTO affiliates VALUES('Remus Lupin', 'Order of the Phoenix');
INSERT INTO affiliates VALUES('Nymphadora Tonks', 'Order of the Phoenix');
INSERT INTO affiliates VALUES('Rufus Scrimgeour', 'British Ministry of Magic');
INSERT INTO affiliates VALUES('Cornelius Fudge',  'British Ministry of Magic');
INSERT INTO affiliates VALUES('Dolores Umbridge', 'British Ministry of Magic');
INSERT INTO affiliates VALUES('Pius Thicknesse',  'British Ministry of Magic');
INSERT INTO affiliates VALUES('Barty Crouch Sr.', 'Macusa');
INSERT INTO affiliates VALUES('Arthur Weasley',   'British Ministry of Magic');
INSERT INTO affiliates VALUES('Lord Voldemort', 'Macusa');
INSERT INTO affiliates VALUES('Bellatrix Lestrange', 'Death Eaters');
INSERT INTO affiliates VALUES('Lucius Malfoy', 'Death Eaters');
INSERT INTO affiliates VALUES('Draco Malfoy', 'Death Eaters');
INSERT INTO affiliates VALUES('Peter Pettigrew', 'Death Eaters');
INSERT INTO affiliates VALUES('Antonin Dolohov', 'Death Eaters');
INSERT INTO affiliates VALUES('Narcissa Malfoy', 'Death Eaters');
INSERT INTO affiliates VALUES('Vernon Dursley', 'Order of the Phoenix');
INSERT INTO affiliates VALUES('Petunia Dursley', 'Macusa');
INSERT INTO affiliates VALUES('Dudley Dursley', 'Macusa');
INSERT INTO affiliates VALUES('Marjorie Dursley', 'Macusa');
INSERT INTO affiliates VALUES('Frank Bryce', 'Macusa');