Create database blood_bank_management_system;
use blood_bank_management_system;
CREATE TABLE Donors (
    DonorID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    BloodType VARCHAR(5),
    Phone VARCHAR(15),
    Address VARCHAR(25)
);
CREATE TABLE Recipients (
    RecipientID INT PRIMARY KEY,
    Name VARCHAR(15),
    Age INT,
    BloodType VARCHAR(5),
    Phone VARCHAR(15),
    Address VARCHAR(25)
);
CREATE TABLE Donations (
    DonationID INT PRIMARY KEY,
    DonorID INT,
    RecipientID INT,
    DonationDate DATE,
    ExpiryDate DATE,
    Quantity_ml INT,
    FOREIGN KEY (DonorID) REFERENCES Donors(DonorID),
    FOREIGN KEY (RecipientID) REFERENCES Recipients(RecipientID)
);
CREATE TABLE BloodTypes (
    BloodTypeID INT PRIMARY KEY,
    BloodType VARCHAR(5) UNIQUE
);
CREATE TABLE BloodInventory (
    BloodID INT PRIMARY KEY,
    BloodType VARCHAR(5),
    Quantity_ml INT,
    ExpiryDate DATE,
    FOREIGN KEY (BloodType) REFERENCES BloodTypes(BloodType)
);
CREATE TABLE Transfusions (
    TransfusionID INT PRIMARY KEY,
    RecipientID INT,
    DonationID INT,
    TransfusionDate DATE,
    FOREIGN KEY (RecipientID) REFERENCES Recipients(RecipientID),
    FOREIGN KEY (DonationID) REFERENCES Donations(DonationID)
);
CREATE TABLE BloodTests (
    TestID INT PRIMARY KEY,
    DonationID INT,
    TestType VARCHAR(100),
    Result VARCHAR(100),
    TestDate DATE,
    FOREIGN KEY (DonationID) REFERENCES Donations(DonationID)
);
CREATE TABLE DonorMedicalHistory (
    HistoryID INT PRIMARY KEY,
    DonorID INT,
    MedicalCondition VARCHAR(80),
    DiagnosisDate DATE,
    FOREIGN KEY (DonorID) REFERENCES Donors(DonorID)
);
CREATE TABLE RecipientMedicalHistory (
    HistoryID INT PRIMARY KEY,
    RecipientID INT,
    MedicalCondition VARCHAR(200),
    DiagnosisDate DATE,
    FOREIGN KEY (RecipientID) REFERENCES Recipients(RecipientID)
);
CREATE TABLE BloodBanks (
    BankID INT PRIMARY KEY,
    Name VARCHAR(25),
    Location VARCHAR(50),
    Phone VARCHAR(15)
);
