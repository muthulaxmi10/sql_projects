create database cabbooking;
use cabbooking;

-- 1. customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    RegistrationDate DATE
);

-- 2. Drivers Table
CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY,
    Name VARCHAR(100),
    Phone VARCHAR(15),
    LicenseNumber VARCHAR(50),
    JoinDate DATE 
    );
    
    -- 3. Cabs Table
CREATE TABLE Cabs (
    CabID INT PRIMARY KEY,
    VehicleNumber VARCHAR(20),
    CabType VARCHAR(20),  -- Sedan, SUV, etc.
    DriverID INT,
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);


-- 4. Bookings Table
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    CustomerID INT,
    CabID INT,
    BookingDate DATETIME,
    BookingStatus VARCHAR(20),  -- Completed, Cancelled, Ongoing
    PickupLocation VARCHAR(100),
    DropoffLocation VARCHAR(100),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (CabID) REFERENCES Cabs(CabID)
);

-- 5. TripDetails Table
CREATE TABLE TripDetails (
    TripID INT PRIMARY KEY,
    BookingID INT,
    TripStart DATETIME,
    TripEnd DATETIME,
    DistanceInKM FLOAT,
    Fare DECIMAL(10,2),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

-- 6. Feedback Table
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    BookingID INT,
    Rating FLOAT,  -- Rating out of 5
    Comments TEXT,
    CancelReason TEXT,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);


-- Insert 30 Customers
INSERT INTO Customers (CustomerID, Name, Email, Phone, RegistrationDate) VALUES
(1, 'Rajesh Sharma', 'rajesh.sharma@gmail.com', '9876543210', '2024-01-15'),
(2, 'Priya Gupta', 'priya.gupta@yahoo.com', '9876543211', '2024-01-18'),
(3, 'Amit Singh', 'amit.singh@hotmail.com', '9876543212', '2024-01-20'),
(4, 'Sneha Patel', 'sneha.patel@gmail.com', '9876543213', '2024-01-22'),
(5, 'Vikram Reddy', 'vikram.reddy@outlook.com', '9876543214', '2024-01-25'),
(6, 'Kavya Nair', 'kavya.nair@gmail.com', '9876543215', '2024-01-28'),
(7, 'Rohit Mehta', 'rohit.mehta@yahoo.com', '9876543216', '2024-02-01'),
(8, 'Anjali Joshi', 'anjali.joshi@gmail.com', '9876543217', '2024-02-03'),
(9, 'Suresh Kumar', 'suresh.kumar@hotmail.com', '9876543218', '2024-02-05'),
(10, 'Deepika Rao', 'deepika.rao@gmail.com', '9876543219', '2024-02-08'),
(11, 'Arjun Malhotra', 'arjun.malhotra@yahoo.com', '9876543220', '2024-02-10'),
(12, 'Pooja Agarwal', 'pooja.agarwal@gmail.com', '9876543221', '2024-02-12'),
(13, 'Karthik Iyer', 'karthik.iyer@outlook.com', '9876543222', '2024-02-15'),
(14, 'Ritu Bajaj', 'ritu.bajaj@gmail.com', '9876543223', '2024-02-18'),
(15, 'Manoj Tiwari', 'manoj.tiwari@yahoo.com', '9876543224', '2024-02-20'),
(16, 'Shruti Kapoor', 'shruti.kapoor@gmail.com', '9876543225', '2024-02-22'),
(17, 'Naveen Chandra', 'naveen.chandra@hotmail.com', '9876543226', '2024-02-25'),
(18, 'Meera Sood', 'meera.sood@gmail.com', '9876543227', '2024-02-28'),
(19, 'Sachin Jain', 'sachin.jain@yahoo.com', '9876543228', '2024-03-02'),
(20, 'Nisha Verma', 'nisha.verma@gmail.com', '9876543229', '2024-03-05'),
(21, 'Ravi Bansal', 'ravi.bansal@outlook.com', '9876543230', '2024-03-08'),
(22, 'Swati Mishra', 'swati.mishra@gmail.com', '9876543231', '2024-03-10'),
(23, 'Akash Khanna', 'akash.khanna@yahoo.com', '9876543232', '2024-03-12'),
(24, 'Tanvi Shah', 'tanvi.shah@gmail.com', '9876543233', '2024-03-15'),
(25, 'Gaurav Pandey', 'gaurav.pandey@hotmail.com', '9876543234', '2024-03-18'),
(26, 'Isha Sinha', 'isha.sinha@gmail.com', '9876543235', '2024-03-20'),
(27, 'Rahul Saxena', 'rahul.saxena@yahoo.com', '9876543236', '2024-03-22'),
(28, 'Aditi Bhatt', 'aditi.bhatt@gmail.com', '9876543237', '2024-03-25'),
(29, 'Sanjay Dubey', 'sanjay.dubey@outlook.com', '9876543238', '2024-03-28'),
(30, 'Priyanka Roy', 'priyanka.roy@gmail.com', '9876543239', '2024-03-30');

