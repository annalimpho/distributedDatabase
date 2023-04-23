CREATE TABLE BloodBank.Hospital (
    HospitalID INT PRIMARY KEY NOT NULL,
    HospitalName VARCHAR(50),
    HospitalLocation VARCHAR(50),
    ContactPerson INT,
    PhoneNumber INT,
    EmailAddress VARCHAR(100),
    BloodBankID INT,
    FOREIGN KEY (BloodBankID) REFERENCES BloodBank(BloodBankID)
);

CREATE TABLE BloodBank.BloodInventory(
    BloodBankID INT,
    BloodType VARCHAR(50),
    bloodQuantity INT,
    HospitalID INT,
    FOREIGN KEY (BloodBankID) REFERENCES BloodBank(BloodBankID),
    FOREIGN KEY (HospitalID) REFERENCES Hospital(HospitalID)
);

CREATE TABLE BloodBank.BloodRequest(
    BloodRequestID INT PRIMARY KEY NOT NULL,
    BloodType VARCHAR(50),
    Quantity INT,
    RequestStatus VARCHAR(50),
    HospitalID INT,
    FOREIGN KEY (HospitalID) REFERENCES Hospital(HospitalID)
);

CREATE TABLE BloodBank.BloodDonor(
    BloodDonorID INT PRIMARY KEY NOT NULL,
    DonorName VARCHAR(50),
    DonorBloodType VARCHAR(50),
    DonorContactDetails INT,
    BloodBankID INT,
    FOREIGN KEY (BloodBankID) REFERENCES BloodBank(BloodBankID)
);

CREATE TABLE BloodBank.BloodBank(
    BloodBankID INT PRIMARY KEY NOT NULL,
    BloodBankName VARCHAR(50),
    BloodBankLocation VARCHAR(50),
    BloodBankPhoneNumber VARCHAR(50),
    EmailAddress VARCHAR(50)
);


INSERT INTO BloodBank.Hospital (HospitalID, HospitalName, HospitalLocation, ContactPerson, PhoneNumber, EmailAddress, BloodBankID)
VALUES
(1, 'Paray Hospital', 'Thaba-Tseka', 55541234, 'info@stmaryhospital.com', 1),
(2, 'Maluti Hospital', 'Berea', 55516678, 'info@mountsinaihospital.com', 2),
(3, 'Mafeteng Hospital', 'Mafeteng', 55542468, 'info@hopkinshospital.com', 3);

INSERT INTO BloodBank.BloodInventory (BloodBankID, BloodType, bloodQuantity, HospitalID)
VALUES
(1, 'A', 100, 1),
(2, 'B', 50, 2),
(3, 'O', 75, 3),
(1, 'AB', 25, 1),
(2, 'A', 10, 2),
(3, 'O', 30, 3);

INSERT INTO BloodBank.BloodRequest (BloodRequestID, BloodType, Quantity, RequestStatus, HospitalID)
VALUES
(1, 'A', 5, 'Pending', 1),
(2, 'B', 3, 'Fulfilled', 2),
(3, 'AB', 2, 'Pending', 3);

INSERT INTO BloodBank.BloodDonor (BloodDonorID, DonorName, DonorBloodType, DonorContactDetails, BloodBankID)
VALUES
(1, 'Makula Anna', 'A', 55531111, 1),
(2, 'Jane Leru', 'B', 55572222, 2),
(3, 'Lerato Johnson', 'O', 55593333, 3);

INSERT INTO BloodBank.BloodBank (BloodBankID, BloodBankName, BloodBankLocation, BloodBankPhoneNumber, EmailAddress)
VALUES
(1, 'Maseru Blood Bank', 'Maseru', '58558888', 'info@nybloodcenter.com'),
(2, 'Maseru Blood Bank', 'Maseru', '58558888', 'info@redcrossblood.org'),
(3, 'Maseru Blood Bank', 'Maseru', '58558888', 'info@hopkinsbloodcenter.org')



/* Tables of paray database */ 

CREATE TABLE hospital(
    HospitalID INT PRIMARY KEY NOT NULL,
    HospitalName VARCHAR(50),
    HospitalAddress VARCHAR(50),
    HospitalPhone INT,
    HospitalEmail VARCHAR(50),
    Location VARCHAR(50)
);

CREATE TABLE BloodReserve(
    BloodID INT PRIMARY KEY NOT NULL,
    GroupQuantity INT,
    ExpiryDate DATE,
    HospitalID INT,
    FOREIGN KEY (HospitalID) REFERENCES hospital(HospitalID)
);

CREATE TABLE Staff(
    EmployeeID INT PRIMARY KEY NOT NULL,
    EmployeeName VARCHAR(50),
    Role VARCHAR(50),
    BloodID INT,
    FOREIGN KEY (BloodID) REFERENCES BloodReserve(BloodID)
);

