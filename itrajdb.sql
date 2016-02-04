CREATE DATABASE itrajdb;

/**geoinformation**/
DROP TABLE IF EXISTS geoTagtb;
/**note: the combination of location and time should be unique*/
CREATE TABLE geoTagtb (
	geoid int NOT NULL IDENTITY(1,1) PRIMARY KEY UNIQUE, 
	usrid VARCHAR(255) FOREIGN KEY REFERENCES usertb(usrid),
	location GEOGRAPHY(POINT,4326),
	time TIMESTAMP WITH TIME ZONE,
);

DROP TABLE IF EXISTS usertb;
/**user information**/
CREATE TABLE usertb (
	usrid VARCHAR(255) UNIQUE NOT NULL,
	firstname VARCHAR(255) NOT NULL,
	lastname VARCHAR(255),
	facebook_usrid BIGINT(64),
	facebook_name VARCHAR(255),
	email VARCHAR(320) NOT NULL UNIQUE,
	password VARCHAR(255),
	dob DATETIME,
	gender VARCHAR(6),
	address VARCHAR(255),
	city VARCHAR(255),
	country VARCHAR(255),
	PRIMARY KEY(usrid)
);

DROP TABLE IF EXISTS friends;
/*table for friends list*/
CREATE TABLE friends (
	usr_id VARCHAR(255) FOREIGN KEY REFERENCES usertb(usrid),
	friend_id VARCHAR(255) FOREIGN KEY REFERENCES usertb(usrid),
	PRIMARY KEY(usr_id,friend_id)
);

/*LATER*/
DROP TABLE IF EXISTS attach_geotag (
	attach_id VARCHAR(255), /*COULD BE usrid+number(increment)*/
	type VARCHAR(255),


)



INSERT INTO global_points(usrid,location,time)
VALUES(100000,ST_GeomFromText('POINT(-71.060316 48.432044)',4326),'January 15 21:00:00 2016 PST');