-- Insert 30 Drivers
INSERT INTO Drivers (DriverID, Name, Phone, LicenseNumber, JoinDate) VALUES
(1, 'Mohammed Ali', '9123456780', 'DL01AB123456', '2023-06-01'),
(2, 'Sunil Das', '9123456781', 'DL02BC234567', '2023-06-15'),
(3, 'Ramesh Yadav', '9123456782', 'DL03CD345678', '2023-07-01'),
(4, 'Abdul Rahman', '9123456783', 'DL04DE456789', '2023-07-15'),
(5, 'Santosh Pillai', '9123456784', 'DL05EF567890', '2023-08-01'),
(6, 'Deepak Choudhary', '9123456785', 'DL06FG678901', '2023-08-15'),
(7, 'Vijay Prakash', '9123456786', 'DL07GH789012', '2023-09-01'),
(8, 'Raman Lal', '9123456787', 'DL08HI890123', '2023-09-15'),
(9, 'Ashok Pandey', '9123456788', 'DL09IJ901234', '2023-10-01'),
(10, 'Dinesh Bhardwaj', '9123456789', 'DL10JK012345', '2023-10-15'),
(11, 'Jagdish Prasad', '9123456790', 'DL11KL123456', '2023-11-01'),
(12, 'Mukesh Gupta', '9123456791', 'DL12LM234567', '2023-11-15'),
(13, 'Brijesh Kumar', '9123456792', 'DL13MN345678', '2023-12-01'),
(14, 'Rakesh Thakur', '9123456793', 'DL14NO456789', '2023-12-15'),
(15, 'Naresh Singh', '9123456794', 'DL15OP567890', '2024-01-01'),
(16, 'Mahesh Joshi', '9123456795', 'DL16PQ678901', '2024-01-15'),
(17, 'Umesh Rawat', '9123456796', 'DL17QR789012', '2024-02-01'),
(18, 'Lokesh Agrawal', '9123456797', 'DL18RS890123', '2024-02-15'),
(19, 'Hitesh Goyal', '9123456798', 'DL19ST901234', '2024-03-01'),
(20, 'Girish Tyagi', '9123456799', 'DL20TU012345', '2024-03-15'),
(21, 'Nitesh Shukla', '9123456800', 'DL21UV123456', '2024-04-01'),
(22, 'Rajesh Goel', '9123456801', 'DL22VW234567', '2024-04-15'),
(23, 'Kamlesh Pal', '9123456802', 'DL23WX345678', '2024-05-01'),
(24, 'Jitesh Tomar', '9123456803', 'DL24XY456789', '2024-05-15'),
(25, 'Mahendra Ojha', '9123456804', 'DL25YZ567890', '2024-06-01'),
(26, 'Pankaj Bhatia', '9123456805', 'DL26ZA678901', '2024-06-15'),
(27, 'Subhash Rana', '9123456806', 'DL27AB789012', '2024-07-01'),
(28, 'Bharat Arora', '9123456807', 'DL28BC890123', '2024-07-15'),
(29, 'Krishna Murthy', '9123456808', 'DL29CD901234', '2024-08-01'),
(30, 'Sushil Chawla', '9123456809', 'DL30DE012345', '2024-08-15');