CREATE TABLE BloodType(
    BloodTypeID INT PRIMARY KEY NOT NULL,
    Description VARCHAR(50),
    BloodID INT,
    FOREIGN KEY (BloodID) REFERENCES BloodReserve(BloodID)
);

CREATE TABLE Patient(
    PatientID INT PRIMARY KEY NOT NULL,
    PatientName VARCHAR(50),
    Gender VARCHAR(50),
    ContactInfo INT,
    DateTransfused DATE,
    QuantityTransfused INT,
    HospitalID INT,
    FOREIGN KEY (HospitalID) REFERENCES hospital(HospitalID)
);

/* Tables of paray database */ 


/* Populate Tables of paray database */ 

INSERT INTO hospital (HospitalID, HospitalName, HospitalAddress, HospitalPhone, HospitalEmail, Location)
VALUES
(1, 'Maluti Hospital', '123 Main St', 55251234, 'info@stmary.com', 'Berea'),
(2, 'Paray Hospital', '456 Oak Ave', 59355678, 'info@cityhospital.com', 'Thaba-Tseka'),
(3, 'Mafeteng Hospital', '789 Elm St', 57859012, 'info@universityhospital.com', 'Mafeteng');

INSERT INTO BloodReserve (BloodID, GroupQuantity, ExpiryDate, HospitalID)
VALUES
(1, 10, '2023-06-30', 1),
(2, 5, '2023-07-31', 2),
(3, 15, '2023-08-31', 3);

INSERT INTO Staff (EmployeeID, EmployeeName, Role, BloodID)
VALUES
(1, 'Johanne Lucia', 'Nurse', 1),
(2, 'Jane Tiko', 'Doctor', 2),
(3, 'Bobi Mark', 'Lab Technician', 3);

INSERT INTO BloodType (BloodTypeID, Description, BloodID)
VALUES
(1, 'A', 1),
(2, 'B', 2),
(3, 'O', 3);

INSERT INTO Patient (PatientID, PatientName, Gender, ContactInfo, DateTransfused, QuantityTransfused, HospitalID)
VALUES
(1, 'Sarah Leeto', 'Female', 55501111, '2023-04-01', 2, 1),
(2, 'Mike Johnson', 'Male', 55562222, '2023-04-15', 1, 2),
(3, 'Emily Tebisa', 'Female', 55513333, '2023-04-20', 3, 3);

/* Populate Tables of paray database */ 

/* Tables of maluti database */ 

CREATE TABLE hospital(
HospitalID INT PRIMARY KEY NOT NULL,
HospitalName VARCHAR(50),
HospitalAddress VARCHAR(50),
HospitalPhone INT,
HospitalEmail VARCHAR(50),
Location VARCHAR(50)
);

CREATE TABLE BloodReserve(
BloodID INT PRIMARY KEY NOT NULL,
GroupQuantity INT,
ExpiryDate DATE,
HospitalID INT,
FOREIGN KEY (HospitalID) REFERENCES hospital(HospitalID)
);

CREATE TABLE Staff(
EmployeeID INT PRIMARY KEY NOT NULL,
EmployeeName VARCHAR(50),
Role VARCHAR(50),
BloodID INT,
FOREIGN KEY (BloodID) REFERENCES BloodReserve(BloodID)
);

CREATE TABLE BloodType(
BloodTypeID INT PRIMARY KEY NOT NULL,
Description VARCHAR(50),
BloodID INT,
FOREIGN KEY (BloodID) REFERENCES BloodReserve(BloodID)
);

CREATE TABLE Patient(
PatientID INT PRIMARY KEY NOT NULL,
PatientName VARCHAR(50),
Gender VARCHAR(50),
ContactInfo INT,
DateTransfused DATE,
QuantityTransfused INT,
HospitalID INT,
FOREIGN KEY (HospitalID) REFERENCES hospital(HospitalID)
);

/* Tables of maluti database */

/* Populate Tables of maluti database */ 

INSERT INTO hospital (HospitalID, HospitalName, HospitalAddress, HospitalPhone, HospitalEmail, Location)
VALUES (1, 'Mafeteng Hospital', '123 Main Street', 55541234, 'maluti@hospital.com', 'Mafeteng'),
       (2, 'Maluti Hospital', '456 Oak Avenue', 55565678, 'mmc@hospital.com', 'Maluti'),
       (3, 'Paray Hospital', '789 Maple Drive', 55579012, 'mch@hospital.com', 'Paray'),
       (4, 'Mafeteng Hospital', '321 Elm Street', 55583456, 'mrh@hospital.com', 'Mafeteng');
       
