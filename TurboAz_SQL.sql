CREATE DATABASE TurboAz
USE TurboAz

CREATE TABLE Marka(
Id int primary key identity,
Name nvarchar(50) NOT NULL
)

CREATE TABLE Model(
Id int primary key identity,
Name nvarchar(50) NOT NULL,
Marka_Id int references Marka(Id)
)
CREATE TABLE YanacaqNovu(
Id int primary key identity,
Name nvarchar(50) NOT NULL
)

CREATE TABLE OturucuTipi(
Id int primary key identity,
Name nvarchar(50) NOT NULL
)

CREATE TABLE SuretlerQutusu(
Id int primary key identity,
Name nvarchar(50) NOT NULL
)
CREATE TABLE BuraxilisIli(
Id int primary key identity,
Tarix date 
)

CREATE TABLE MuherrikHecmi(
Id int primary key identity,
Olcu int 
)

CREATE TABLE BanNovu(
Id int primary key identity,
Name nvarchar(50) NOT NULL
)
CREATE TABLE OlcuVahidi(
Id int primary key identity,
Name nvarchar(50) NOT NULL
)

CREATE TABLE Yuruyus(
Id int primary key identity,
Mesafe decimal(18,00) NOT NULL,
OlcuVahidi_Id int references OlcuVahidi(Id)
)

CREATE TABLE Reng(
Id int primary key identity,
Name nvarchar(50) NOT NULL
)
CREATE TABLE Valyuta(
Id int primary key identity,
Name nvarchar(50) NOT NULL
)

CREATE TABLE Qiymet(
Id int primary key identity,
Mebleg money NOT NULL,
Valyuta_Id int references Valyuta(Id)
)

CREATE TABLE MuherrikGucu(
Id int primary key identity,
Olcu int 
)

CREATE TABLE Avto_Techizat(
Id int primary key identity,
Name nvarchar(50) NOT NULL
)

CREATE TABLE Techizat(
Id int primary key identity,
Name nvarchar(50) NOT NULL,
AvtoTech_Id int references Avto_Techizat(Id)
)

CREATE TABLE Melumat(
Id int primary key identity,
Name nvarchar(50) NOT NULL
)

CREATE TABLE [User](
Id int primary key identity,
Name nvarchar(50) NOT NULL,
PhoneNumber nvarchar(50),
Email nvarchar(50)
)

CREATE TABLE [Elan] (
Id int primary key identity,
Models_Id int references Model(Id),
BanNovu_Id int references BanNovu(Id),
Yurus_Id int references Yuruyus(Id),
Reng_Id int references Reng(Id),
Qiymet_Id int references Qiymet(Id),
YanacaqNovu_Id int references YanacaqNovu(Id),
Oturucu_Id int references OturucuTipi(Id),
SuretQutu_Id int references SuretlerQutusu(Id),
Buraxilisili_Id int references BuraxilisIli(Id),
MuhHecmi_Id int references MuherrikHecmi(Id),
MuhGucu_Id int references MuherrikGucu(Id),
Techizat_Id int references Techizat(Id),
Melumat_Id int references Melumat(Id),
[User_Id] int references [Userss](Id)
)

-------------------------------------
CREATE VIEW ElanData
AS
SELECT Marka.Name 'Marka adi',Model.Name 'Mode adi',BanNovu.Name 'Ban novu',Reng.Name 'Reng',Yuruyus.Mesafe 'Yuruyus', ov.Name 'Olcu vahidi', BuraxilisIli.Tarix 'Buraxilis ili',MuherrikHecmi.Olcu 'Muherrik hecmi',MuherrikGucu.Olcu 'Muherrik gucu',Qiymet.Mebleg 'Qiymeti',Valyuta.Name 'Valyuta',Userss.Name 'User' FROM Marka
JOIN Model
ON
Model.Marka_Id=Marka.Id
JOIN Elan e
ON
e.Models_Id=Model.Id
JOIN YanacaqNovu
ON
e.YanacaqNovu_Id=YanacaqNovu.Id
JOIN OturucuTipi
ON
e.Oturucu_Id=OturucuTipi.Id
JOIN SuretlerQutusu
ON
e.SuretQutu_Id=SuretlerQutusu.Id
JOIN BuraxilisIli
ON
e.Buraxilisili_Id=BuraxilisIli.Id
JOIN MuherrikHecmi
ON
e.MuhHecmi_Id=MuherrikHecmi.Id
JOIN MuherrikGucu
ON
e.MuhGucu_Id=MuherrikGucu.Id
JOIN BanNovu
ON
e.BanNovu_Id=BanNovu.Id
JOIN Yuruyus
ON
e.Yurus_Id=Yuruyus.Id
JOIN OlcuVahidi ov
ON
ov.Id=Yuruyus.OlcuVahidi_Id
JOIN Reng
ON
e.Reng_Id=Reng.Id
JOIN Qiymet
ON
e.Qiymet_Id=Qiymet.Id
JOIN Valyuta
ON
Qiymet.Valyuta_Id=Valyuta.Id
JOIN Techizat
ON
e.Techizat_Id=Techizat.Id
JOIN Melumat
ON
e.Melumat_Id=Melumat.Id
JOIN Userss
ON
e.User_Id=Userss.Id

SELECT * FROM ElanData