-- Insert 30 Cabs
INSERT INTO Cabs (CabID, VehicleNumber, CabType, DriverID) VALUES
(1, 'DL01AB1234', 'Sedan', 1),
(2, 'DL02BC2345', 'SUV', 2),
(3, 'DL03CD3456', 'Hatchback', 3),
(4, 'DL04DE4567', 'Sedan', 4),
(5, 'DL05EF5678', 'SUV', 5),
(6, 'DL06FG6789', 'Sedan', 6),
(7, 'DL07GH7890', 'Hatchback', 7),
(8, 'DL08HI8901', 'SUV', 8),
(9, 'DL09IJ9012', 'Sedan', 9),
(10, 'DL10JK0123', 'Hatchback', 10),
(11, 'DL11KL1234', 'SUV', 11),
(12, 'DL12LM2345', 'Sedan', 12),
(13, 'DL13MN3456', 'Hatchback', 13),
(14, 'DL14NO4567', 'SUV', 14),
(15, 'DL15OP5678', 'Sedan', 15),
(16, 'DL16PQ6789', 'Hatchback', 16),
(17, 'DL17QR7890', 'SUV', 17),
(18, 'DL18RS8901', 'Sedan', 18),
(19, 'DL19ST9012', 'Hatchback', 19),
(20, 'DL20TU0123', 'SUV', 20),
(21, 'DL21UV1234', 'Sedan', 21),
(22, 'DL22VW2345', 'Hatchback', 22),
(23, 'DL23WX3456', 'SUV', 23),
(24, 'DL24XY4567', 'Sedan', 24),
(25, 'DL25YZ5678', 'Hatchback', 25),
(26, 'DL26ZA6789', 'SUV', 26),
(27, 'DL27AB7890', 'Sedan', 27),
(28, 'DL28BC8901', 'Hatchback', 28),
(29, 'DL29CD9012', 'SUV', 29),
(30, 'DL30DE0123', 'Sedan', 30);

