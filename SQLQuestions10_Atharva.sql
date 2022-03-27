
Queries:-

1.
select sum(total) Sales
from invoice

2. 
select C.COUNTRY Country,sum(total) SALES
from invoice i
join customer c on i.CustomerId=c.CustomerId
group by C.COUNTRY
order by 2 desc

3. 
select C.COUNTRY Country, C.STATE State, c.city City, sum(total) SALES
from invoice i
join customer c on i.CustomerId=c.CustomerId
group by C.COUNTRY, C.STATE, c.city
order by 2 desc

4. 
select c.FirstName+' ' +c.LastName, sum(total) SALES
from invoice i
join customer c on i.CustomerId=c.CustomerId
group by c.FirstName+' ' +c.LastName
order by 2 desc

5.
select c.company, sum(total) SALES
from invoice i
right join customer c on i.CustomerId=c.CustomerId
group by c.company
order by 2 desc

6.
select art.[Name],sum(total)
from invoice i
join InvoiceLine il on i.InvoiceId=il.InvoiceId
join track t on t.TrackId=il.TrackId
join album a on a.AlbumId=t.AlbumId
join Artist art on art.ArtistId=a.ArtistId
group by art.[Name]
order by 2 desc

7.
select a.Title,sum(total)
from invoice i join InvoiceLine il on i.InvoiceId=il.InvoiceId
join track t on t.TrackId=il.TrackId join album a on a.AlbumId=t.AlbumId
group by a.Title
order by 2 desc

8. 
select (e.FirstName+' ' +e.lastname) [Employee Name],sum(i.total) [Sales]
from invoice i
join customer c on i.CustomerId=c.CustomerId
join Employee e on e.EmployeeId=c.SupportRepId
group by (e.FirstName+' ' +e.lastname)
order by 2 desc

9.
select m.[name],sum(total)
from invoice i join InvoiceLine il on i.InvoiceId=il.InvoiceId
join track t on t.TrackId=il.TrackId join MediaType m on m.MediaTypeId=t.MediaTypeId
group by m.[name]
order by 2 desc

10.
select g.[name],sum(total)
from invoice i join InvoiceLine il on i.InvoiceId=il.InvoiceId
join track t on t.TrackId=il.TrackId
join Genre g on g.GenreId=t.GenreId
group by g.[name]
order by 2 desc



