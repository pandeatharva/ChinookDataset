1.
select SUM(TOTAL)from Invoice

2.
select SUM(unitprice*quantity) from InvoiceLine

3.
select count(distinct trackid) from InvoiceLine

4.
select c.country Country,SUM(TOTAL) SALES
from invoice i
join customer c on i.CustomerId=c.CustomerId
group by c.Country
order by 2 desc

5.
select c.country Country, c.state State, c.city City, SUM(TOTAL) SALES
from invoice i
join customer c on i.CustomerId=c.CustomerId
group by c.Country, c.state, c.city
order by 2 desc

6.
select c.FirstName+' ' +c.LastName, SUM(TOTAL) SALES
from invoice i
join customer c on i.CustomerId=c.CustomerId
group by c.FirstName+' ' +c.LastName
order by 2 desc

7.
select c.company, SUM(TOTAL) SALES
from invoice i
right join customer c on i.CustomerId=c.CustomerId
group by c.company
order by 2 desc

8.
select art.[Name],SUM(TOTAL)
from invoice i
join InvoiceLine il on i.InvoiceId=il.InvoiceId
join track t on t.TrackId=il.TrackId
join album a on a.AlbumId=t.AlbumId
join Artist art on art.ArtistId=a.ArtistId
group by art.[Name]
order by 2 desc

9.
select a.Title,SUM(TOTAL)
from invoice i
join InvoiceLine il on i.InvoiceId=il.InvoiceId
join track t on t.TrackId=il.TrackId
join album a on a.AlbumId=t.AlbumId
group by a.Title
order by 2 desc

10.
select (e.FirstName+' ' +e.lastname) [Employee Name],SUM(i.total) [Sales]
from invoice i join customer c on i.CustomerId=c.CustomerId
join Employee e on e.EmployeeId=c.SupportRepId
group by (e.FirstName+' ' +e.lastname)
order by 2 desc

11.
select m.[name],SUM(TOTAL)
from invoice i
join InvoiceLine il on i.InvoiceId=il.InvoiceId join track t on t.TrackId=il.TrackId
join MediaType m on m.MediaTypeId=t.MediaTypeId
group by m.[name]
order by 2 desc

12.
select g.[name],SUM(TOTAL)
from invoice i join InvoiceLine il on i.InvoiceId=il.InvoiceId
join track t on t.TrackId=il.TrackId join Genre g on g.GenreId=t.GenreId
group by g.[name]
order by 2 desc

13.
select year(invoicedate) [Year],SUM(TOTAL) [Sales]
from invoice
group by year(invoicedate)
order by 1

14.
select year(invoicedate) [Year],format(invoicedate,'MMMM') [Month],SUM(TOTAL) [Sales]
from invoice
group by year(invoicedate),format(invoicedate,'MMMM')
order by 1

15.
select 
e.FirstName+' '+e.LastName, e.BirthDate,
e.HireDate, datediff(year,e.HireDate,'2013-12-31'),
e.[Address], e.City,
e.[State], e.Country,
e.Title, isnull(m.FirstName+' '+m.LastName, 'NO MANAGER'),
isnull(m.Title, 'NO MANAGER')
from employee e
left join employee m on e.ReportsTo=m.EmployeeId

16.
select datediff(year,e.BirthDate,i.InvoiceDate) [Employee Age],SUM(i.total) [Sales]
from invoice i join customer c on i.CustomerId=c.CustomerId
join Employee e on e.EmployeeId=c.SupportRepId
group by datediff(year,e.BirthDate,i.InvoiceDate)
order by 1 desc

17.
select datediff(year,e.BirthDate,i.InvoiceDate) [Employee Age],SUM(i.total) [Sales]
from invoice i join customer c on i.CustomerId=c.CustomerId
join Employee e on e.EmployeeId=c.SupportRepId
group by datediff(year,e.BirthDate,i.InvoiceDate)
having datediff(year,e.BirthDate,i.InvoiceDate) between 30 and 69
order by 1 desc