-- Insert 30 Bookings
INSERT INTO Bookings (BookingID, CustomerID, CabID, BookingDate, BookingStatus, PickupLocation, DropoffLocation) VALUES
(1, 1, 1, '2024-04-01 09:00:00', 'Completed', 'Connaught Place, Delhi', 'IGI Airport, Delhi'),
(2, 2, 2, '2024-04-01 10:30:00', 'Completed', 'Andheri Station, Mumbai', 'Bandra Kurla Complex, Mumbai'),
(3, 3, 3, '2024-04-01 11:45:00', 'Completed', 'MG Road, Bangalore', 'Electronic City, Bangalore'),
(4, 4, 4, '2024-04-01 14:15:00', 'Cancelled', 'Park Street, Kolkata', 'Salt Lake, Kolkata'),
(5, 5, 5, '2024-04-01 16:20:00', 'Completed', 'Anna Nagar, Chennai', 'T Nagar, Chennai'),
(6, 6, 6, '2024-04-02 08:30:00', 'Completed', 'Sector 17, Chandigarh', 'PGI, Chandigarh'),
(7, 7, 7, '2024-04-02 12:00:00', 'Completed', 'Lal Chowk, Srinagar', 'Dal Lake, Srinagar'),
(8, 8, 8, '2024-04-02 15:45:00', 'Completed', 'MI Road, Jaipur', 'Jaipur Airport, Jaipur'),
(9, 9, 9, '2024-04-02 18:30:00', 'Completed', 'FC Road, Pune', 'Hinjewadi, Pune'),
(10, 10, 10, '2024-04-03 07:15:00', 'Completed', 'Residency Road, Indore', 'Devi Ahilyabai Airport, Indore'),
(11, 11, 11, '2024-04-03 09:45:00', 'Completed', 'Hazratganj, Lucknow', 'Gomti Nagar, Lucknow'),
(12, 12, 12, '2024-04-03 13:20:00', 'Completed', 'Old City, Hyderabad', 'HITEC City, Hyderabad'),
(13, 13, 13, '2024-04-03 16:00:00', 'Cancelled', 'Marine Drive, Kochi', 'Kakkanad, Kochi'),
(14, 14, 14, '2024-04-04 08:45:00', 'Completed', 'Commercial Street, Bangalore', 'Whitefield, Bangalore'),
(15, 15, 15, '2024-04-04 11:30:00', 'Completed', 'Linking Road, Mumbai', 'Powai, Mumbai'),
(16, 16, 16, '2024-04-04 14:15:00', 'Completed', 'Rajouri Garden, Delhi', 'Gurgaon Cyber City, Gurgaon'),
(17, 17, 17, '2024-04-04 17:45:00', 'Completed', 'Camac Street, Kolkata', 'Howrah Station, Kolkata'),
(18, 18, 18, '2024-04-05 06:30:00', 'Completed', 'Nungambakkam, Chennai', 'Chennai Airport, Chennai'),
(19, 19, 19, '2024-04-05 10:00:00', 'Completed', 'Civil Lines, Nagpur', 'AIIMS Nagpur, Nagpur'),
(20, 20, 20, '2024-04-05 13:15:00', 'Ongoing', 'Patna Junction, Patna', 'Bailey Road, Patna'),
(21, 21, 21, '2024-04-05 15:45:00', 'Completed', 'Paltan Bazaar, Guwahati', 'Guwahati Airport, Guwahati'),
(22, 22, 22, '2024-04-06 08:00:00', 'Completed', 'Mall Road, Shimla', 'Christ Church, Shimla'),
(23, 23, 23, '2024-04-06 11:30:00', 'Completed', 'Clock Tower, Dehradun', 'Mussoorie, Dehradun'),
(24, 24, 24, '2024-04-06 14:20:00', 'Completed', 'Chowrasta, Darjeeling', 'Tiger Hill, Darjeeling'),
(25, 25, 25, '2024-04-06 16:45:00', 'Cancelled', 'Mahatma Gandhi Road, Mysore', 'Mysore Palace, Mysore'),
(26, 26, 26, '2024-04-07 09:15:00', 'Completed', 'Ganeshguri, Guwahati', 'Kamakhya Temple, Guwahati'),
(27, 27, 27, '2024-04-07 12:30:00', 'Completed', 'Boat Club Road, Pune', 'Kothrud, Pune'),
(28, 28, 28, '2024-04-07 15:00:00', 'Completed', 'Sarojini Nagar, Delhi', 'Karol Bagh, Delhi'),
(29, 29, 29, '2024-04-07 17:30:00', 'Completed', 'Begumpet, Hyderabad', 'Secunderabad Station, Hyderabad'),
(30, 30, 30, '2024-04-08 10:45:00', 'Ongoing', 'Express Avenue, Chennai', 'OMR, Chennai');

