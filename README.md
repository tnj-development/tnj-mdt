# tnj-mdt

UPDATE `tnj`.`mdt_data` SET `jobtype` = 'leo' WHERE `jobtype` = 'police'
UPDATE `tnj`.`mdt_incidents` SET `jobtype` = 'leo' WHERE `jobtype` = 'police';
UPDATE `tnj`.`mdt_reports` SET `jobtype` = 'leo' WHERE `jobtype` = 'police';
UPDATE `tnj`.`mdt_logs` SET `jobtype` = 'leo' WHERE `jobtype` = 'police';


-- Update the image path to remove the img/ and .png for weapons
UPDATE `tnj`.`mdt_weaponinfo`
SET image = CONCAT(SUBSTRING(image, 5, LENGTH(image)-8))
WHERE image LIKE 'img/%.png';

