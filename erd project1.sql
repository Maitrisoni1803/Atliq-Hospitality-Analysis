CREATE TABLE `Fact_Booking` (
  `booking_id` varchar(20),
  `property_id` int,
  `booking_date` date,
  `check_in_date` date,
  `checkout_date` date,
  `no_guests` int,
  `room_category` varchar(5),
  `booking_platform` varchar(20),
  `ratings_given` int,
  `booking_status` varchar(20),
  `revenue_generate` int,
  `revenue_realized` int
);

CREATE TABLE `dim_date` (
  `Date` date,
  `mmm_yy` varchar(10),
  `week_no` varchar(5),
  `day_type` varchar(10)
);

CREATE TABLE `dim_hotels` (
  `property_id` int,
  `property_name` varchar(20),
  `category` varchar(20),
  `city` varchar(20)
);

CREATE TABLE `dim_rooms` (
  `room_id` varchar(10),
  `room_class` varchar(20)
);

CREATE TABLE `fact_aggregated_bookings` (
  `property_id` int,
  `check_in_date` date,
  `room_category` varchar(5),
  `successful_bookings` int,
  `capacity` int
);

ALTER TABLE `Fact_Booking` ADD FOREIGN KEY (`property_id`) REFERENCES `dim_hotels` (`property_id`);

ALTER TABLE `fact_aggregated_bookings` ADD FOREIGN KEY (`property_id`) REFERENCES `Fact_Booking` (`property_id`);

ALTER TABLE `fact_aggregated_bookings` ADD FOREIGN KEY (`check_in_date`) REFERENCES `Fact_Booking` (`check_in_date`);

ALTER TABLE `Fact_Booking` ADD FOREIGN KEY (`booking_date`) REFERENCES `dim_date` (`Date`);

ALTER TABLE `dim_rooms` ADD FOREIGN KEY (`room_id`) REFERENCES `Fact_Booking` (`room_category`);

ALTER TABLE `fact_aggregated_bookings` ADD FOREIGN KEY (`room_category`) REFERENCES `Fact_Booking` (`room_category`);