-- Insert 30 TripDetails (only for completed bookings)
INSERT INTO TripDetails (TripID, BookingID, TripStart, TripEnd, DistanceInKM, Fare) VALUES
(1, 1, '2024-04-01 09:05:00', '2024-04-01 10:20:00', 28.5, 450.00),
(2, 2, '2024-04-01 10:35:00', '2024-04-01 11:15:00', 15.2, 280.00),
(3, 3, '2024-04-01 11:50:00', '2024-04-01 12:45:00', 22.8, 385.00),
(4, 5, '2024-04-01 16:25:00', '2024-04-01 17:10:00', 18.6, 320.00),
(5, 6, '2024-04-02 08:35:00', '2024-04-02 09:05:00', 12.3, 245.00),
(6, 7, '2024-04-02 12:05:00', '2024-04-02 12:35:00', 8.7, 180.00),
(7, 8, '2024-04-02 15:50:00', '2024-04-02 16:25:00', 14.9, 275.00),
(8, 9, '2024-04-02 18:35:00', '2024-04-02 19:30:00', 25.4, 420.00),
(9, 10, '2024-04-03 07:20:00', '2024-04-03 08:15:00', 31.2, 520.00),
(10, 11, '2024-04-03 09:50:00', '2024-04-03 10:25:00', 16.8, 295.00),
(11, 12, '2024-04-03 13:25:00', '2024-04-03 14:20:00', 24.6, 410.00),
(12, 14, '2024-04-04 08:50:00', '2024-04-04 09:55:00', 32.1, 535.00),
(13, 15, '2024-04-04 11:35:00', '2024-04-04 12:25:00', 19.5, 345.00),
(14, 16, '2024-04-04 14:20:00', '2024-04-04 15:30:00', 28.9, 475.00),
(15, 17, '2024-04-04 17:50:00', '2024-04-04 18:20:00', 11.4, 220.00),
(16, 18, '2024-04-05 06:35:00', '2024-04-05 07:25:00', 21.7, 375.00),
(17, 19, '2024-04-05 10:05:00', '2024-04-05 10:40:00', 13.6, 260.00),
(18, 21, '2024-04-05 15:50:00', '2024-04-05 16:35:00', 17.8, 315.00),
(19, 22, '2024-04-06 08:05:00', '2024-04-06 08:25:00', 6.2, 150.00),
(20, 23, '2024-04-06 11:35:00', '2024-04-06 13:15:00', 35.4, 590.00),
(21, 24, '2024-04-06 14:25:00', '2024-04-06 15:10:00', 20.3, 360.00),
(22, 26, '2024-04-07 09:20:00', '2024-04-07 09:50:00', 9.8, 195.00),
(23, 27, '2024-04-07 12:35:00', '2024-04-07 13:05:00', 12.7, 250.00),
(24, 28, '2024-04-07 15:05:00', '2024-04-07 15:30:00', 8.3, 175.00),
(25, 29, '2024-04-07 17:35:00', '2024-04-07 18:05:00', 14.1, 265.00);

-- Insert 30 Feedback records
INSERT INTO Feedback (FeedbackID, BookingID, Rating, Comments, CancelReason) VALUES
(1, 1, 4.5, 'Driver was punctual and polite. Clean car.', NULL),
(2, 2, 5.0, 'Excellent service! Very comfortable ride.', NULL),
(3, 3, 4.2, 'Good driving skills but car could be cleaner.', NULL),
(4, 4, NULL, NULL, 'Emergency came up, had to cancel'),
(5, 5, 4.8, 'Professional driver, smooth ride through traffic.', NULL),
(6, 6, 4.0, 'Average service, driver was friendly.', NULL),
(7, 7, 4.7, 'Beautiful route, driver was knowledgeable about local places.', NULL),
(8, 8, 4.3, 'Good service, reached airport on time.', NULL),
(9, 9, 4.6, 'Driver knew all shortcuts, saved time.', NULL),
(10, 10, 4.1, 'Decent ride, car AC could be better.', NULL),
(11, 11, 4.9, 'Outstanding service! Will book again.', NULL),
(12, 12, 4.4, 'Good navigation skills, comfortable journey.', NULL),
(13, 13, NULL, NULL, 'Flight got cancelled'),
(14, 14, 4.2, 'Traffic was heavy but driver managed well.', NULL),
(15, 15, 4.7, 'Very professional and courteous driver.', NULL),
(16, 16, 4.0, 'Long distance ride was comfortable.', NULL),
(17, 17, 4.5, 'Helped with luggage, very cooperative.', NULL),
(18, 18, 4.8, 'Early morning pickup was perfect, reached on time.', NULL),
(19, 19, 4.3, 'Driver was careful and followed traffic rules.', NULL),
(20, 20, NULL, 'Trip still ongoing', 'Trip in progress - driver on the way'),
(21, 21, 4.6, 'Airport transfer was smooth and timely.', NULL),
(22, 22, 4.4, 'Enjoyed the hill station ride, good driving.', NULL),
(23, 23, 4.9, 'Scenic route to Mussoorie was amazing!', NULL),
(24, 24, 4.7, 'Early morning trip to Tiger Hill was worth it.', NULL),
(25, 25, NULL, NULL, 'Family emergency - had to rush to hospital'),
(26, 26, 4.2, 'Temple visit was peaceful, driver waited patiently.', NULL),
(27, 27, 4.5, 'Local driver knew the area very well.', NULL),
(28, 28, 4.1, 'Short distance trip, quick and efficient.', NULL),
(29, 29, 4.6, 'Station pickup was on time despite heavy traffic.', NULL),
(30, 30, NULL, 'Trip still ongoing', 'Driver reached pickup point - journey started');

