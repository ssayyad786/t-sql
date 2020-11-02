/*
Database view is named SELECT statement that's stored in the database and act like table

Vertual table 

diffrence between view and table is that table stores data but view will not. 

Why we use 
   * Securit : supose we have table finace which has all sensitive data and we want to give limited access/diply to others then
   we can create view which will act as vertual table and will show only limited column. 
   * Query Simplicity and reusability
   * Reporting


*/

Create View dbo.vwAllTracks
as
Select Title As Tracks
From dbo.Track
go

Select * From dbo.vwAllTracks
go

Create View dbo.vwTotalSongsPerAlbum
as
Select Artist.StageName As [StageName],Album.Title As [Album],Count(*) As [TotalSongs]
from dbo.Artist
inner join dbo.Album On Artist.ArtistID = Album.ArtistID
right join dbo.Track On Track.AlbumID = Album.AlbumID
Group By Artist.StageName,Album.Title
go



Select * from dbo.vwTotalSongsPerAlbum














