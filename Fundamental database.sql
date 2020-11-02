---Create Database FUNDAMENTALS;

Create Table dbo.Artist
(
ArtistID int identity(1,1) Primary Key,
FirstName nvarchar(25) Not Null,
LastName  nvarchar(25) Not Null,
StageName nvarchar(25),
Brithdate date,
BirthCountry nvarchar(40)
)

Create Table dbo.Genre
(
GenreID tinyint identity(1,1),
[Name] nvarchar(25) Not NULL,
Primary Key(GenreID)
)

Create Table dbo.Album
(
AlbumID int identity(1,1) Primary Key,
ArtistID int Foreign Key references dbo.Artist(ArtistID),
Title nvarchar(25),

)

alter table dbo.Album add ReleaseDate date null;

Create table dbo.Track(
TrackID int identity(1,1) Primary Key,
AlbumID int Foreign Key References dbo.Album(AlbumID),
GenreID tinyint Foreign Key References dbo.Genre(GenreID),
Title nvarchar(50) Not Null,
TrackNumber tinyint NULL default 0 check(TrackNumber between 0 and 24)
)


INSERT INTO dbo.Artist (FirstName, LastName, StageName, Brithdate, BirthCountry)
VALUES ('Usher', 'Raymond IV', 'Usher', '1978-10-14', 'United States'),
	   ('Beyoncé', 'Knowles-Carter', 'Beyoncé', '1981-09-04', 'United States'),
	   ('Avril', 'Lavigne', 'Avril Lavigne', '1981-09-04', 'Canada'),
	   ('Alecia', 'Moore', 'Pink', '1979-09-08', 'United States'),
	   ('Shaffer', 'Smith', 'Ne-Yo', '1979-10-18', 'United States'),
	   ('James', 'Blount', 'James Blunt', '1974-02-22', 'United Kingdom');




INSERT INTO dbo.Album (ArtistID, Title, ReleaseDate)
VALUES (5, 'In My Own words', '2006-02-28'),
	   (5, 'Year of the Gentleman', '2008-09-11'),
	   (2, 'Dangerously in Love', '2003-06-20'),
	   (3, 'The Best Damn Thing', '2007-04-17'),
	   (3, 'Let Go', '2002-06-04'),
	   (4, 'The Truth About Love', '2012-09-17'),
	   (1, '8701', '2001-08-07'),
	   (1, 'Here I Stand', '2008-05-13'),
	   (6, 'Some Kind of Trouble', '2010-11-05'),
	   (6, 'Back to Bedlam', '2004-10-11');

INSERT INTO dbo.Genre ([Name])
VALUES ('R&B'), ('Soul'), ('Rock'), ('Pop'), ('Pop Rock'), ('Folk'),
('Country'), ('Country Pop'), ('Teen Pop');

INSERT INTO dbo.Track (AlbumID, GenreID, Title, TrackNumber)
VALUES (1, 1, 'So Sick', 3),
	   (1, 1, 'It Just Ain''t Right', 5),
	   (1, 1, 'Let Go', 11),
	   (2, 1, 'Mad', 4),
	   (2, 1, 'Miss Independent', 5),
	   (3, 4, 'Speechless', 10),
	   (3, 4, 'Me, Myself and I', 7),
	   (4, 5, 'When You''re Gone', 5),
	   (4, 4, 'Runaway', 3),
	   (5, 3, 'I''m With You', 4),
	   (6, 4, 'Just Give Me a Reason', 4),
	   (6, 4, 'True Love', 5),
	   (6, 4, 'Try', 3),
	   (7, 1, 'U Got It Bad', 5),
	   (7, 4, 'Can U Help Me', 11),
	   (7, 1, 'U Remind Me', 2),
	   (8, 1, 'Moving Mountains', 5),
	   (8, 1, 'Before I Met You', 11),
	   (9, 6, 'Stay the Night', 1),
	   (9, 6, 'So Far Gone', 4),
	   (9, 6, 'No Tears', 5),
	   (9, 6, 'Calling Ou Your Name', 8),
	   (10, 5, 'You''re Beautiful', 2),
	   (10, 4, 'Goodbye My Lover', 4),
	   (NULL, 7, 'I Won'' Give Up', NULL),
	   (NULL, 4, 'Because Of You', NULL),
	   (NULL, 1, 'Bleeding Love', NULL),
	   (NULL, 8, 'The Climb', NULL),
	   (NULL, 9, 'Ordinary Girl', NULL);



Select * From dbo.Album;
Select * From dbo.Artist;
Select * From dbo.Genre;
Select * From Track;