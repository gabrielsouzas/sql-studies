DELIMITER //

CREATE PROCEDURE INSERTSTATION(IN CITYNAME VARCHAR(
21), IN STATENAME VARCHAR(2), IN LATITUDE DECIMAL(
10, 0), IN LONGITUDE DECIMAL(10, 0)) BEGIN INSERT 
	INSERT INTO
	    station (city, state, lat_n, long_w)
	VALUES (
	        cityName,
	        stateName,
	        latitude,
	        longitude
	    );
	END;


//

DELIMITER ;

CALL InsertStation('New City', 'NY', 40, -74);