-- 1. Customers Who Completed the Most Bookings
SELECT c.Name, COUNT(*) AS TotalCompleted
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
WHERE b.BookingStatus = 'Completed'
GROUP BY c.Name
ORDER BY TotalCompleted DESC;


-- 2. Customers Who Cancelled More Than 30%
SELECT c.Name,
       COUNT(*) AS TotalBookings,
       SUM(CASE WHEN b.BookingStatus = 'Cancelled' THEN 1 ELSE 0 END) AS CanceledBookings,
       ROUND(SUM(CASE WHEN b.BookingStatus = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS CancelPercent
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID
GROUP BY c.Name
HAVING CancelPercent > 30;

-- 3.Busiest Booking Day
SELECT DAYNAME(BookingDate) AS Day, COUNT(*) AS TotalBookings
FROM Bookings
GROUP BY Day
ORDER BY TotalBookings DESC
LIMIT 1;

-- 4. Drivers with Average Rating Below 3 in Last 3 Months
SELECT 
    d.Name, 
    AVG(f.Rating) AS AvgRating
FROM 
    Drivers d
JOIN 
    Cabs c ON d.DriverID = c.DriverID
JOIN 
    Bookings b ON c.CabID = b.CabID
JOIN 
    Feedback f ON f.BookingID = b.BookingID
WHERE 
    f.Rating IS NOT NULL
    AND b.BookingDate >= CURDATE() - INTERVAL 3 MONTH
GROUP BY 
    d.Name
HAVING 
    AvgRating < 3.0;


-- 5. Top 5 Drivers by Longest Trips
SELECT d.Name, MAX(td.DistanceInKM) AS LongestTrip
FROM Drivers d
JOIN Cabs c ON d.DriverID = c.DriverID
JOIN Bookings b ON b.CabID = c.CabID
JOIN TripDetails td ON td.BookingID = b.BookingID
GROUP BY d.Name
ORDER BY LongestTrip DESC
LIMIT 5;

-- 6. Drivers with High Cancellation %
SELECT d.Name,
       COUNT(*) AS TotalTrips,
       SUM(CASE WHEN b.BookingStatus = 'Cancelled' THEN 1 ELSE 0 END) AS CanceledTrips,
       ROUND(SUM(CASE WHEN b.BookingStatus = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS CancelPercent
FROM Drivers d
JOIN Cabs c ON d.DriverID = c.DriverID
JOIN Bookings b ON c.CabID = b.CabID
GROUP BY d.Name
HAVING CancelPercent > 30;

-- 1. Total revenue generated by completed bookings in the last 6 months:
SELECT 
    SUM(t.Fare) AS TotalRevenue
FROM 
    TripDetails t
JOIN 
    Bookings b ON t.BookingID = b.BookingID
WHERE 
    b.BookingDate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
    AND b.BookingStatus = 'Completed';  -- or whatever your actual status column is
    
    
    -- 2. Top 3 most frequently traveled routes:
    SELECT 
    PickupLocation, 
    DropoffLocation, 
    COUNT(*) AS RouteFrequency
FROM 
    Bookings
GROUP BY 
    PickupLocation, DropoffLocation
ORDER BY 
    RouteFrequency DESC
LIMIT 3;

-- 3. Correlation between driver ratings and earnings:

-- adding driverId in TripDetails query
ALTER TABLE TripDetails 
ADD DriverID INT,
ADD FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID);

SET SQL_SAFE_UPDATES = 0;
UPDATE TripDetails 
SET DriverID = (TripID MOD 30) + 1;

SELECT 
    d.DriverID,
    d.Name,
    AVG(f.Rating) AS AvgRating,
    COUNT(t.TripID) AS TotalTrips,
    SUM(t.Fare) AS TotalEarnings
FROM 
    Drivers d
JOIN 
    TripDetails t ON d.DriverID = t.DriverID
JOIN 
    Bookings b ON t.BookingID = b.BookingID
JOIN 
    Feedback f ON b.BookingID = f.BookingID
WHERE 
    b.BookingStatus = 'Completed'
GROUP BY 
    d.DriverID, d.Name
ORDER BY 
    AvgRating DESC;

-- Operational Efficiency & Optimization
-- 1 Average waiting time for different pickup locations:

SELECT 
    b.PickupLocation,
    AVG(TIMESTAMPDIFF(MINUTE, b.BookingDate, t.TripStart)) AS AvgWaitingTimeMinutes
FROM 
    Bookings b
JOIN 
    TripDetails t ON b.BookingID = t.BookingID
WHERE 
    b.BookingStatus = 'Completed'
GROUP BY 
    b.PickupLocation
ORDER BY 
    AvgWaitingTimeMinutes DESC;
    
    -- 2. Common reasons for trip cancellations (from Feedback):
    SELECT  
    f.CancelReason,  
    COUNT(*) AS CancellationCount  
FROM  
    Feedback f  
JOIN  
    Bookings b ON f.BookingID = b.BookingID  
WHERE  
    b.BookingStatus = 'Cancelled'  
    AND f.CancelReason IS NOT NULL  
GROUP BY  
    f.CancelReason  
ORDER BY  
    CancellationCount DESC  
LIMIT 0, 1000;

-- 3. Do short trips contribute significantly to revenue?
SELECT  
    CASE  
        WHEN t.DistanceInKM < 5 THEN 'Short Trip (<5 km)'  
        WHEN t.DistanceInKM BETWEEN 5 AND 15 THEN 'Medium Trip (5-15 km)'  
        ELSE 'Long Trip (>15 km)'  
    END AS TripCategory,  
    COUNT(*) AS TotalTrips,  
    SUM(t.Fare) AS TotalRevenue  
FROM  
    TripDetails t  
JOIN  
    Bookings b ON t.BookingID = b.BookingID  
WHERE  
    b.BookingStatus = 'Completed'  
GROUP BY  
    TripCategory  
LIMIT 0, 1000;

-- 1. Compare Revenue: 'Sedan' vs 'SUV' Cabs

SELECT 
    c.CabType,
    SUM(t.Fare) AS TotalRevenue,
    COUNT(*) AS TotalTrips
FROM 
    TripDetails t
JOIN 
    Bookings b ON t.BookingID = b.BookingID
JOIN 
    Cabs c ON b.CabID = c.CabID
WHERE 
    b.BookingStatus = 'Completed'
GROUP BY 
    c.CabType;

-- 2. Predict Customers Likely to Stop Using the Service
SELECT 
    c.CustomerID,
    c.Name,
    MAX(b.BookingDate) AS LastBookingDate,
    COUNT(b.BookingID) AS TotalBookings
FROM 
    Customers c
JOIN 
    Bookings b ON c.CustomerID = b.CustomerID
GROUP BY 
    c.CustomerID, c.Name
ORDER BY 
    LastBookingDate;
    
    -- 3. Weekend vs Weekday Bookings
    
    SELECT 
    CASE 
        WHEN DAYOFWEEK(BookingDate) IN (1, 7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS BookingDayType,
    COUNT(*) AS TotalBookings,
    SUM(t.Fare) AS TotalRevenue
FROM 
    Bookings b
JOIN 
    TripDetails t ON b.BookingID = t.BookingID
WHERE 
    b.BookingStatus = 'Completed'
GROUP BY 
    BookingDayType;

select * from  Cabs;

-- updating data for grtting this output  Identify drivers who have received an average rating below 3.0 in the past three months. What strategies can be implemented to improve their performance
-- 1. Insert into Drivers
INSERT INTO Drivers (DriverID, Name, Phone, LicenseNumber, JoinDate)
VALUES (31, 'Ravi Kumar', '9876543210', 'DL12345', '2023-06-01');

-- 2 insert into cabs
INSERT INTO Cabs (CabID, VehicleNumber, CabType, DriverID)
VALUES (31, 'MH12AB1234', 'Sedan', 1);

-- 3 insert into customers
INSERT INTO Customers (CustomerID, Name, Email, Phone, RegistrationDate)
VALUES (31, 'Anjali Shah', 'anjali@example.com', '9876501234', '2023-07-15');

-- 4 Insert into Bookings (use a recent date within 3 months, e.g., July 2025)
INSERT INTO Bookings (BookingID, CustomerID, CabID, BookingDate, BookingStatus, PickupLocation, DropoffLocation)
VALUES (31, 31, 31, '2025-07-01 10:00:00', 'Completed', 'Pune', 'Mumbai');

-- 5. Insert into Feedback (Rating below 3.0):

INSERT INTO Feedback (FeedbackID, BookingID, Rating, Comments, CancelReason)
VALUES (31, 31, 2.0, 'Driver was late and rude', NULL);

-- Identify drivers who have received an average rating below 3.0 in the past three months. What strategies can be implemented to improve their performance?


SELECT 
    d.DriverID,
    d.Name AS DriverName,
    AVG(f.Rating) AS AvgRating
FROM 
    Drivers d
JOIN 
    Cabs c ON d.DriverID = c.DriverID
JOIN 
    Bookings b ON c.CabID = b.CabID
JOIN 
    Feedback f ON b.BookingID = f.BookingID
WHERE 
    f.Rating IS NOT NULL
    AND b.BookingDate >= CURDATE() - INTERVAL 3 MONTH
GROUP BY 
    d.DriverID, d.Name
HAVING 
    AvgRating < 3.0;


SELECT * FROM Bookings
WHERE BookingDate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);


SELECT * FROM TripDetails WHERE BookingID = 31;

-- Check if TripDetails has matching BookingID and FareRun:
INSERT INTO TripDetails (TripID, BookingID, TripStart, TripEnd, DistanceInKM, Fare)
VALUES (26, 31, '2025-07-01 10:00:00', '2025-07-01 13:00:00', 150, 1200.00);


-- . Calculate the total revenue generated by completed bookings in the last 6 months.How has the revenue trend changed over time?

SELECT 
    SUM(t.Fare) AS TotalRevenue
FROM 
    TripDetails t
JOIN 
    Bookings b ON t.BookingID = b.BookingID
WHERE 
    b.BookingDate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
    AND LOWER(b.BookingStatus) = 'completed';

select * from  cabs;