INSERT INTO BloodReserve (BloodID, GroupQuantity, ExpiryDate, HospitalID)
VALUES (1, 50, '2022-05-31', 1),
       (2, 75, '2022-06-30', 2),
       (3, 100, '2022-07-31', 3),
       (4, 125, '2022-08-31', 4);

INSERT INTO Staff (EmployeeID, EmployeeName, Role, BloodID)
VALUES (1, 'Thabo Smith', 'Nurse', 1),
       (2, 'Jane David', 'Doctor', 2),
       (3, 'Bokang Lieta', 'Lab Technician', 3),
       (4, 'Sara Williams', 'Admin Assistant', 4);

INSERT INTO BloodType (BloodTypeID, Description, BloodID)
VALUES (1, 'A', 1),
       (2, 'B', 2),
       (3, 'AB', 3),
       (4, 'O', 4);

INSERT INTO Patient (PatientID, PatientName, Gender, ContactInfo, DateTransfused, QuantityTransfused, HospitalID)
VALUES (1, 'Tom Jones', 'Male', 55341212, '2022-04-10', 2, 1),
       (2, 'Lineo Smith', 'Female', 59153434, '2022-05-15', 3, 2),
       (3, 'Joseph Borikhoe', 'Male', 58755656,'2022-06-20', 1, 3),
       (4, 'Susan Lekau', 'Female', 53557878, '2022-07-25', 4, 4);

/* Populate Tables of maluti database */ 

/* Tables of mafeteng database */

CREATE TABLE hospital(
HospitalID INT PRIMARY KEY NOT NULL,
HospitalName VARCHAR(50),
HospitalAddress VARCHAR(50),
HospitalPhone INT,
HospitalEmail VARCHAR(50),
Location VARCHAR(50)
);

CREATE TABLE BloodReserve(
BloodID INT PRIMARY KEY NOT NULL,
GroupQuantity VARCHAR(50),
ExpiryDate DATE,
HospitalID INT,
FOREIGN KEY (HospitalID) REFERENCES hospital(HospitalID)
);

CREATE TABLE Staff(
EmployeeID INT PRIMARY KEY NOT NULL,
EmployeeName VARCHAR(50),
Role VARCHAR(50),
BloodID INT,
FOREIGN KEY (BloodID) REFERENCES BloodReserve(BloodID)
);

CREATE TABLE BloodType(
BloodTypeID INT PRIMARY KEY NOT NULL,
Description VARCHAR(50),
BloodID INT,
FOREIGN KEY (BloodID) REFERENCES BloodReserve(BloodID)
);

CREATE TABLE Patient(
PatientID INT PRIMARY KEY NOT NULL,
PatientName VARCHAR(50),
Gender VARCHAR(50),
ContactInfo INT,
DateTransfused DATE,
QuantityTransfused INT,
HospitalID INT,
FOREIGN KEY (HospitalID) REFERENCES hospital(HospitalID)
); 

/* Tables of mafeteng database */

/* Populate Tables of mafeteng database */

INSERT INTO hospital (HospitalID, HospitalName, HospitalAddress, HospitalPhone, HospitalEmail, Location) VALUES
(1, 'Mafeteng Hospital', '123 Main Street', 55451234, 'info@mafehospital.com', 'Mafeteng'),
(2, 'Maluti Hospital', '456 Oak Ave', 59555678, 'info@bereahospital.com', 'Berea'),
(3, 'Paray Hospital', '789 Maple Blvd', 58559012, 'info@teyatehospital.com', 'Thaba-Tseka');

INSERT INTO BloodReserve (BloodID, GroupQuantity, ExpiryDate, HospitalID) VALUES
(1, 'O', '2024-05-01', 1),
(2, 'O', '2024-06-01', 2),
(3, 'A', '2024-07-01', 3);

INSERT INTO Staff (EmployeeID, EmployeeName, Role, BloodID) VALUES
(1, 'Tumelo Seeta', 'Nurse', 1),
(2, 'Katleho Setulo', 'Doctor', 2),
(3, 'Thabo Kausi', 'Technician', 3);

INSERT INTO BloodType (BloodTypeID, Description, BloodID) VALUES
(1, 'Whole Blood', 1),
(2, 'Platelets', 2),
(3, 'Plasma', 3);

INSERT INTO Patient (PatientID, PatientName, Gender, ContactInfo, DateTransfused, QuantityTransfused, HospitalID) VALUES
(1, 'Sello Mali', 'Female', 55524321, '2022-01-01', 2, 1),
(2, 'Tolosi Maili', 'Male', 55528765, '2022-02-01', 1, 2),
(3, 'Jumama Leeli', 'Female', 55522468, '2022-03-01', 3, 3);

/* Populate Tables of mafeteng database */


