{
    "metadata": {
        "kernelspec": {
            "name": "SQL",
            "display_name": "SQL",
            "language": "sql"
        },
        "language_info": {
            "name": "sql",
            "version": ""
        }
    },
    "nbformat_minor": 2,
    "nbformat": 4,
    "cells": [
        {
            "cell_type": "code",
            "source": [
                "\r\n",
                "select sum(total) from Invoice;\r\n",
                "\r\n",
                "\r\n",
                "select sum(unitprice*quantity) from InvoiceLine\r\n",
                "\r\n",
                "\r\n",
                "select count(distinct trackid) from InvoiceLine\r\n",
                "\r\n",
                "\r\n",
                "select c.country Country,sum(total) [Total Sales]\r\n",
                "from invoice i\r\n",
                "inner join customer c on i.CustomerId=c.CustomerId\r\n",
                "group by c.Country\r\n",
                "order by 2 desc\r\n",
                "\r\n",
                "\r\n",
                "select c.country Country, c.state State, c.city City, sum(total) [Total Sales]\r\n",
                "from invoice i\r\n",
                "inner join customer c on i.CustomerId=c.CustomerId\r\n",
                "group by c.Country, c.state, c.city\r\n",
                "order by 2 desc\r\n",
                "\r\n",
                "\r\n",
                "select c.FirstName+' ' + c.LastName, sum(total) [Total Sales]\r\n",
                "from invoice i\r\n",
                "inner join customer c on i.CustomerId = c.CustomerId\r\n",
                "group by c.FirstName + ' ' + c.LastName\r\n",
                "order by 2 desc\r\n",
                "\r\n",
                "\r\n",
                "select c.company, sum(total) [Total Sales]\r\n",
                "from invoice i\r\n",
                "right join customer c on i.CustomerId = c.CustomerId\r\n",
                "group by c.company\r\n",
                "order by 2 desc\r\n",
                "\r\n",
                "\r\n",
                "select art.[Name],sum(total)\r\n",
                "from invoice i\r\n",
                "inner join InvoiceLine il on i.InvoiceId = il.InvoiceId\r\n",
                "inner join track t on t.TrackId = il.TrackId\r\n",
                "inner join album a on a.AlbumId = t.AlbumId\r\n",
                "inner join Artist art on art.ArtistId = a.ArtistId\r\n",
                "group by art.[Name]\r\n",
                "order by 2 desc\r\n",
                "\r\n",
                "\r\n",
                "select a.Title,sum(total)\r\n",
                "from invoice i\r\n",
                "inner join InvoiceLine il on i.InvoiceId = il.InvoiceId\r\n",
                "inner join track t on t.TrackId = il.TrackId\r\n",
                "inner join album a on a.AlbumId = t.AlbumId\r\n",
                "group by a.Title\r\n",
                "order by 2 desc\r\n",
                "\r\n",
                "\r\n",
                "select (e.FirstName + ' ' + e.lastname) [Employee Name], sum(i.total) [Sales]\r\n",
                "from invoice i\r\n",
                "inner join customer c on i.CustomerId = c.CustomerId\r\n",
                "inner join Employee e on e.EmployeeId = c.SupportRepId\r\n",
                "group by (e.FirstName + ' ' + e.lastname)\r\n",
                "order by 2 desc\r\n",
                "\r\n",
                "\r\n",
                "select m.[name],sum(total)\r\n",
                "from invoice i\r\n",
                "inner join InvoiceLine il on i.InvoiceId = il.InvoiceId\r\n",
                "inner join track t on t.TrackId = il.TrackId\r\n",
                "inner join MediaType m on m.MediaTypeId = t.MediaTypeId\r\n",
                "group by m.[name]\r\n",
                "order by 2 desc\r\n",
                "\r\n",
                "\r\n",
                "select g.[name],sum(total)\r\n",
                "from invoice i\r\n",
                "inner join InvoiceLine il on i.InvoiceId = il.InvoiceId\r\n",
                "inner join track t on t.TrackId = il.TrackId\r\n",
                "inner join Genre g on g.GenreId = t.GenreId\r\n",
                "group by g.[name]\r\n",
                "order by 2 desc\r\n",
                "\r\n",
                "\r\n",
                "select year(invoicedate) [Year],sum(total) [Sales]\r\n",
                "from invoice\r\n",
                "group by year(invoicedate)\r\n",
                "order by 1\r\n",
                "\r\n",
                "\r\n",
                "select year(invoicedate) [Year],format(invoicedate,'MMMM') [Month],sum(total) [Sales]\r\n",
                "from invoice\r\n",
                "group by year(invoicedate),format(invoicedate,'MMMM')\r\n",
                "order by 1\r\n",
                "\r\n",
                "\r\n",
                "select\r\n",
                "e.FirstName + ' ' + e.LastName,\r\n",
                "e.BirthDate,\r\n",
                "e.HireDate,\r\n",
                "datediff(year,e.HireDate,'2013-12-31'),\r\n",
                "e.[Address],\r\n",
                "e.City,\r\n",
                "e.[State],\r\n",
                "e.Country,\r\n",
                "e.Title,\r\n",
                "isnull(m.FirstName+' '+m.LastName, 'NO MANAGER'),\r\n",
                "isnull(m.Title, 'NO MANAGER')\r\n",
                "from employee e\r\n",
                "left join employee m on e.ReportsTo = m.EmployeeId\r\n",
                "\r\n",
                "\r\n",
                "select datediff(year,e.BirthDate,i.InvoiceDate) [Employee Age],sum(i.total) [Sales]\r\n",
                "from invoice i\r\n",
                "inner join customer c on i.CustomerId = c.CustomerId\r\n",
                "inner join Employee e on e.EmployeeId = c.SupportRepId\r\n",
                "group by datediff(year,e.BirthDate,i.InvoiceDate)\r\n",
                "order by 1 desc\r\n",
                "\r\n",
                "\r\n",
                "select datediff(year,e.BirthDate,i.InvoiceDate) [Employee Age],sum(i.total) [Sales]\r\n",
                "from invoice i\r\n",
                "inner join customer c on i.CustomerId = c.CustomerId\r\n",
                "inner join Employee e on e.EmployeeId = c.SupportRepId\r\n",
                "group by datediff(year,e.BirthDate,i.InvoiceDate)\r\n",
                "having datediff(year,e.BirthDate,i.InvoiceDate) between 30 and 69\r\n",
                "order by 1 desc"
            ],
            "metadata": {
                "azdata_cell_guid": "ec8edf23-2aed-49fd-86be-76691ee2a6de",
                "tags": []
            },
            "outputs": [
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "(1 row affected)"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "(1 row affected)"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "(1 row affected)"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "(24 rows affected)"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "(53 rows affected)"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "(59 rows affected)"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "(11 rows affected)"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "(165 rows affected)"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "(304 rows affected)"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "(3 rows affected)"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "(5 rows affected)"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "(24 rows affected)"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "(5 rows affected)"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "(60 rows affected)"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "(8 rows affected)"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "(15 rows affected)"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "(15 rows affected)"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "display_data",
                    "data": {
                        "text/html": "Total execution time: 00:00:02.726"
                    },
                    "metadata": {}
                },
                {
                    "output_type": "execute_result",
                    "metadata": {},
                    "execution_count": 16,
                    "data": {
                        "application/vnd.dataresource+json": {
                            "schema": {
                                "fields": [
                                    {
                                        "name": "(No column name)"
                                    }
                                ]
                            },
                            "data": [
                                {
                                    "0": "2328.60"
                                }
                            ]
                        },
                        "text/html": [
                            "<table>",
                            "<tr><th>(No column name)</th></tr>",
                            "<tr><td>2328.60</td></tr>",
                            "</table>"
                        ]
                    }
                },
                {
                    "output_type": "execute_result",
                    "metadata": {},
                    "execution_count": 16,
                    "data": {
                        "application/vnd.dataresource+json": {
                            "schema": {
                                "fields": [
                                    {
                                        "name": "(No column name)"
                                    }
                                ]
                            },
                            "data": [
                                {
                                    "0": "2328.60"
                                }
                            ]
                        },
                        "text/html": [
                            "<table>",
                            "<tr><th>(No column name)</th></tr>",
                            "<tr><td>2328.60</td></tr>",
                            "</table>"
                        ]
                    }
                },
                {
                    "output_type": "execute_result",
                    "metadata": {},
                    "execution_count": 16,
                    "data": {
                        "application/vnd.dataresource+json": {
                            "schema": {
                                "fields": [
                                    {
                                        "name": "(No column name)"
                                    }
                                ]
                            },
                            "data": [
                                {
                                    "0": "1984"
                                }
                            ]
                        },
                        "text/html": [
                            "<table>",
                            "<tr><th>(No column name)</th></tr>",
                            "<tr><td>1984</td></tr>",
                            "</table>"
                        ]
                    }
                },
                {
                    "output_type": "execute_result",
                    "metadata": {},
                    "execution_count": 16,
                    "data": {
                        "application/vnd.dataresource+json": {
                            "schema": {
                                "fields": [
                                    {
                                        "name": "Country"
                                    },
                                    {
                                        "name": "Total Sales"
                                    }
                                ]
                            },
                            "data": [
                                {
                                    "0": "USA",
                                    "1": "523.06"
                                },
                                {
                                    "0": "Canada",
                                    "1": "303.96"
                                },
                                {
                                    "0": "France",
                                    "1": "195.10"
                                },
                                {
                                    "0": "Brazil",
                                    "1": "190.10"
                                },
                                {
                                    "0": "Germany",
                                    "1": "156.48"
                                },
                                {
                                    "0": "United Kingdom",
                                    "1": "112.86"
                                },
                                {
                                    "0": "Czech Republic",
                                    "1": "90.24"
                                },
                                {
                                    "0": "Portugal",
                                    "1": "77.24"
                                },
                                {
                                    "0": "India",
                                    "1": "75.26"
                                },
                                {
                                    "0": "Chile",
                                    "1": "46.62"
                                },
                                {
                                    "0": "Ireland",
                                    "1": "45.62"
                                },
                                {
                                    "0": "Hungary",
                                    "1": "45.62"
                                },
                                {
                                    "0": "Austria",
                                    "1": "42.62"
                                },
                                {
                                    "0": "Finland",
                                    "1": "41.62"
                                },
                                {
                                    "0": "Netherlands",
                                    "1": "40.62"
                                },
                                {
                                    "0": "Norway",
                                    "1": "39.62"
                                },
                                {
                                    "0": "Sweden",
                                    "1": "38.62"
                                },
                                {
                                    "0": "Spain",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Poland",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Italy",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Belgium",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Argentina",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Australia",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Denmark",
                                    "1": "37.62"
                                }
                            ]
                        },
                        "text/html": [
                            "<table>",
                            "<tr><th>Country</th><th>Total Sales</th></tr>",
                            "<tr><td>USA</td><td>523.06</td></tr>",
                            "<tr><td>Canada</td><td>303.96</td></tr>",
                            "<tr><td>France</td><td>195.10</td></tr>",
                            "<tr><td>Brazil</td><td>190.10</td></tr>",
                            "<tr><td>Germany</td><td>156.48</td></tr>",
                            "<tr><td>United Kingdom</td><td>112.86</td></tr>",
                            "<tr><td>Czech Republic</td><td>90.24</td></tr>",
                            "<tr><td>Portugal</td><td>77.24</td></tr>",
                            "<tr><td>India</td><td>75.26</td></tr>",
                            "<tr><td>Chile</td><td>46.62</td></tr>",
                            "<tr><td>Ireland</td><td>45.62</td></tr>",
                            "<tr><td>Hungary</td><td>45.62</td></tr>",
                            "<tr><td>Austria</td><td>42.62</td></tr>",
                            "<tr><td>Finland</td><td>41.62</td></tr>",
                            "<tr><td>Netherlands</td><td>40.62</td></tr>",
                            "<tr><td>Norway</td><td>39.62</td></tr>",
                            "<tr><td>Sweden</td><td>38.62</td></tr>",
                            "<tr><td>Spain</td><td>37.62</td></tr>",
                            "<tr><td>Poland</td><td>37.62</td></tr>",
                            "<tr><td>Italy</td><td>37.62</td></tr>",
                            "<tr><td>Belgium</td><td>37.62</td></tr>",
                            "<tr><td>Argentina</td><td>37.62</td></tr>",
                            "<tr><td>Australia</td><td>37.62</td></tr>",
                            "<tr><td>Denmark</td><td>37.62</td></tr>",
                            "</table>"
                        ]
                    }
                },
                {
                    "output_type": "execute_result",
                    "metadata": {},
                    "execution_count": 16,
                    "data": {
                        "application/vnd.dataresource+json": {
                            "schema": {
                                "fields": [
                                    {
                                        "name": "Country"
                                    },
                                    {
                                        "name": "State"
                                    },
                                    {
                                        "name": "City"
                                    },
                                    {
                                        "name": "Total Sales"
                                    }
                                ]
                            },
                            "data": [
                                {
                                    "0": "USA",
                                    "1": "WI",
                                    "2": "Madison",
                                    "3": "42.62"
                                },
                                {
                                    "0": "USA",
                                    "1": "WA",
                                    "2": "Redmond",
                                    "3": "39.62"
                                },
                                {
                                    "0": "Netherlands",
                                    "1": "VV",
                                    "2": "Amsterdam",
                                    "3": "40.62"
                                },
                                {
                                    "0": "USA",
                                    "1": "UT",
                                    "2": "Salt Lake City",
                                    "3": "43.62"
                                },
                                {
                                    "0": "USA",
                                    "1": "TX",
                                    "2": "Fort Worth",
                                    "3": "47.62"
                                },
                                {
                                    "0": "Brazil",
                                    "1": "SP",
                                    "2": "São José dos Campos",
                                    "3": "39.62"
                                },
                                {
                                    "0": "Brazil",
                                    "1": "SP",
                                    "2": "São Paulo",
                                    "3": "75.24"
                                },
                                {
                                    "0": "Italy",
                                    "1": "RM",
                                    "2": "Rome",
                                    "3": "37.62"
                                },
                                {
                                    "0": "Brazil",
                                    "1": "RJ",
                                    "2": "Rio de Janeiro",
                                    "3": "37.62"
                                },
                                {
                                    "0": "Canada",
                                    "1": "QC",
                                    "2": "Montréal",
                                    "3": "39.62"
                                },
                                {
                                    "0": "Canada",
                                    "1": "ON",
                                    "2": "Ottawa",
                                    "3": "37.62"
                                },
                                {
                                    "0": "Canada",
                                    "1": "ON",
                                    "2": "Toronto",
                                    "3": "37.62"
                                },
                                {
                                    "0": "USA",
                                    "1": "NY",
                                    "2": "New York",
                                    "3": "37.62"
                                },
                                {
                                    "0": "USA",
                                    "1": "NV",
                                    "2": "Reno",
                                    "3": "37.62"
                                },
                                {
                                    "0": "Canada",
                                    "1": "NT",
                                    "2": "Yellowknife",
                                    "3": "37.62"
                                },
                                {
                                    "0": "Australia",
                                    "1": "NSW",
                                    "2": "Sidney",
                                    "3": "37.62"
                                },
                                {
                                    "0": "Canada",
                                    "1": "NS",
                                    "2": "Halifax",
                                    "3": "37.62"
                                },
                                {
                                    "0": "Canada",
                                    "1": "MB",
                                    "2": "Winnipeg",
                                    "3": "37.62"
                                },
                                {
                                    "0": "USA",
                                    "1": "MA",
                                    "2": "Boston",
                                    "3": "37.62"
                                },
                                {
                                    "0": "USA",
                                    "1": "IL",
                                    "2": "Chicago",
                                    "3": "43.62"
                                },
                                {
                                    "0": "USA",
                                    "1": "FL",
                                    "2": "Orlando",
                                    "3": "39.62"
                                },
                                {
                                    "0": "Ireland",
                                    "1": "Dublin",
                                    "2": "Dublin",
                                    "3": "45.62"
                                },
                                {
                                    "0": "Brazil",
                                    "1": "DF",
                                    "2": "Brasília",
                                    "3": "37.62"
                                },
                                {
                                    "0": "USA",
                                    "1": "CA",
                                    "2": "Cupertino",
                                    "3": "38.62"
                                },
                                {
                                    "0": "USA",
                                    "1": "CA",
                                    "2": "Mountain View",
                                    "3": "77.24"
                                },
                                {
                                    "0": "Canada",
                                    "1": "BC",
                                    "2": "Vancouver",
                                    "3": "38.62"
                                },
                                {
                                    "0": "USA",
                                    "1": "AZ",
                                    "2": "Tucson",
                                    "3": "37.62"
                                },
                                {
                                    "0": "Canada",
                                    "1": "AB",
                                    "2": "Edmonton",
                                    "3": "37.62"
                                },
                                {
                                    "0": "Argentina",
                                    "1": "NULL",
                                    "2": "Buenos Aires",
                                    "3": "37.62"
                                },
                                {
                                    "0": "Austria",
                                    "1": "NULL",
                                    "2": "Vienne",
                                    "3": "42.62"
                                },
                                {
                                    "0": "Belgium",
                                    "1": "NULL",
                                    "2": "Brussels",
                                    "3": "37.62"
                                },
                                {
                                    "0": "Chile",
                                    "1": "NULL",
                                    "2": "Santiago",
                                    "3": "46.62"
                                },
                                {
                                    "0": "Czech Republic",
                                    "1": "NULL",
                                    "2": "Prague",
                                    "3": "90.24"
                                },
                                {
                                    "0": "Denmark",
                                    "1": "NULL",
                                    "2": "Copenhagen",
                                    "3": "37.62"
                                },
                                {
                                    "0": "Finland",
                                    "1": "NULL",
                                    "2": "Helsinki",
                                    "3": "41.62"
                                },
                                {
                                    "0": "France",
                                    "1": "NULL",
                                    "2": "Bordeaux",
                                    "3": "39.62"
                                },
                                {
                                    "0": "France",
                                    "1": "NULL",
                                    "2": "Dijon",
                                    "3": "40.62"
                                },
                                {
                                    "0": "France",
                                    "1": "NULL",
                                    "2": "Lyon",
                                    "3": "37.62"
                                },
                                {
                                    "0": "France",
                                    "1": "NULL",
                                    "2": "Paris",
                                    "3": "77.24"
                                },
                                {
                                    "0": "Germany",
                                    "1": "NULL",
                                    "2": "Berlin",
                                    "3": "75.24"
                                },
                                {
                                    "0": "Germany",
                                    "1": "NULL",
                                    "2": "Frankfurt",
                                    "3": "43.62"
                                },
                                {
                                    "0": "Germany",
                                    "1": "NULL",
                                    "2": "Stuttgart",
                                    "3": "37.62"
                                },
                                {
                                    "0": "Hungary",
                                    "1": "NULL",
                                    "2": "Budapest",
                                    "3": "45.62"
                                },
                                {
                                    "0": "India",
                                    "1": "NULL",
                                    "2": "Bangalore",
                                    "3": "36.64"
                                },
                                {
                                    "0": "India",
                                    "1": "NULL",
                                    "2": "Delhi",
                                    "3": "38.62"
                                },
                                {
                                    "0": "Norway",
                                    "1": "NULL",
                                    "2": "Oslo",
                                    "3": "39.62"
                                },
                                {
                                    "0": "Poland",
                                    "1": "NULL",
                                    "2": "Warsaw",
                                    "3": "37.62"
                                },
                                {
                                    "0": "Portugal",
                                    "1": "NULL",
                                    "2": "Lisbon",
                                    "3": "39.62"
                                },
                                {
                                    "0": "Portugal",
                                    "1": "NULL",
                                    "2": "Porto",
                                    "3": "37.62"
                                },
                                {
                                    "0": "Spain",
                                    "1": "NULL",
                                    "2": "Madrid",
                                    "3": "37.62"
                                },
                                {
                                    "0": "Sweden",
                                    "1": "NULL",
                                    "2": "Stockholm",
                                    "3": "38.62"
                                },
                                {
                                    "0": "United Kingdom",
                                    "1": "NULL",
                                    "2": "Edinburgh ",
                                    "3": "37.62"
                                },
                                {
                                    "0": "United Kingdom",
                                    "1": "NULL",
                                    "2": "London",
                                    "3": "75.24"
                                }
                            ]
                        },
                        "text/html": [
                            "<table>",
                            "<tr><th>Country</th><th>State</th><th>City</th><th>Total Sales</th></tr>",
                            "<tr><td>USA</td><td>WI</td><td>Madison</td><td>42.62</td></tr>",
                            "<tr><td>USA</td><td>WA</td><td>Redmond</td><td>39.62</td></tr>",
                            "<tr><td>Netherlands</td><td>VV</td><td>Amsterdam</td><td>40.62</td></tr>",
                            "<tr><td>USA</td><td>UT</td><td>Salt Lake City</td><td>43.62</td></tr>",
                            "<tr><td>USA</td><td>TX</td><td>Fort Worth</td><td>47.62</td></tr>",
                            "<tr><td>Brazil</td><td>SP</td><td>São José dos Campos</td><td>39.62</td></tr>",
                            "<tr><td>Brazil</td><td>SP</td><td>São Paulo</td><td>75.24</td></tr>",
                            "<tr><td>Italy</td><td>RM</td><td>Rome</td><td>37.62</td></tr>",
                            "<tr><td>Brazil</td><td>RJ</td><td>Rio de Janeiro</td><td>37.62</td></tr>",
                            "<tr><td>Canada</td><td>QC</td><td>Montréal</td><td>39.62</td></tr>",
                            "<tr><td>Canada</td><td>ON</td><td>Ottawa</td><td>37.62</td></tr>",
                            "<tr><td>Canada</td><td>ON</td><td>Toronto</td><td>37.62</td></tr>",
                            "<tr><td>USA</td><td>NY</td><td>New York</td><td>37.62</td></tr>",
                            "<tr><td>USA</td><td>NV</td><td>Reno</td><td>37.62</td></tr>",
                            "<tr><td>Canada</td><td>NT</td><td>Yellowknife</td><td>37.62</td></tr>",
                            "<tr><td>Australia</td><td>NSW</td><td>Sidney</td><td>37.62</td></tr>",
                            "<tr><td>Canada</td><td>NS</td><td>Halifax</td><td>37.62</td></tr>",
                            "<tr><td>Canada</td><td>MB</td><td>Winnipeg</td><td>37.62</td></tr>",
                            "<tr><td>USA</td><td>MA</td><td>Boston</td><td>37.62</td></tr>",
                            "<tr><td>USA</td><td>IL</td><td>Chicago</td><td>43.62</td></tr>",
                            "<tr><td>USA</td><td>FL</td><td>Orlando</td><td>39.62</td></tr>",
                            "<tr><td>Ireland</td><td>Dublin</td><td>Dublin</td><td>45.62</td></tr>",
                            "<tr><td>Brazil</td><td>DF</td><td>Brasília</td><td>37.62</td></tr>",
                            "<tr><td>USA</td><td>CA</td><td>Cupertino</td><td>38.62</td></tr>",
                            "<tr><td>USA</td><td>CA</td><td>Mountain View</td><td>77.24</td></tr>",
                            "<tr><td>Canada</td><td>BC</td><td>Vancouver</td><td>38.62</td></tr>",
                            "<tr><td>USA</td><td>AZ</td><td>Tucson</td><td>37.62</td></tr>",
                            "<tr><td>Canada</td><td>AB</td><td>Edmonton</td><td>37.62</td></tr>",
                            "<tr><td>Argentina</td><td>NULL</td><td>Buenos Aires</td><td>37.62</td></tr>",
                            "<tr><td>Austria</td><td>NULL</td><td>Vienne</td><td>42.62</td></tr>",
                            "<tr><td>Belgium</td><td>NULL</td><td>Brussels</td><td>37.62</td></tr>",
                            "<tr><td>Chile</td><td>NULL</td><td>Santiago</td><td>46.62</td></tr>",
                            "<tr><td>Czech Republic</td><td>NULL</td><td>Prague</td><td>90.24</td></tr>",
                            "<tr><td>Denmark</td><td>NULL</td><td>Copenhagen</td><td>37.62</td></tr>",
                            "<tr><td>Finland</td><td>NULL</td><td>Helsinki</td><td>41.62</td></tr>",
                            "<tr><td>France</td><td>NULL</td><td>Bordeaux</td><td>39.62</td></tr>",
                            "<tr><td>France</td><td>NULL</td><td>Dijon</td><td>40.62</td></tr>",
                            "<tr><td>France</td><td>NULL</td><td>Lyon</td><td>37.62</td></tr>",
                            "<tr><td>France</td><td>NULL</td><td>Paris</td><td>77.24</td></tr>",
                            "<tr><td>Germany</td><td>NULL</td><td>Berlin</td><td>75.24</td></tr>",
                            "<tr><td>Germany</td><td>NULL</td><td>Frankfurt</td><td>43.62</td></tr>",
                            "<tr><td>Germany</td><td>NULL</td><td>Stuttgart</td><td>37.62</td></tr>",
                            "<tr><td>Hungary</td><td>NULL</td><td>Budapest</td><td>45.62</td></tr>",
                            "<tr><td>India</td><td>NULL</td><td>Bangalore</td><td>36.64</td></tr>",
                            "<tr><td>India</td><td>NULL</td><td>Delhi</td><td>38.62</td></tr>",
                            "<tr><td>Norway</td><td>NULL</td><td>Oslo</td><td>39.62</td></tr>",
                            "<tr><td>Poland</td><td>NULL</td><td>Warsaw</td><td>37.62</td></tr>",
                            "<tr><td>Portugal</td><td>NULL</td><td>Lisbon</td><td>39.62</td></tr>",
                            "<tr><td>Portugal</td><td>NULL</td><td>Porto</td><td>37.62</td></tr>",
                            "<tr><td>Spain</td><td>NULL</td><td>Madrid</td><td>37.62</td></tr>",
                            "<tr><td>Sweden</td><td>NULL</td><td>Stockholm</td><td>38.62</td></tr>",
                            "<tr><td>United Kingdom</td><td>NULL</td><td>Edinburgh </td><td>37.62</td></tr>",
                            "<tr><td>United Kingdom</td><td>NULL</td><td>London</td><td>75.24</td></tr>",
                            "</table>"
                        ]
                    }
                },
                {
                    "output_type": "execute_result",
                    "metadata": {},
                    "execution_count": 16,
                    "data": {
                        "application/vnd.dataresource+json": {
                            "schema": {
                                "fields": [
                                    {
                                        "name": "(No column name)"
                                    },
                                    {
                                        "name": "Total Sales"
                                    }
                                ]
                            },
                            "data": [
                                {
                                    "0": "Helena Holý",
                                    "1": "49.62"
                                },
                                {
                                    "0": "Richard Cunningham",
                                    "1": "47.62"
                                },
                                {
                                    "0": "Luis Rojas",
                                    "1": "46.62"
                                },
                                {
                                    "0": "Ladislav Kovács",
                                    "1": "45.62"
                                },
                                {
                                    "0": "Hugh O'Reilly",
                                    "1": "45.62"
                                },
                                {
                                    "0": "Fynn Zimmermann",
                                    "1": "43.62"
                                },
                                {
                                    "0": "Julia Barnett",
                                    "1": "43.62"
                                },
                                {
                                    "0": "Frank Ralston",
                                    "1": "43.62"
                                },
                                {
                                    "0": "Astrid Gruber",
                                    "1": "42.62"
                                },
                                {
                                    "0": "Victor Stevens",
                                    "1": "42.62"
                                },
                                {
                                    "0": "Terhi Hämäläinen",
                                    "1": "41.62"
                                },
                                {
                                    "0": "František Wichterlová",
                                    "1": "40.62"
                                },
                                {
                                    "0": "Johannes Van der Berg",
                                    "1": "40.62"
                                },
                                {
                                    "0": "Isabelle Mercier",
                                    "1": "40.62"
                                },
                                {
                                    "0": "Jack Smith",
                                    "1": "39.62"
                                },
                                {
                                    "0": "Heather Leacock",
                                    "1": "39.62"
                                },
                                {
                                    "0": "João Fernandes",
                                    "1": "39.62"
                                },
                                {
                                    "0": "François Tremblay",
                                    "1": "39.62"
                                },
                                {
                                    "0": "Bjørn Hansen",
                                    "1": "39.62"
                                },
                                {
                                    "0": "Dan Miller",
                                    "1": "39.62"
                                },
                                {
                                    "0": "Wyatt Girard",
                                    "1": "39.62"
                                },
                                {
                                    "0": "Luís Gonçalves",
                                    "1": "39.62"
                                },
                                {
                                    "0": "Tim Goyer",
                                    "1": "38.62"
                                },
                                {
                                    "0": "Manoj Pareek",
                                    "1": "38.62"
                                },
                                {
                                    "0": "Camille Bernard",
                                    "1": "38.62"
                                },
                                {
                                    "0": "Dominique Lefebvre",
                                    "1": "38.62"
                                },
                                {
                                    "0": "Jennifer Peterson",
                                    "1": "38.62"
                                },
                                {
                                    "0": "Joakim Johansson",
                                    "1": "38.62"
                                },
                                {
                                    "0": "Hannah Schneider",
                                    "1": "37.62"
                                },
                                {
                                    "0": "John Gordon",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Kara Nielsen",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Kathy Chase",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Leonie Köhler",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Lucas Mancini",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Madalena Sampaio",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Eduardo Martins",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Edward Francis",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Ellie Sullivan",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Emma Jones",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Enrique Muñoz",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Fernanda Ramos",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Frank Harris",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Daan Peeters",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Diego Gutiérrez",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Aaron Mitchell",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Alexandre Rocha",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Marc Dubois",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Mark Philips",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Mark Taylor",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Martha Silk",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Michelle Brooks",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Niklas Schröder",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Patrick Gray",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Phil Hughes",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Robert Brown",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Roberto Almeida",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Stanisław Wójcik",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Steve Murray",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Puja Srivastava",
                                    "1": "36.64"
                                }
                            ]
                        },
                        "text/html": [
                            "<table>",
                            "<tr><th>(No column name)</th><th>Total Sales</th></tr>",
                            "<tr><td>Helena Holý</td><td>49.62</td></tr>",
                            "<tr><td>Richard Cunningham</td><td>47.62</td></tr>",
                            "<tr><td>Luis Rojas</td><td>46.62</td></tr>",
                            "<tr><td>Ladislav Kovács</td><td>45.62</td></tr>",
                            "<tr><td>Hugh O'Reilly</td><td>45.62</td></tr>",
                            "<tr><td>Fynn Zimmermann</td><td>43.62</td></tr>",
                            "<tr><td>Julia Barnett</td><td>43.62</td></tr>",
                            "<tr><td>Frank Ralston</td><td>43.62</td></tr>",
                            "<tr><td>Astrid Gruber</td><td>42.62</td></tr>",
                            "<tr><td>Victor Stevens</td><td>42.62</td></tr>",
                            "<tr><td>Terhi Hämäläinen</td><td>41.62</td></tr>",
                            "<tr><td>František Wichterlová</td><td>40.62</td></tr>",
                            "<tr><td>Johannes Van der Berg</td><td>40.62</td></tr>",
                            "<tr><td>Isabelle Mercier</td><td>40.62</td></tr>",
                            "<tr><td>Jack Smith</td><td>39.62</td></tr>",
                            "<tr><td>Heather Leacock</td><td>39.62</td></tr>",
                            "<tr><td>João Fernandes</td><td>39.62</td></tr>",
                            "<tr><td>François Tremblay</td><td>39.62</td></tr>",
                            "<tr><td>Bjørn Hansen</td><td>39.62</td></tr>",
                            "<tr><td>Dan Miller</td><td>39.62</td></tr>",
                            "<tr><td>Wyatt Girard</td><td>39.62</td></tr>",
                            "<tr><td>Luís Gonçalves</td><td>39.62</td></tr>",
                            "<tr><td>Tim Goyer</td><td>38.62</td></tr>",
                            "<tr><td>Manoj Pareek</td><td>38.62</td></tr>",
                            "<tr><td>Camille Bernard</td><td>38.62</td></tr>",
                            "<tr><td>Dominique Lefebvre</td><td>38.62</td></tr>",
                            "<tr><td>Jennifer Peterson</td><td>38.62</td></tr>",
                            "<tr><td>Joakim Johansson</td><td>38.62</td></tr>",
                            "<tr><td>Hannah Schneider</td><td>37.62</td></tr>",
                            "<tr><td>John Gordon</td><td>37.62</td></tr>",
                            "<tr><td>Kara Nielsen</td><td>37.62</td></tr>",
                            "<tr><td>Kathy Chase</td><td>37.62</td></tr>",
                            "<tr><td>Leonie Köhler</td><td>37.62</td></tr>",
                            "<tr><td>Lucas Mancini</td><td>37.62</td></tr>",
                            "<tr><td>Madalena Sampaio</td><td>37.62</td></tr>",
                            "<tr><td>Eduardo Martins</td><td>37.62</td></tr>",
                            "<tr><td>Edward Francis</td><td>37.62</td></tr>",
                            "<tr><td>Ellie Sullivan</td><td>37.62</td></tr>",
                            "<tr><td>Emma Jones</td><td>37.62</td></tr>",
                            "<tr><td>Enrique Muñoz</td><td>37.62</td></tr>",
                            "<tr><td>Fernanda Ramos</td><td>37.62</td></tr>",
                            "<tr><td>Frank Harris</td><td>37.62</td></tr>",
                            "<tr><td>Daan Peeters</td><td>37.62</td></tr>",
                            "<tr><td>Diego Gutiérrez</td><td>37.62</td></tr>",
                            "<tr><td>Aaron Mitchell</td><td>37.62</td></tr>",
                            "<tr><td>Alexandre Rocha</td><td>37.62</td></tr>",
                            "<tr><td>Marc Dubois</td><td>37.62</td></tr>",
                            "<tr><td>Mark Philips</td><td>37.62</td></tr>",
                            "<tr><td>Mark Taylor</td><td>37.62</td></tr>",
                            "<tr><td>Martha Silk</td><td>37.62</td></tr>",
                            "<tr><td>Michelle Brooks</td><td>37.62</td></tr>",
                            "<tr><td>Niklas Schröder</td><td>37.62</td></tr>",
                            "<tr><td>Patrick Gray</td><td>37.62</td></tr>",
                            "<tr><td>Phil Hughes</td><td>37.62</td></tr>",
                            "<tr><td>Robert Brown</td><td>37.62</td></tr>",
                            "<tr><td>Roberto Almeida</td><td>37.62</td></tr>",
                            "<tr><td>Stanisław Wójcik</td><td>37.62</td></tr>",
                            "<tr><td>Steve Murray</td><td>37.62</td></tr>",
                            "<tr><td>Puja Srivastava</td><td>36.64</td></tr>",
                            "</table>"
                        ]
                    }
                },
                {
                    "output_type": "execute_result",
                    "metadata": {},
                    "execution_count": 16,
                    "data": {
                        "application/vnd.dataresource+json": {
                            "schema": {
                                "fields": [
                                    {
                                        "name": "company"
                                    },
                                    {
                                        "name": "Total Sales"
                                    }
                                ]
                            },
                            "data": [
                                {
                                    "0": "NULL",
                                    "1": "1943.40"
                                },
                                {
                                    "0": "JetBrains s.r.o.",
                                    "1": "40.62"
                                },
                                {
                                    "0": "Microsoft Corporation",
                                    "1": "39.62"
                                },
                                {
                                    "0": "Embraer - Empresa Brasileira de Aeronáutica S.A.",
                                    "1": "39.62"
                                },
                                {
                                    "0": "Apple Inc.",
                                    "1": "38.62"
                                },
                                {
                                    "0": "Rogers Canada",
                                    "1": "38.62"
                                },
                                {
                                    "0": "Telus",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Woodstock Discos",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Riotur",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Banco do Brasil S.A.",
                                    "1": "37.62"
                                },
                                {
                                    "0": "Google Inc.",
                                    "1": "37.62"
                                }
                            ]
                        },
                        "text/html": [
                            "<table>",
                            "<tr><th>company</th><th>Total Sales</th></tr>",
                            "<tr><td>NULL</td><td>1943.40</td></tr>",
                            "<tr><td>JetBrains s.r.o.</td><td>40.62</td></tr>",
                            "<tr><td>Microsoft Corporation</td><td>39.62</td></tr>",
                            "<tr><td>Embraer - Empresa Brasileira de Aeronáutica S.A.</td><td>39.62</td></tr>",
                            "<tr><td>Apple Inc.</td><td>38.62</td></tr>",
                            "<tr><td>Rogers Canada</td><td>38.62</td></tr>",
                            "<tr><td>Telus</td><td>37.62</td></tr>",
                            "<tr><td>Woodstock Discos</td><td>37.62</td></tr>",
                            "<tr><td>Riotur</td><td>37.62</td></tr>",
                            "<tr><td>Banco do Brasil S.A.</td><td>37.62</td></tr>",
                            "<tr><td>Google Inc.</td><td>37.62</td></tr>",
                            "</table>"
                        ]
                    }
                },
                {
                    "output_type": "execute_result",
                    "metadata": {},
                    "execution_count": 16,
                    "data": {
                        "application/vnd.dataresource+json": {
                            "schema": {
                                "fields": [
                                    {
                                        "name": "Name"
                                    },
                                    {
                                        "name": "(No column name)"
                                    }
                                ]
                            },
                            "data": [
                                {
                                    "0": "Iron Maiden",
                                    "1": "1233.54"
                                },
                                {
                                    "0": "U2",
                                    "1": "895.59"
                                },
                                {
                                    "0": "Lost",
                                    "1": "833.70"
                                },
                                {
                                    "0": "Led Zeppelin",
                                    "1": "620.73"
                                },
                                {
                                    "0": "Metallica",
                                    "1": "599.94"
                                },
                                {
                                    "0": "Deep Purple",
                                    "1": "550.44"
                                },
                                {
                                    "0": "Pearl Jam",
                                    "1": "408.87"
                                },
                                {
                                    "0": "Lenny Kravitz",
                                    "1": "372.51"
                                },
                                {
                                    "0": "Van Halen",
                                    "1": "336.82"
                                },
                                {
                                    "0": "The Office",
                                    "1": "328.80"
                                },
                                {
                                    "0": "Various Artists",
                                    "1": "318.78"
                                },
                                {
                                    "0": "Red Hot Chili Peppers",
                                    "1": "299.97"
                                },
                                {
                                    "0": "Faith No More",
                                    "1": "296.01"
                                },
                                {
                                    "0": "Foo Fighters",
                                    "1": "270.27"
                                },
                                {
                                    "0": "Titãs",
                                    "1": "269.75"
                                },
                                {
                                    "0": "Os Paralamas Do Sucesso",
                                    "1": "265.32"
                                },
                                {
                                    "0": "Queen",
                                    "1": "256.41"
                                },
                                {
                                    "0": "The Rolling Stones",
                                    "1": "249.48"
                                },
                                {
                                    "0": "Eric Clapton",
                                    "1": "241.56"
                                },
                                {
                                    "0": "Heroes",
                                    "1": "238.61"
                                },
                                {
                                    "0": "Audioslave",
                                    "1": "228.81"
                                },
                                {
                                    "0": "Guns N' Roses",
                                    "1": "222.75"
                                },
                                {
                                    "0": "Chico Science & Nação Zumbi",
                                    "1": "219.78"
                                },
                                {
                                    "0": "R.E.M.",
                                    "1": "216.81"
                                },
                                {
                                    "0": "Miles Davis",
                                    "1": "215.82"
                                },
                                {
                                    "0": "Creedence Clearwater Revival",
                                    "1": "215.82"
                                },
                                {
                                    "0": "Kiss",
                                    "1": "211.86"
                                },
                                {
                                    "0": "Green Day",
                                    "1": "204.93"
                                },
                                {
                                    "0": "Battlestar Galactica",
                                    "1": "202.80"
                                },
                                {
                                    "0": "Smashing Pumpkins",
                                    "1": "192.06"
                                },
                                {
                                    "0": "Legião Urbana",
                                    "1": "191.07"
                                },
                                {
                                    "0": "Jamiroquai",
                                    "1": "190.08"
                                },
                                {
                                    "0": "Antônio Carlos Jobim",
                                    "1": "190.08"
                                },
                                {
                                    "0": "Cássia Eller",
                                    "1": "187.11"
                                },
                                {
                                    "0": "The Cult",
                                    "1": "187.11"
                                },
                                {
                                    "0": "Chico Buarque",
                                    "1": "185.13"
                                },
                                {
                                    "0": "Cidade Negra",
                                    "1": "182.16"
                                },
                                {
                                    "0": "Lulu Santos",
                                    "1": "180.18"
                                },
                                {
                                    "0": "Gilberto Gil",
                                    "1": "177.21"
                                },
                                {
                                    "0": "Milton Nascimento",
                                    "1": "173.25"
                                },
                                {
                                    "0": "Ozzy Osbourne",
                                    "1": "171.31"
                                },
                                {
                                    "0": "Santana",
                                    "1": "166.32"
                                },
                                {
                                    "0": "Nirvana",
                                    "1": "166.32"
                                },
                                {
                                    "0": "Zeca Pagodinho",
                                    "1": "161.74"
                                },
                                {
                                    "0": "Battlestar Galactica (Classic)",
                                    "1": "157.10"
                                },
                                {
                                    "0": "Tim Maia",
                                    "1": "146.54"
                                },
                                {
                                    "0": "Djavan",
                                    "1": "141.57"
                                },
                                {
                                    "0": "Skank",
                                    "1": "138.60"
                                },
                                {
                                    "0": "Frank Sinatra",
                                    "1": "138.60"
                                },
                                {
                                    "0": "The Tea Party",
                                    "1": "135.63"
                                },
                                {
                                    "0": "Gene Krupa",
                                    "1": "127.71"
                                },
                                {
                                    "0": "The Who",
                                    "1": "123.75"
                                },
                                {
                                    "0": "Caetano Veloso",
                                    "1": "123.75"
                                },
                                {
                                    "0": "The Black Crowes",
                                    "1": "114.84"
                                },
                                {
                                    "0": "Marisa Monte",
                                    "1": "110.88"
                                },
                                {
                                    "0": "Black Label Society",
                                    "1": "110.88"
                                },
                                {
                                    "0": "Funk Como Le Gusta",
                                    "1": "110.88"
                                },
                                {
                                    "0": "Spyro Gyra",
                                    "1": "110.88"
                                },
                                {
                                    "0": "AC/DC",
                                    "1": "107.91"
                                },
                                {
                                    "0": "Jimi Hendrix",
                                    "1": "105.93"
                                },
                                {
                                    "0": "James Brown",
                                    "1": "104.94"
                                },
                                {
                                    "0": "Vinícius De Moraes",
                                    "1": "104.16"
                                },
                                {
                                    "0": "The Clash",
                                    "1": "103.95"
                                },
                                {
                                    "0": "Amy Winehouse",
                                    "1": "101.02"
                                },
                                {
                                    "0": "Velvet Revolver",
                                    "1": "97.21"
                                },
                                {
                                    "0": "Def Leppard",
                                    "1": "97.02"
                                },
                                {
                                    "0": "Mötley Crüe",
                                    "1": "97.02"
                                },
                                {
                                    "0": "The Police",
                                    "1": "97.02"
                                },
                                {
                                    "0": "Marcos Valle",
                                    "1": "97.02"
                                },
                                {
                                    "0": "O Rappa",
                                    "1": "95.17"
                                },
                                {
                                    "0": "Soundgarden",
                                    "1": "93.06"
                                },
                                {
                                    "0": "Body Count",
                                    "1": "93.06"
                                },
                                {
                                    "0": "Os Mutantes",
                                    "1": "91.08"
                                },
                                {
                                    "0": "House Of Pain",
                                    "1": "90.18"
                                },
                                {
                                    "0": "Gonzaguinha",
                                    "1": "90.09"
                                },
                                {
                                    "0": "O Terço",
                                    "1": "90.09"
                                },
                                {
                                    "0": "Passengers",
                                    "1": "90.09"
                                },
                                {
                                    "0": "Marvin Gaye",
                                    "1": "90.09"
                                },
                                {
                                    "0": "JET",
                                    "1": "87.12"
                                },
                                {
                                    "0": "Falamansa",
                                    "1": "86.13"
                                },
                                {
                                    "0": "Toquinho & Vinícius",
                                    "1": "86.13"
                                },
                                {
                                    "0": "Jota Quest",
                                    "1": "83.16"
                                },
                                {
                                    "0": "BackBeat",
                                    "1": "83.16"
                                },
                                {
                                    "0": "João Suplicy",
                                    "1": "83.16"
                                },
                                {
                                    "0": "Jorge Ben",
                                    "1": "83.16"
                                },
                                {
                                    "0": "Mônica Marianno",
                                    "1": "83.16"
                                },
                                {
                                    "0": "Ed Motta",
                                    "1": "83.16"
                                },
                                {
                                    "0": "Raul Seixas",
                                    "1": "82.17"
                                },
                                {
                                    "0": "Aerosmith",
                                    "1": "82.17"
                                },
                                {
                                    "0": "Alanis Morissette",
                                    "1": "81.18"
                                },
                                {
                                    "0": "Incognito",
                                    "1": "81.18"
                                },
                                {
                                    "0": "Motörhead",
                                    "1": "78.21"
                                },
                                {
                                    "0": "Rush",
                                    "1": "78.21"
                                },
                                {
                                    "0": "Alice In Chains",
                                    "1": "77.22"
                                },
                                {
                                    "0": "Black Sabbath",
                                    "1": "76.23"
                                },
                                {
                                    "0": "Planet Hemp",
                                    "1": "76.23"
                                },
                                {
                                    "0": "Elis Regina",
                                    "1": "76.23"
                                },
                                {
                                    "0": "Bruce Dickinson",
                                    "1": "72.27"
                                },
                                {
                                    "0": "Marillion",
                                    "1": "69.30"
                                },
                                {
                                    "0": "Olodum",
                                    "1": "68.31"
                                },
                                {
                                    "0": "Judas Priest",
                                    "1": "68.31"
                                },
                                {
                                    "0": "System Of A Down",
                                    "1": "67.32"
                                },
                                {
                                    "0": "David Coverdale",
                                    "1": "67.32"
                                },
                                {
                                    "0": "Page & Plant",
                                    "1": "67.32"
                                },
                                {
                                    "0": "UB40",
                                    "1": "67.32"
                                },
                                {
                                    "0": "Chris Cornell",
                                    "1": "64.44"
                                },
                                {
                                    "0": "Temple of the Dog",
                                    "1": "64.44"
                                },
                                {
                                    "0": "Cláudio Zoli",
                                    "1": "59.40"
                                },
                                {
                                    "0": "Men At Work",
                                    "1": "59.40"
                                },
                                {
                                    "0": "R.E.M. Feat. Kate Pearson",
                                    "1": "58.41"
                                },
                                {
                                    "0": "Godsmack",
                                    "1": "57.42"
                                },
                                {
                                    "0": "Raimundos",
                                    "1": "56.43"
                                },
                                {
                                    "0": "Joe Satriani",
                                    "1": "55.44"
                                },
                                {
                                    "0": "Billy Cobham",
                                    "1": "55.44"
                                },
                                {
                                    "0": "Stone Temple Pilots",
                                    "1": "55.44"
                                },
                                {
                                    "0": "Dennis Chambers",
                                    "1": "55.44"
                                },
                                {
                                    "0": "Pink Floyd",
                                    "1": "55.44"
                                },
                                {
                                    "0": "Frank Zappa & Captain Beefheart",
                                    "1": "55.44"
                                },
                                {
                                    "0": "Paul D'Ianno",
                                    "1": "54.45"
                                },
                                {
                                    "0": "Stevie Ray Vaughan & Double Trouble",
                                    "1": "52.47"
                                },
                                {
                                    "0": "The Doors",
                                    "1": "50.49"
                                },
                                {
                                    "0": "Scorpions",
                                    "1": "48.55"
                                },
                                {
                                    "0": "Apocalyptica",
                                    "1": "45.54"
                                },
                                {
                                    "0": "Buddy Guy",
                                    "1": "43.56"
                                },
                                {
                                    "0": "Terry Bozzio, Tony Levin & Steve Stevens",
                                    "1": "38.61"
                                },
                                {
                                    "0": "Accept",
                                    "1": "27.72"
                                },
                                {
                                    "0": "Eugene Ormandy",
                                    "1": "24.77"
                                },
                                {
                                    "0": "Michael Tilson Thomas & San Francisco Symphony",
                                    "1": "23.78"
                                },
                                {
                                    "0": "Yo-Yo Ma",
                                    "1": "16.86"
                                },
                                {
                                    "0": "Sir Georg Solti & Wiener Philharmoniker",
                                    "1": "16.86"
                                },
                                {
                                    "0": "The Posies",
                                    "1": "16.86"
                                },
                                {
                                    "0": "Chicago Symphony Orchestra & Fritz Reiner",
                                    "1": "16.85"
                                },
                                {
                                    "0": "English Concert & Trevor Pinnock",
                                    "1": "15.86"
                                },
                                {
                                    "0": "Scholars Baroque Ensemble",
                                    "1": "15.86"
                                },
                                {
                                    "0": "Habib Koité and Bamada",
                                    "1": "15.86"
                                },
                                {
                                    "0": "Maurizio Pollini",
                                    "1": "15.86"
                                },
                                {
                                    "0": "Royal Philharmonic Orchestra & Sir Thomas Beecham",
                                    "1": "15.86"
                                },
                                {
                                    "0": "Edo de Waart & San Francisco Symphony",
                                    "1": "15.86"
                                },
                                {
                                    "0": "Luciana Souza/Romero Lubambo",
                                    "1": "15.86"
                                },
                                {
                                    "0": "Academy of St. Martin in the Fields, John Birch, Sir Neville Marriner & Sylvia McNair",
                                    "1": "15.86"
                                },
                                {
                                    "0": "Aquaman",
                                    "1": "14.89"
                                },
                                {
                                    "0": "Emerson String Quartet",
                                    "1": "14.85"
                                },
                                {
                                    "0": "Equale Brass Ensemble, John Eliot Gardiner & Munich Monteverdi Orchestra and Choir",
                                    "1": "12.87"
                                },
                                {
                                    "0": "Berliner Philharmoniker & Herbert Von Karajan",
                                    "1": "11.88"
                                },
                                {
                                    "0": "Academy of St. Martin in the Fields, Sir Neville Marriner & Thurston Dart",
                                    "1": "10.89"
                                },
                                {
                                    "0": "Göteborgs Symfoniker & Neeme Järvi",
                                    "1": "8.91"
                                },
                                {
                                    "0": "Kent Nagano and Orchestre de l'Opéra de Lyon",
                                    "1": "5.94"
                                },
                                {
                                    "0": "Adrian Leaper & Doreen de Feis",
                                    "1": "5.94"
                                },
                                {
                                    "0": "Michele Campanella",
                                    "1": "5.94"
                                },
                                {
                                    "0": "Philharmonia Orchestra & Sir Neville Marriner",
                                    "1": "5.94"
                                },
                                {
                                    "0": "Martin Roscoe",
                                    "1": "5.94"
                                },
                                {
                                    "0": "Felix Schmidt, London Symphony Orchestra & Rafael Frühbeck de Burgos",
                                    "1": "3.96"
                                },
                                {
                                    "0": "The King's Singers",
                                    "1": "3.96"
                                },
                                {
                                    "0": "Julian Bream",
                                    "1": "3.96"
                                },
                                {
                                    "0": "Roger Norrington, London Classical Players",
                                    "1": "3.96"
                                },
                                {
                                    "0": "Antal Doráti & London Symphony Orchestra",
                                    "1": "3.96"
                                },
                                {
                                    "0": "Dread Zeppelin",
                                    "1": "2.98"
                                },
                                {
                                    "0": "Academy of St. Martin in the Fields & Sir Neville Marriner",
                                    "1": "1.98"
                                },
                                {
                                    "0": "Yehudi Menuhin",
                                    "1": "1.98"
                                },
                                {
                                    "0": "Berliner Philharmoniker & Hans Rosbaud",
                                    "1": "1.98"
                                },
                                {
                                    "0": "The 12 Cellists of The Berlin Philharmonic",
                                    "1": "1.98"
                                },
                                {
                                    "0": "Orchestra of The Age of Enlightenment",
                                    "1": "1.98"
                                },
                                {
                                    "0": "Emanuel Ax, Eugene Ormandy & Philadelphia Orchestra",
                                    "1": "1.98"
                                },
                                {
                                    "0": "Otto Klemperer & Philharmonia Orchestra",
                                    "1": "1.98"
                                },
                                {
                                    "0": "Calexico",
                                    "1": "0.99"
                                }
                            ]
                        },
                        "text/html": [
                            "<table>",
                            "<tr><th>Name</th><th>(No column name)</th></tr>",
                            "<tr><td>Iron Maiden</td><td>1233.54</td></tr>",
                            "<tr><td>U2</td><td>895.59</td></tr>",
                            "<tr><td>Lost</td><td>833.70</td></tr>",
                            "<tr><td>Led Zeppelin</td><td>620.73</td></tr>",
                            "<tr><td>Metallica</td><td>599.94</td></tr>",
                            "<tr><td>Deep Purple</td><td>550.44</td></tr>",
                            "<tr><td>Pearl Jam</td><td>408.87</td></tr>",
                            "<tr><td>Lenny Kravitz</td><td>372.51</td></tr>",
                            "<tr><td>Van Halen</td><td>336.82</td></tr>",
                            "<tr><td>The Office</td><td>328.80</td></tr>",
                            "<tr><td>Various Artists</td><td>318.78</td></tr>",
                            "<tr><td>Red Hot Chili Peppers</td><td>299.97</td></tr>",
                            "<tr><td>Faith No More</td><td>296.01</td></tr>",
                            "<tr><td>Foo Fighters</td><td>270.27</td></tr>",
                            "<tr><td>Titãs</td><td>269.75</td></tr>",
                            "<tr><td>Os Paralamas Do Sucesso</td><td>265.32</td></tr>",
                            "<tr><td>Queen</td><td>256.41</td></tr>",
                            "<tr><td>The Rolling Stones</td><td>249.48</td></tr>",
                            "<tr><td>Eric Clapton</td><td>241.56</td></tr>",
                            "<tr><td>Heroes</td><td>238.61</td></tr>",
                            "<tr><td>Audioslave</td><td>228.81</td></tr>",
                            "<tr><td>Guns N' Roses</td><td>222.75</td></tr>",
                            "<tr><td>Chico Science &amp; Nação Zumbi</td><td>219.78</td></tr>",
                            "<tr><td>R.E.M.</td><td>216.81</td></tr>",
                            "<tr><td>Miles Davis</td><td>215.82</td></tr>",
                            "<tr><td>Creedence Clearwater Revival</td><td>215.82</td></tr>",
                            "<tr><td>Kiss</td><td>211.86</td></tr>",
                            "<tr><td>Green Day</td><td>204.93</td></tr>",
                            "<tr><td>Battlestar Galactica</td><td>202.80</td></tr>",
                            "<tr><td>Smashing Pumpkins</td><td>192.06</td></tr>",
                            "<tr><td>Legião Urbana</td><td>191.07</td></tr>",
                            "<tr><td>Jamiroquai</td><td>190.08</td></tr>",
                            "<tr><td>Antônio Carlos Jobim</td><td>190.08</td></tr>",
                            "<tr><td>Cássia Eller</td><td>187.11</td></tr>",
                            "<tr><td>The Cult</td><td>187.11</td></tr>",
                            "<tr><td>Chico Buarque</td><td>185.13</td></tr>",
                            "<tr><td>Cidade Negra</td><td>182.16</td></tr>",
                            "<tr><td>Lulu Santos</td><td>180.18</td></tr>",
                            "<tr><td>Gilberto Gil</td><td>177.21</td></tr>",
                            "<tr><td>Milton Nascimento</td><td>173.25</td></tr>",
                            "<tr><td>Ozzy Osbourne</td><td>171.31</td></tr>",
                            "<tr><td>Santana</td><td>166.32</td></tr>",
                            "<tr><td>Nirvana</td><td>166.32</td></tr>",
                            "<tr><td>Zeca Pagodinho</td><td>161.74</td></tr>",
                            "<tr><td>Battlestar Galactica (Classic)</td><td>157.10</td></tr>",
                            "<tr><td>Tim Maia</td><td>146.54</td></tr>",
                            "<tr><td>Djavan</td><td>141.57</td></tr>",
                            "<tr><td>Skank</td><td>138.60</td></tr>",
                            "<tr><td>Frank Sinatra</td><td>138.60</td></tr>",
                            "<tr><td>The Tea Party</td><td>135.63</td></tr>",
                            "<tr><td>Gene Krupa</td><td>127.71</td></tr>",
                            "<tr><td>The Who</td><td>123.75</td></tr>",
                            "<tr><td>Caetano Veloso</td><td>123.75</td></tr>",
                            "<tr><td>The Black Crowes</td><td>114.84</td></tr>",
                            "<tr><td>Marisa Monte</td><td>110.88</td></tr>",
                            "<tr><td>Black Label Society</td><td>110.88</td></tr>",
                            "<tr><td>Funk Como Le Gusta</td><td>110.88</td></tr>",
                            "<tr><td>Spyro Gyra</td><td>110.88</td></tr>",
                            "<tr><td>AC/DC</td><td>107.91</td></tr>",
                            "<tr><td>Jimi Hendrix</td><td>105.93</td></tr>",
                            "<tr><td>James Brown</td><td>104.94</td></tr>",
                            "<tr><td>Vinícius De Moraes</td><td>104.16</td></tr>",
                            "<tr><td>The Clash</td><td>103.95</td></tr>",
                            "<tr><td>Amy Winehouse</td><td>101.02</td></tr>",
                            "<tr><td>Velvet Revolver</td><td>97.21</td></tr>",
                            "<tr><td>Def Leppard</td><td>97.02</td></tr>",
                            "<tr><td>Mötley Crüe</td><td>97.02</td></tr>",
                            "<tr><td>The Police</td><td>97.02</td></tr>",
                            "<tr><td>Marcos Valle</td><td>97.02</td></tr>",
                            "<tr><td>O Rappa</td><td>95.17</td></tr>",
                            "<tr><td>Soundgarden</td><td>93.06</td></tr>",
                            "<tr><td>Body Count</td><td>93.06</td></tr>",
                            "<tr><td>Os Mutantes</td><td>91.08</td></tr>",
                            "<tr><td>House Of Pain</td><td>90.18</td></tr>",
                            "<tr><td>Gonzaguinha</td><td>90.09</td></tr>",
                            "<tr><td>O Terço</td><td>90.09</td></tr>",
                            "<tr><td>Passengers</td><td>90.09</td></tr>",
                            "<tr><td>Marvin Gaye</td><td>90.09</td></tr>",
                            "<tr><td>JET</td><td>87.12</td></tr>",
                            "<tr><td>Falamansa</td><td>86.13</td></tr>",
                            "<tr><td>Toquinho &amp; Vinícius</td><td>86.13</td></tr>",
                            "<tr><td>Jota Quest</td><td>83.16</td></tr>",
                            "<tr><td>BackBeat</td><td>83.16</td></tr>",
                            "<tr><td>João Suplicy</td><td>83.16</td></tr>",
                            "<tr><td>Jorge Ben</td><td>83.16</td></tr>",
                            "<tr><td>Mônica Marianno</td><td>83.16</td></tr>",
                            "<tr><td>Ed Motta</td><td>83.16</td></tr>",
                            "<tr><td>Raul Seixas</td><td>82.17</td></tr>",
                            "<tr><td>Aerosmith</td><td>82.17</td></tr>",
                            "<tr><td>Alanis Morissette</td><td>81.18</td></tr>",
                            "<tr><td>Incognito</td><td>81.18</td></tr>",
                            "<tr><td>Motörhead</td><td>78.21</td></tr>",
                            "<tr><td>Rush</td><td>78.21</td></tr>",
                            "<tr><td>Alice In Chains</td><td>77.22</td></tr>",
                            "<tr><td>Black Sabbath</td><td>76.23</td></tr>",
                            "<tr><td>Planet Hemp</td><td>76.23</td></tr>",
                            "<tr><td>Elis Regina</td><td>76.23</td></tr>",
                            "<tr><td>Bruce Dickinson</td><td>72.27</td></tr>",
                            "<tr><td>Marillion</td><td>69.30</td></tr>",
                            "<tr><td>Olodum</td><td>68.31</td></tr>",
                            "<tr><td>Judas Priest</td><td>68.31</td></tr>",
                            "<tr><td>System Of A Down</td><td>67.32</td></tr>",
                            "<tr><td>David Coverdale</td><td>67.32</td></tr>",
                            "<tr><td>Page &amp; Plant</td><td>67.32</td></tr>",
                            "<tr><td>UB40</td><td>67.32</td></tr>",
                            "<tr><td>Chris Cornell</td><td>64.44</td></tr>",
                            "<tr><td>Temple of the Dog</td><td>64.44</td></tr>",
                            "<tr><td>Cláudio Zoli</td><td>59.40</td></tr>",
                            "<tr><td>Men At Work</td><td>59.40</td></tr>",
                            "<tr><td>R.E.M. Feat. Kate Pearson</td><td>58.41</td></tr>",
                            "<tr><td>Godsmack</td><td>57.42</td></tr>",
                            "<tr><td>Raimundos</td><td>56.43</td></tr>",
                            "<tr><td>Joe Satriani</td><td>55.44</td></tr>",
                            "<tr><td>Billy Cobham</td><td>55.44</td></tr>",
                            "<tr><td>Stone Temple Pilots</td><td>55.44</td></tr>",
                            "<tr><td>Dennis Chambers</td><td>55.44</td></tr>",
                            "<tr><td>Pink Floyd</td><td>55.44</td></tr>",
                            "<tr><td>Frank Zappa &amp; Captain Beefheart</td><td>55.44</td></tr>",
                            "<tr><td>Paul D'Ianno</td><td>54.45</td></tr>",
                            "<tr><td>Stevie Ray Vaughan &amp; Double Trouble</td><td>52.47</td></tr>",
                            "<tr><td>The Doors</td><td>50.49</td></tr>",
                            "<tr><td>Scorpions</td><td>48.55</td></tr>",
                            "<tr><td>Apocalyptica</td><td>45.54</td></tr>",
                            "<tr><td>Buddy Guy</td><td>43.56</td></tr>",
                            "<tr><td>Terry Bozzio, Tony Levin &amp; Steve Stevens</td><td>38.61</td></tr>",
                            "<tr><td>Accept</td><td>27.72</td></tr>",
                            "<tr><td>Eugene Ormandy</td><td>24.77</td></tr>",
                            "<tr><td>Michael Tilson Thomas &amp; San Francisco Symphony</td><td>23.78</td></tr>",
                            "<tr><td>Yo-Yo Ma</td><td>16.86</td></tr>",
                            "<tr><td>Sir Georg Solti &amp; Wiener Philharmoniker</td><td>16.86</td></tr>",
                            "<tr><td>The Posies</td><td>16.86</td></tr>",
                            "<tr><td>Chicago Symphony Orchestra &amp; Fritz Reiner</td><td>16.85</td></tr>",
                            "<tr><td>English Concert &amp; Trevor Pinnock</td><td>15.86</td></tr>",
                            "<tr><td>Scholars Baroque Ensemble</td><td>15.86</td></tr>",
                            "<tr><td>Habib Koité and Bamada</td><td>15.86</td></tr>",
                            "<tr><td>Maurizio Pollini</td><td>15.86</td></tr>",
                            "<tr><td>Royal Philharmonic Orchestra &amp; Sir Thomas Beecham</td><td>15.86</td></tr>",
                            "<tr><td>Edo de Waart &amp; San Francisco Symphony</td><td>15.86</td></tr>",
                            "<tr><td>Luciana Souza/Romero Lubambo</td><td>15.86</td></tr>",
                            "<tr><td>Academy of St. Martin in the Fields, John Birch, Sir Neville Marriner &amp; Sylvia McNair</td><td>15.86</td></tr>",
                            "<tr><td>Aquaman</td><td>14.89</td></tr>",
                            "<tr><td>Emerson String Quartet</td><td>14.85</td></tr>",
                            "<tr><td>Equale Brass Ensemble, John Eliot Gardiner &amp; Munich Monteverdi Orchestra and Choir</td><td>12.87</td></tr>",
                            "<tr><td>Berliner Philharmoniker &amp; Herbert Von Karajan</td><td>11.88</td></tr>",
                            "<tr><td>Academy of St. Martin in the Fields, Sir Neville Marriner &amp; Thurston Dart</td><td>10.89</td></tr>",
                            "<tr><td>Göteborgs Symfoniker &amp; Neeme Järvi</td><td>8.91</td></tr>",
                            "<tr><td>Kent Nagano and Orchestre de l'Opéra de Lyon</td><td>5.94</td></tr>",
                            "<tr><td>Adrian Leaper &amp; Doreen de Feis</td><td>5.94</td></tr>",
                            "<tr><td>Michele Campanella</td><td>5.94</td></tr>",
                            "<tr><td>Philharmonia Orchestra &amp; Sir Neville Marriner</td><td>5.94</td></tr>",
                            "<tr><td>Martin Roscoe</td><td>5.94</td></tr>",
                            "<tr><td>Felix Schmidt, London Symphony Orchestra &amp; Rafael Frühbeck de Burgos</td><td>3.96</td></tr>",
                            "<tr><td>The King's Singers</td><td>3.96</td></tr>",
                            "<tr><td>Julian Bream</td><td>3.96</td></tr>",
                            "<tr><td>Roger Norrington, London Classical Players</td><td>3.96</td></tr>",
                            "<tr><td>Antal Doráti &amp; London Symphony Orchestra</td><td>3.96</td></tr>",
                            "<tr><td>Dread Zeppelin</td><td>2.98</td></tr>",
                            "<tr><td>Academy of St. Martin in the Fields &amp; Sir Neville Marriner</td><td>1.98</td></tr>",
                            "<tr><td>Yehudi Menuhin</td><td>1.98</td></tr>",
                            "<tr><td>Berliner Philharmoniker &amp; Hans Rosbaud</td><td>1.98</td></tr>",
                            "<tr><td>The 12 Cellists of The Berlin Philharmonic</td><td>1.98</td></tr>",
                            "<tr><td>Orchestra of The Age of Enlightenment</td><td>1.98</td></tr>",
                            "<tr><td>Emanuel Ax, Eugene Ormandy &amp; Philadelphia Orchestra</td><td>1.98</td></tr>",
                            "<tr><td>Otto Klemperer &amp; Philharmonia Orchestra</td><td>1.98</td></tr>",
                            "<tr><td>Calexico</td><td>0.99</td></tr>",
                            "</table>"
                        ]
                    }
                },
                {
                    "output_type": "execute_result",
                    "metadata": {},
                    "execution_count": 16,
                    "data": {
                        "application/vnd.dataresource+json": {
                            "schema": {
                                "fields": [
                                    {
                                        "name": "Title"
                                    },
                                    {
                                        "name": "(No column name)"
                                    }
                                ]
                            },
                            "data": [
                                {
                                    "0": "Greatest Hits",
                                    "1": "372.51"
                                },
                                {
                                    "0": "Lost, Season 2",
                                    "1": "290.18"
                                },
                                {
                                    "0": "Heroes, Season 1",
                                    "1": "238.61"
                                },
                                {
                                    "0": "Lost, Season 1",
                                    "1": "223.65"
                                },
                                {
                                    "0": "Lost, Season 3",
                                    "1": "211.80"
                                },
                                {
                                    "0": "Battlestar Galactica, Season 3",
                                    "1": "202.80"
                                },
                                {
                                    "0": "Minha Historia",
                                    "1": "185.13"
                                },
                                {
                                    "0": "The Office, Season 3",
                                    "1": "170.93"
                                },
                                {
                                    "0": "Ao Vivo [IMPORT]",
                                    "1": "161.74"
                                },
                                {
                                    "0": "Battlestar Galactica (Classic), Season 1",
                                    "1": "157.10"
                                },
                                {
                                    "0": "Unplugged",
                                    "1": "151.47"
                                },
                                {
                                    "0": "Volume Dois",
                                    "1": "139.99"
                                },
                                {
                                    "0": "My Way: The Best Of Frank Sinatra [Disc 1]",
                                    "1": "138.60"
                                },
                                {
                                    "0": "Achtung Baby",
                                    "1": "133.16"
                                },
                                {
                                    "0": "Acústico",
                                    "1": "129.76"
                                },
                                {
                                    "0": "Afrociberdelia",
                                    "1": "129.69"
                                },
                                {
                                    "0": "Up An' Atom",
                                    "1": "127.71"
                                },
                                {
                                    "0": "My Generation - The Very Best Of The Who",
                                    "1": "123.75"
                                },
                                {
                                    "0": "Instant Karma: The Amnesty International Campaign to Save Darfur",
                                    "1": "121.94"
                                },
                                {
                                    "0": "The Office, Season 2",
                                    "1": "120.16"
                                },
                                {
                                    "0": "Greatest Kiss",
                                    "1": "117.81"
                                },
                                {
                                    "0": "Acústico MTV",
                                    "1": "116.82"
                                },
                                {
                                    "0": "International Superhits",
                                    "1": "115.83"
                                },
                                {
                                    "0": "The Best Of Van Halen, Vol. I",
                                    "1": "114.90"
                                },
                                {
                                    "0": "B-Sides 1980-1990",
                                    "1": "112.18"
                                },
                                {
                                    "0": "Barulhinho Bom",
                                    "1": "110.88"
                                },
                                {
                                    "0": "Roda De Funk",
                                    "1": "110.88"
                                },
                                {
                                    "0": "Live After Death",
                                    "1": "110.88"
                                },
                                {
                                    "0": "Lulu Santos - RCA 100 Anos De Música - Álbum 01",
                                    "1": "110.88"
                                },
                                {
                                    "0": "Pure Cult: The Best Of The Cult (For Rockers, Ravers, Lovers & Sinners) [UK]",
                                    "1": "109.89"
                                },
                                {
                                    "0": "Californication",
                                    "1": "109.89"
                                },
                                {
                                    "0": "Rattle And Hum",
                                    "1": "109.00"
                                },
                                {
                                    "0": "Prenda Minha",
                                    "1": "108.90"
                                },
                                {
                                    "0": "Chronicle, Vol. 1",
                                    "1": "108.90"
                                },
                                {
                                    "0": "LOST, Season 4",
                                    "1": "108.07"
                                },
                                {
                                    "0": "Chill: Brazil (Disc 2)",
                                    "1": "107.91"
                                },
                                {
                                    "0": "Chronicle, Vol. 2",
                                    "1": "106.92"
                                },
                                {
                                    "0": "Are You Experienced?",
                                    "1": "105.93"
                                },
                                {
                                    "0": "Live On Two Legs [Live]",
                                    "1": "104.94"
                                },
                                {
                                    "0": "Sex Machine",
                                    "1": "104.94"
                                },
                                {
                                    "0": "Vinicius De Moraes",
                                    "1": "104.16"
                                },
                                {
                                    "0": "The Singles",
                                    "1": "103.95"
                                },
                                {
                                    "0": "Blood Sugar Sex Magik",
                                    "1": "103.95"
                                },
                                {
                                    "0": "Cássia Eller - Coleção Sem Limite [Disc 2]",
                                    "1": "99.99"
                                },
                                {
                                    "0": "Acústico MTV [Live]",
                                    "1": "99.99"
                                },
                                {
                                    "0": "Rotten Apples: Greatest Hits",
                                    "1": "99.99"
                                },
                                {
                                    "0": "Contraband",
                                    "1": "97.21"
                                },
                                {
                                    "0": "Chill: Brazil (Disc 1)",
                                    "1": "97.02"
                                },
                                {
                                    "0": "From The Muddy Banks Of The Wishkah [Live]",
                                    "1": "97.02"
                                },
                                {
                                    "0": "The Police Greatest Hits",
                                    "1": "97.02"
                                },
                                {
                                    "0": "Motley Crue Greatest Hits",
                                    "1": "97.02"
                                },
                                {
                                    "0": "Voodoo Lounge",
                                    "1": "97.02"
                                },
                                {
                                    "0": "Vault: Def Leppard's Greatest Hits",
                                    "1": "97.02"
                                },
                                {
                                    "0": "Mais Do Mesmo",
                                    "1": "96.03"
                                },
                                {
                                    "0": "Radio Brasil (O Som da Jovem Vanguarda) - Seleccao de Henrique Amaro",
                                    "1": "95.17"
                                },
                                {
                                    "0": "A TempestadeTempestade Ou O Livro Dos Dias",
                                    "1": "95.04"
                                },
                                {
                                    "0": "Unplugged [Live]",
                                    "1": "94.05"
                                },
                                {
                                    "0": "A-Sides",
                                    "1": "93.06"
                                },
                                {
                                    "0": "Body Count",
                                    "1": "93.06"
                                },
                                {
                                    "0": "Greatest Hits I",
                                    "1": "93.06"
                                },
                                {
                                    "0": "Judas 0: B-Sides and Rarities",
                                    "1": "92.07"
                                },
                                {
                                    "0": "Riot Act",
                                    "1": "92.07"
                                },
                                {
                                    "0": "Minha História",
                                    "1": "91.08"
                                },
                                {
                                    "0": "Greatest Hits II",
                                    "1": "91.08"
                                },
                                {
                                    "0": "House of Pain",
                                    "1": "90.18"
                                },
                                {
                                    "0": "Compositores",
                                    "1": "90.09"
                                },
                                {
                                    "0": "Da Lama Ao Caos",
                                    "1": "90.09"
                                },
                                {
                                    "0": "Meus Momentos",
                                    "1": "90.09"
                                },
                                {
                                    "0": "Quanta Gente Veio Ver (Live)",
                                    "1": "90.09"
                                },
                                {
                                    "0": "Original Soundtracks 1",
                                    "1": "90.09"
                                },
                                {
                                    "0": "Seek And Shall Find: More Of The Best (1963-1981)",
                                    "1": "90.09"
                                },
                                {
                                    "0": "The Cream Of Clapton",
                                    "1": "90.09"
                                },
                                {
                                    "0": "American Idiot",
                                    "1": "89.10"
                                },
                                {
                                    "0": "Angel Dust",
                                    "1": "89.10"
                                },
                                {
                                    "0": "Cássia Eller - Sem Limite [Disc 1]",
                                    "1": "87.12"
                                },
                                {
                                    "0": "Get Born",
                                    "1": "87.12"
                                },
                                {
                                    "0": "Minas",
                                    "1": "87.12"
                                },
                                {
                                    "0": "Van Halen III",
                                    "1": "86.26"
                                },
                                {
                                    "0": "Milton Nascimento Ao Vivo",
                                    "1": "86.13"
                                },
                                {
                                    "0": "Deixa Entrar",
                                    "1": "86.13"
                                },
                                {
                                    "0": "By The Way",
                                    "1": "86.13"
                                },
                                {
                                    "0": "Vinícius De Moraes - Sem Limite",
                                    "1": "86.13"
                                },
                                {
                                    "0": "Use Your Illusion I",
                                    "1": "84.15"
                                },
                                {
                                    "0": "The Best Of R.E.M.: The IRS Years",
                                    "1": "84.15"
                                },
                                {
                                    "0": "The Best of Ed Motta",
                                    "1": "83.16"
                                },
                                {
                                    "0": "The Colour And The Shape",
                                    "1": "83.16"
                                },
                                {
                                    "0": "The Essential Miles Davis [Disc 1]",
                                    "1": "83.16"
                                },
                                {
                                    "0": "Sambas De Enredo 2001",
                                    "1": "83.16"
                                },
                                {
                                    "0": "Supernatural",
                                    "1": "83.16"
                                },
                                {
                                    "0": "Maquinarama",
                                    "1": "83.16"
                                },
                                {
                                    "0": "No Security",
                                    "1": "83.16"
                                },
                                {
                                    "0": "Cafezinho",
                                    "1": "83.16"
                                },
                                {
                                    "0": "Carnaval 2001",
                                    "1": "83.16"
                                },
                                {
                                    "0": "BBC Sessions [Disc 1] [Live]",
                                    "1": "83.16"
                                },
                                {
                                    "0": "Axé Bahia 2001",
                                    "1": "83.16"
                                },
                                {
                                    "0": "BackBeat Soundtrack",
                                    "1": "83.16"
                                },
                                {
                                    "0": "Demorou...",
                                    "1": "83.16"
                                },
                                {
                                    "0": "Garage Inc. (Disc 2)",
                                    "1": "83.16"
                                },
                                {
                                    "0": "Jorge Ben Jor 25 Anos",
                                    "1": "83.16"
                                },
                                {
                                    "0": "Jota Quest-1995",
                                    "1": "83.16"
                                },
                                {
                                    "0": "Vs.",
                                    "1": "83.16"
                                },
                                {
                                    "0": "Serie Sem Limite (Disc 2)",
                                    "1": "82.19"
                                },
                                {
                                    "0": "Raul Seixas",
                                    "1": "82.17"
                                },
                                {
                                    "0": "Big Ones",
                                    "1": "82.17"
                                },
                                {
                                    "0": "Cidade Negra - Hits",
                                    "1": "82.17"
                                },
                                {
                                    "0": "Warner 25 Anos",
                                    "1": "82.17"
                                },
                                {
                                    "0": "Revelations",
                                    "1": "81.30"
                                },
                                {
                                    "0": "Blue Moods",
                                    "1": "81.18"
                                },
                                {
                                    "0": "Arquivo Os Paralamas Do Sucesso",
                                    "1": "81.18"
                                },
                                {
                                    "0": "Jagged Little Pill",
                                    "1": "81.18"
                                },
                                {
                                    "0": "How To Dismantle An Atomic Bomb",
                                    "1": "80.37"
                                },
                                {
                                    "0": "Pop",
                                    "1": "80.32"
                                },
                                {
                                    "0": "Use Your Illusion II",
                                    "1": "80.19"
                                },
                                {
                                    "0": "Retrospective I (1974-1980)",
                                    "1": "78.21"
                                },
                                {
                                    "0": "Tangents",
                                    "1": "78.21"
                                },
                                {
                                    "0": "Audioslave",
                                    "1": "78.21"
                                },
                                {
                                    "0": "Ace Of Spades",
                                    "1": "78.21"
                                },
                                {
                                    "0": "A Real Dead One",
                                    "1": "77.22"
                                },
                                {
                                    "0": "Beyond Good And Evil",
                                    "1": "77.22"
                                },
                                {
                                    "0": "Facelift",
                                    "1": "77.22"
                                },
                                {
                                    "0": "Djavan Ao Vivo - Vol. 1",
                                    "1": "77.22"
                                },
                                {
                                    "0": "Synkronized",
                                    "1": "77.22"
                                },
                                {
                                    "0": "Miles Ahead",
                                    "1": "77.22"
                                },
                                {
                                    "0": "Os Cães Ladram Mas A Caravana Não Pára",
                                    "1": "76.23"
                                },
                                {
                                    "0": "Elis Regina-Minha História",
                                    "1": "76.23"
                                },
                                {
                                    "0": "King For A Day Fool For A Lifetime",
                                    "1": "76.23"
                                },
                                {
                                    "0": "ReLoad",
                                    "1": "75.24"
                                },
                                {
                                    "0": "Load",
                                    "1": "74.25"
                                },
                                {
                                    "0": "New Adventures In Hi-Fi",
                                    "1": "73.26"
                                },
                                {
                                    "0": "Pearl Jam",
                                    "1": "73.26"
                                },
                                {
                                    "0": "In Your Honor [Disc 2]",
                                    "1": "73.26"
                                },
                                {
                                    "0": "Brave New World",
                                    "1": "73.26"
                                },
                                {
                                    "0": "Chemical Wedding",
                                    "1": "72.27"
                                },
                                {
                                    "0": "News Of The World",
                                    "1": "72.27"
                                },
                                {
                                    "0": "Tribute",
                                    "1": "72.27"
                                },
                                {
                                    "0": "Van Halen",
                                    "1": "71.31"
                                },
                                {
                                    "0": "All That You Can't Leave Behind",
                                    "1": "69.53"
                                },
                                {
                                    "0": "Alcohol Fueled Brewtality Live! [Disc 1]",
                                    "1": "69.30"
                                },
                                {
                                    "0": "As Canções de Eu Tu Eles",
                                    "1": "69.30"
                                },
                                {
                                    "0": "Hot Rocks, 1964-1971 (Disc 1)",
                                    "1": "69.30"
                                },
                                {
                                    "0": "Killers",
                                    "1": "69.30"
                                },
                                {
                                    "0": "Fear Of The Dark",
                                    "1": "69.30"
                                },
                                {
                                    "0": "The Battle Rages On",
                                    "1": "69.30"
                                },
                                {
                                    "0": "Misplaced Childhood",
                                    "1": "69.30"
                                },
                                {
                                    "0": "Lulu Santos - RCA 100 Anos De Música - Álbum 02",
                                    "1": "69.30"
                                },
                                {
                                    "0": "Out Of Exile",
                                    "1": "69.30"
                                },
                                {
                                    "0": "Nevermind",
                                    "1": "69.30"
                                },
                                {
                                    "0": "Vozes do MPB",
                                    "1": "69.30"
                                },
                                {
                                    "0": "Olodum",
                                    "1": "68.31"
                                },
                                {
                                    "0": "Living After Midnight",
                                    "1": "68.31"
                                },
                                {
                                    "0": "Mezmerize",
                                    "1": "67.32"
                                },
                                {
                                    "0": "UB40 The Best Of - Volume Two [UK]",
                                    "1": "67.32"
                                },
                                {
                                    "0": "Into The Light",
                                    "1": "67.32"
                                },
                                {
                                    "0": "Arquivo II",
                                    "1": "67.32"
                                },
                                {
                                    "0": "Walking Into Clarksdale",
                                    "1": "67.32"
                                },
                                {
                                    "0": "Back to Black",
                                    "1": "66.37"
                                },
                                {
                                    "0": "Album Of The Year",
                                    "1": "66.33"
                                },
                                {
                                    "0": "Led Zeppelin III",
                                    "1": "66.33"
                                },
                                {
                                    "0": "Zooropa",
                                    "1": "66.33"
                                },
                                {
                                    "0": "Carry On",
                                    "1": "64.44"
                                },
                                {
                                    "0": "Temple of the Dog",
                                    "1": "64.44"
                                },
                                {
                                    "0": "Serie Sem Limite (Disc 1)",
                                    "1": "64.35"
                                },
                                {
                                    "0": "The Real Thing",
                                    "1": "64.35"
                                },
                                {
                                    "0": "Purpendicular",
                                    "1": "64.35"
                                },
                                {
                                    "0": "Diver Down",
                                    "1": "64.35"
                                },
                                {
                                    "0": "Djavan Ao Vivo - Vol. 02",
                                    "1": "64.35"
                                },
                                {
                                    "0": "Dance Of Death",
                                    "1": "64.35"
                                },
                                {
                                    "0": "War",
                                    "1": "63.36"
                                },
                                {
                                    "0": "The X Factor",
                                    "1": "62.37"
                                },
                                {
                                    "0": "Live [Disc 2]",
                                    "1": "61.38"
                                },
                                {
                                    "0": "For Those About To Rock We Salute You",
                                    "1": "60.39"
                                },
                                {
                                    "0": "Heart of the Night",
                                    "1": "60.39"
                                },
                                {
                                    "0": "Green",
                                    "1": "59.40"
                                },
                                {
                                    "0": "Knocking at Your Back Door: The Best Of Deep Purple in the 80's",
                                    "1": "59.40"
                                },
                                {
                                    "0": "Na Pista",
                                    "1": "59.40"
                                },
                                {
                                    "0": "One By One",
                                    "1": "59.40"
                                },
                                {
                                    "0": "The Best Of Men At Work",
                                    "1": "59.40"
                                },
                                {
                                    "0": "The Best Of 1980-1990",
                                    "1": "59.40"
                                },
                                {
                                    "0": "St. Anger",
                                    "1": "58.41"
                                },
                                {
                                    "0": "Out Of Time",
                                    "1": "58.41"
                                },
                                {
                                    "0": "Kill 'Em All",
                                    "1": "58.41"
                                },
                                {
                                    "0": "Emergency On Planet Earth",
                                    "1": "58.41"
                                },
                                {
                                    "0": "...And Justice For All",
                                    "1": "58.41"
                                },
                                {
                                    "0": "A Matter of Life and Death",
                                    "1": "58.41"
                                },
                                {
                                    "0": "Appetite for Destruction",
                                    "1": "58.41"
                                },
                                {
                                    "0": "Speak of the Devil",
                                    "1": "57.46"
                                },
                                {
                                    "0": "Transmission",
                                    "1": "57.42"
                                },
                                {
                                    "0": "No Prayer For The Dying",
                                    "1": "57.42"
                                },
                                {
                                    "0": "Faceless",
                                    "1": "57.42"
                                },
                                {
                                    "0": "Cesta Básica",
                                    "1": "56.43"
                                },
                                {
                                    "0": "Virtual XI",
                                    "1": "56.43"
                                },
                                {
                                    "0": "Bongo Fury",
                                    "1": "55.44"
                                },
                                {
                                    "0": "BBC Sessions [Disc 2] [Live]",
                                    "1": "55.44"
                                },
                                {
                                    "0": "Dark Side Of The Moon",
                                    "1": "55.44"
                                },
                                {
                                    "0": "Core",
                                    "1": "55.44"
                                },
                                {
                                    "0": "Iron Maiden",
                                    "1": "55.44"
                                },
                                {
                                    "0": "Outbreak",
                                    "1": "55.44"
                                },
                                {
                                    "0": "O Samba Poconé",
                                    "1": "55.44"
                                },
                                {
                                    "0": "Live At Donington 1992 (Disc 1)",
                                    "1": "55.44"
                                },
                                {
                                    "0": "The Essential Miles Davis [Disc 2]",
                                    "1": "55.44"
                                },
                                {
                                    "0": "Stormbringer",
                                    "1": "55.44"
                                },
                                {
                                    "0": "Surfing with the Alien (Remastered)",
                                    "1": "55.44"
                                },
                                {
                                    "0": "The Best Of Billy Cobham",
                                    "1": "55.44"
                                },
                                {
                                    "0": "Ten",
                                    "1": "55.44"
                                },
                                {
                                    "0": "Seventh Son of a Seventh Son",
                                    "1": "55.44"
                                },
                                {
                                    "0": "Slaves And Masters",
                                    "1": "55.44"
                                },
                                {
                                    "0": "Rock In Rio [CD1]",
                                    "1": "55.44"
                                },
                                {
                                    "0": "The Beast Live",
                                    "1": "54.45"
                                },
                                {
                                    "0": "The Return Of The Space Cowboy",
                                    "1": "54.45"
                                },
                                {
                                    "0": "In Your Honor [Disc 1]",
                                    "1": "54.45"
                                },
                                {
                                    "0": "Come Taste The Band",
                                    "1": "54.45"
                                },
                                {
                                    "0": "A Real Live One",
                                    "1": "54.45"
                                },
                                {
                                    "0": "Live [Disc 1]",
                                    "1": "53.46"
                                },
                                {
                                    "0": "Led Zeppelin II",
                                    "1": "52.47"
                                },
                                {
                                    "0": "In Step",
                                    "1": "52.47"
                                },
                                {
                                    "0": "Black Album",
                                    "1": "52.47"
                                },
                                {
                                    "0": "The Doors",
                                    "1": "50.49"
                                },
                                {
                                    "0": "Machine Head",
                                    "1": "50.49"
                                },
                                {
                                    "0": "MK III The Final Concerts [Disc 1]",
                                    "1": "50.49"
                                },
                                {
                                    "0": "Morning Dance",
                                    "1": "50.49"
                                },
                                {
                                    "0": "In Through The Out Door",
                                    "1": "49.50"
                                },
                                {
                                    "0": "20th Century Masters - The Millennium Collection: The Best of Scorpions",
                                    "1": "48.55"
                                },
                                {
                                    "0": "Black Sabbath Vol. 4 (Remaster)",
                                    "1": "48.51"
                                },
                                {
                                    "0": "Powerslave",
                                    "1": "48.51"
                                },
                                {
                                    "0": "Master Of Puppets",
                                    "1": "47.52"
                                },
                                {
                                    "0": "Ride The Lightning",
                                    "1": "47.52"
                                },
                                {
                                    "0": "Let There Be Rock",
                                    "1": "47.52"
                                },
                                {
                                    "0": "Live At Donington 1992 (Disc 2)",
                                    "1": "46.53"
                                },
                                {
                                    "0": "Plays Metallica By Four Cellos",
                                    "1": "45.54"
                                },
                                {
                                    "0": "Rock In Rio [CD2]",
                                    "1": "45.54"
                                },
                                {
                                    "0": "The Number of The Beast",
                                    "1": "45.54"
                                },
                                {
                                    "0": "Led Zeppelin I",
                                    "1": "45.54"
                                },
                                {
                                    "0": "Fireball",
                                    "1": "45.54"
                                },
                                {
                                    "0": "Garage Inc. (Disc 1)",
                                    "1": "44.55"
                                },
                                {
                                    "0": "The Best Of Buddy Guy - The Millenium Collection",
                                    "1": "43.56"
                                },
                                {
                                    "0": "Physical Graffiti [Disc 2]",
                                    "1": "43.56"
                                },
                                {
                                    "0": "Piece Of Mind",
                                    "1": "43.56"
                                },
                                {
                                    "0": "Santana - As Years Go By",
                                    "1": "41.58"
                                },
                                {
                                    "0": "Santana Live",
                                    "1": "41.58"
                                },
                                {
                                    "0": "Alcohol Fueled Brewtality Live! [Disc 2]",
                                    "1": "41.58"
                                },
                                {
                                    "0": "Coda",
                                    "1": "39.60"
                                },
                                {
                                    "0": "Houses Of The Holy",
                                    "1": "39.60"
                                },
                                {
                                    "0": "[1997] Black Light Syndrome",
                                    "1": "38.61"
                                },
                                {
                                    "0": "Presence",
                                    "1": "38.61"
                                },
                                {
                                    "0": "The Office, Season 1",
                                    "1": "37.71"
                                },
                                {
                                    "0": "IV",
                                    "1": "34.65"
                                },
                                {
                                    "0": "Frank",
                                    "1": "34.65"
                                },
                                {
                                    "0": "Deep Purple In Rock",
                                    "1": "31.68"
                                },
                                {
                                    "0": "The Song Remains The Same (Disc 1)",
                                    "1": "31.68"
                                },
                                {
                                    "0": "Somewhere in Time",
                                    "1": "28.71"
                                },
                                {
                                    "0": "Black Sabbath",
                                    "1": "27.72"
                                },
                                {
                                    "0": "Physical Graffiti [Disc 1]",
                                    "1": "22.77"
                                },
                                {
                                    "0": "Berlioz: Symphonie Fantastique",
                                    "1": "19.82"
                                },
                                {
                                    "0": "No More Tears (Remastered)",
                                    "1": "18.81"
                                },
                                {
                                    "0": "Quanta Gente Veio ver--Bônus De Carnaval",
                                    "1": "17.82"
                                },
                                {
                                    "0": "The Song Remains The Same (Disc 2)",
                                    "1": "17.82"
                                },
                                {
                                    "0": "Bach: The Cello Suites",
                                    "1": "16.86"
                                },
                                {
                                    "0": "Every Kind of Light",
                                    "1": "16.86"
                                },
                                {
                                    "0": "Wagner: Favourite Overtures",
                                    "1": "16.86"
                                },
                                {
                                    "0": "Scheherazade",
                                    "1": "16.85"
                                },
                                {
                                    "0": "Restless and Wild",
                                    "1": "16.83"
                                },
                                {
                                    "0": "Pachelbel: Canon & Gigue",
                                    "1": "15.86"
                                },
                                {
                                    "0": "Muso Ko",
                                    "1": "15.86"
                                },
                                {
                                    "0": "Fauré: Requiem, Ravel: Pavane & Others",
                                    "1": "15.86"
                                },
                                {
                                    "0": "Duos II",
                                    "1": "15.86"
                                },
                                {
                                    "0": "Holst: The Planets, Op. 32 & Vaughan Williams: Fantasies",
                                    "1": "15.86"
                                },
                                {
                                    "0": "Handel: The Messiah (Highlights)",
                                    "1": "15.86"
                                },
                                {
                                    "0": "Haydn: Symphonies 99 - 104",
                                    "1": "15.86"
                                },
                                {
                                    "0": "Beethoven Piano Sonatas: Moonlight & Pastorale",
                                    "1": "15.86"
                                },
                                {
                                    "0": "Adams, John: The Chairman Dances",
                                    "1": "15.86"
                                },
                                {
                                    "0": "Aquaman",
                                    "1": "14.89"
                                },
                                {
                                    "0": "Schubert: The Late String Quartets & String Quintet (3 CD's)",
                                    "1": "14.85"
                                },
                                {
                                    "0": "Sozinho Remix Ao Vivo",
                                    "1": "14.85"
                                },
                                {
                                    "0": "The Final Concerts (Disc 2)",
                                    "1": "13.86"
                                },
                                {
                                    "0": "Purcell: Music for the Queen Mary",
                                    "1": "12.87"
                                },
                                {
                                    "0": "Diary of a Madman (Remastered)",
                                    "1": "12.87"
                                },
                                {
                                    "0": "Bach: Orchestral Suites Nos. 1 - 4",
                                    "1": "10.89"
                                },
                                {
                                    "0": "Balls to the Wall",
                                    "1": "10.89"
                                },
                                {
                                    "0": "Respighi:Pines of Rome",
                                    "1": "8.91"
                                },
                                {
                                    "0": "Nielsen: The Six Symphonies",
                                    "1": "8.91"
                                },
                                {
                                    "0": "Mozart: Symphonies Nos. 40 & 41",
                                    "1": "5.94"
                                },
                                {
                                    "0": "Mendelssohn: A Midsummer Night's Dream",
                                    "1": "5.94"
                                },
                                {
                                    "0": "Szymanowski: Piano Works, Vol. 1",
                                    "1": "5.94"
                                },
                                {
                                    "0": "Bark at the Moon (Remastered)",
                                    "1": "5.94"
                                },
                                {
                                    "0": "Górecki: Symphony No. 3",
                                    "1": "5.94"
                                },
                                {
                                    "0": "Grieg: Peer Gynt Suites & Sibelius: Pelléas et Mélisande",
                                    "1": "5.94"
                                },
                                {
                                    "0": "Liszt - 12 Études D'Execution Transcendante",
                                    "1": "5.94"
                                },
                                {
                                    "0": "Weill: The Seven Deadly Sins",
                                    "1": "5.94"
                                },
                                {
                                    "0": "J.S. Bach: Chaconne, Suite in E Minor, Partita in E Major & Prelude, Fugue and Allegro",
                                    "1": "3.96"
                                },
                                {
                                    "0": "English Renaissance",
                                    "1": "3.96"
                                },
                                {
                                    "0": "Elgar: Cello Concerto & Vaughan Williams: Fantasias",
                                    "1": "3.96"
                                },
                                {
                                    "0": "Blizzard of Ozz",
                                    "1": "3.96"
                                },
                                {
                                    "0": "Tchaikovsky: 1812 Festival Overture, Op.49, Capriccio Italien & Beethoven: Wellington's Victory",
                                    "1": "3.96"
                                },
                                {
                                    "0": "Purcell: The Fairy Queen",
                                    "1": "3.96"
                                },
                                {
                                    "0": "Prokofiev: Romeo & Juliet",
                                    "1": "3.96"
                                },
                                {
                                    "0": "Un-Led-Ed",
                                    "1": "2.98"
                                },
                                {
                                    "0": "The World of Classical Favourites",
                                    "1": "1.98"
                                },
                                {
                                    "0": "South American Getaway",
                                    "1": "1.98"
                                },
                                {
                                    "0": "Sibelius: Finlandia",
                                    "1": "1.98"
                                },
                                {
                                    "0": "Beethoven: Symphony No. 6 'Pastoral' Etc.",
                                    "1": "1.98"
                                },
                                {
                                    "0": "Bartok: Violin & Viola Concertos",
                                    "1": "1.98"
                                },
                                {
                                    "0": "Bach: The Brandenburg Concertos",
                                    "1": "1.98"
                                },
                                {
                                    "0": "Chopin: Piano Concertos Nos. 1 & 2",
                                    "1": "1.98"
                                },
                                {
                                    "0": "Carried to Dust (Bonus Track Version)",
                                    "1": "0.99"
                                }
                            ]
                        },
                        "text/html": [
                            "<table>",
                            "<tr><th>Title</th><th>(No column name)</th></tr>",
                            "<tr><td>Greatest Hits</td><td>372.51</td></tr>",
                            "<tr><td>Lost, Season 2</td><td>290.18</td></tr>",
                            "<tr><td>Heroes, Season 1</td><td>238.61</td></tr>",
                            "<tr><td>Lost, Season 1</td><td>223.65</td></tr>",
                            "<tr><td>Lost, Season 3</td><td>211.80</td></tr>",
                            "<tr><td>Battlestar Galactica, Season 3</td><td>202.80</td></tr>",
                            "<tr><td>Minha Historia</td><td>185.13</td></tr>",
                            "<tr><td>The Office, Season 3</td><td>170.93</td></tr>",
                            "<tr><td>Ao Vivo [IMPORT]</td><td>161.74</td></tr>",
                            "<tr><td>Battlestar Galactica (Classic), Season 1</td><td>157.10</td></tr>",
                            "<tr><td>Unplugged</td><td>151.47</td></tr>",
                            "<tr><td>Volume Dois</td><td>139.99</td></tr>",
                            "<tr><td>My Way: The Best Of Frank Sinatra [Disc 1]</td><td>138.60</td></tr>",
                            "<tr><td>Achtung Baby</td><td>133.16</td></tr>",
                            "<tr><td>Acústico</td><td>129.76</td></tr>",
                            "<tr><td>Afrociberdelia</td><td>129.69</td></tr>",
                            "<tr><td>Up An' Atom</td><td>127.71</td></tr>",
                            "<tr><td>My Generation - The Very Best Of The Who</td><td>123.75</td></tr>",
                            "<tr><td>Instant Karma: The Amnesty International Campaign to Save Darfur</td><td>121.94</td></tr>",
                            "<tr><td>The Office, Season 2</td><td>120.16</td></tr>",
                            "<tr><td>Greatest Kiss</td><td>117.81</td></tr>",
                            "<tr><td>Acústico MTV</td><td>116.82</td></tr>",
                            "<tr><td>International Superhits</td><td>115.83</td></tr>",
                            "<tr><td>The Best Of Van Halen, Vol. I</td><td>114.90</td></tr>",
                            "<tr><td>B-Sides 1980-1990</td><td>112.18</td></tr>",
                            "<tr><td>Barulhinho Bom</td><td>110.88</td></tr>",
                            "<tr><td>Roda De Funk</td><td>110.88</td></tr>",
                            "<tr><td>Live After Death</td><td>110.88</td></tr>",
                            "<tr><td>Lulu Santos - RCA 100 Anos De Música - Álbum 01</td><td>110.88</td></tr>",
                            "<tr><td>Pure Cult: The Best Of The Cult (For Rockers, Ravers, Lovers &amp; Sinners) [UK]</td><td>109.89</td></tr>",
                            "<tr><td>Californication</td><td>109.89</td></tr>",
                            "<tr><td>Rattle And Hum</td><td>109.00</td></tr>",
                            "<tr><td>Prenda Minha</td><td>108.90</td></tr>",
                            "<tr><td>Chronicle, Vol. 1</td><td>108.90</td></tr>",
                            "<tr><td>LOST, Season 4</td><td>108.07</td></tr>",
                            "<tr><td>Chill: Brazil (Disc 2)</td><td>107.91</td></tr>",
                            "<tr><td>Chronicle, Vol. 2</td><td>106.92</td></tr>",
                            "<tr><td>Are You Experienced?</td><td>105.93</td></tr>",
                            "<tr><td>Live On Two Legs [Live]</td><td>104.94</td></tr>",
                            "<tr><td>Sex Machine</td><td>104.94</td></tr>",
                            "<tr><td>Vinicius De Moraes</td><td>104.16</td></tr>",
                            "<tr><td>The Singles</td><td>103.95</td></tr>",
                            "<tr><td>Blood Sugar Sex Magik</td><td>103.95</td></tr>",
                            "<tr><td>Cássia Eller - Coleção Sem Limite [Disc 2]</td><td>99.99</td></tr>",
                            "<tr><td>Acústico MTV [Live]</td><td>99.99</td></tr>",
                            "<tr><td>Rotten Apples: Greatest Hits</td><td>99.99</td></tr>",
                            "<tr><td>Contraband</td><td>97.21</td></tr>",
                            "<tr><td>Chill: Brazil (Disc 1)</td><td>97.02</td></tr>",
                            "<tr><td>From The Muddy Banks Of The Wishkah [Live]</td><td>97.02</td></tr>",
                            "<tr><td>The Police Greatest Hits</td><td>97.02</td></tr>",
                            "<tr><td>Motley Crue Greatest Hits</td><td>97.02</td></tr>",
                            "<tr><td>Voodoo Lounge</td><td>97.02</td></tr>",
                            "<tr><td>Vault: Def Leppard's Greatest Hits</td><td>97.02</td></tr>",
                            "<tr><td>Mais Do Mesmo</td><td>96.03</td></tr>",
                            "<tr><td>Radio Brasil (O Som da Jovem Vanguarda) - Seleccao de Henrique Amaro</td><td>95.17</td></tr>",
                            "<tr><td>A TempestadeTempestade Ou O Livro Dos Dias</td><td>95.04</td></tr>",
                            "<tr><td>Unplugged [Live]</td><td>94.05</td></tr>",
                            "<tr><td>A-Sides</td><td>93.06</td></tr>",
                            "<tr><td>Body Count</td><td>93.06</td></tr>",
                            "<tr><td>Greatest Hits I</td><td>93.06</td></tr>",
                            "<tr><td>Judas 0: B-Sides and Rarities</td><td>92.07</td></tr>",
                            "<tr><td>Riot Act</td><td>92.07</td></tr>",
                            "<tr><td>Minha História</td><td>91.08</td></tr>",
                            "<tr><td>Greatest Hits II</td><td>91.08</td></tr>",
                            "<tr><td>House of Pain</td><td>90.18</td></tr>",
                            "<tr><td>Compositores</td><td>90.09</td></tr>",
                            "<tr><td>Da Lama Ao Caos</td><td>90.09</td></tr>",
                            "<tr><td>Meus Momentos</td><td>90.09</td></tr>",
                            "<tr><td>Quanta Gente Veio Ver (Live)</td><td>90.09</td></tr>",
                            "<tr><td>Original Soundtracks 1</td><td>90.09</td></tr>",
                            "<tr><td>Seek And Shall Find: More Of The Best (1963-1981)</td><td>90.09</td></tr>",
                            "<tr><td>The Cream Of Clapton</td><td>90.09</td></tr>",
                            "<tr><td>American Idiot</td><td>89.10</td></tr>",
                            "<tr><td>Angel Dust</td><td>89.10</td></tr>",
                            "<tr><td>Cássia Eller - Sem Limite [Disc 1]</td><td>87.12</td></tr>",
                            "<tr><td>Get Born</td><td>87.12</td></tr>",
                            "<tr><td>Minas</td><td>87.12</td></tr>",
                            "<tr><td>Van Halen III</td><td>86.26</td></tr>",
                            "<tr><td>Milton Nascimento Ao Vivo</td><td>86.13</td></tr>",
                            "<tr><td>Deixa Entrar</td><td>86.13</td></tr>",
                            "<tr><td>By The Way</td><td>86.13</td></tr>",
                            "<tr><td>Vinícius De Moraes - Sem Limite</td><td>86.13</td></tr>",
                            "<tr><td>Use Your Illusion I</td><td>84.15</td></tr>",
                            "<tr><td>The Best Of R.E.M.: The IRS Years</td><td>84.15</td></tr>",
                            "<tr><td>The Best of Ed Motta</td><td>83.16</td></tr>",
                            "<tr><td>The Colour And The Shape</td><td>83.16</td></tr>",
                            "<tr><td>The Essential Miles Davis [Disc 1]</td><td>83.16</td></tr>",
                            "<tr><td>Sambas De Enredo 2001</td><td>83.16</td></tr>",
                            "<tr><td>Supernatural</td><td>83.16</td></tr>",
                            "<tr><td>Maquinarama</td><td>83.16</td></tr>",
                            "<tr><td>No Security</td><td>83.16</td></tr>",
                            "<tr><td>Cafezinho</td><td>83.16</td></tr>",
                            "<tr><td>Carnaval 2001</td><td>83.16</td></tr>",
                            "<tr><td>BBC Sessions [Disc 1] [Live]</td><td>83.16</td></tr>",
                            "<tr><td>Axé Bahia 2001</td><td>83.16</td></tr>",
                            "<tr><td>BackBeat Soundtrack</td><td>83.16</td></tr>",
                            "<tr><td>Demorou...</td><td>83.16</td></tr>",
                            "<tr><td>Garage Inc. (Disc 2)</td><td>83.16</td></tr>",
                            "<tr><td>Jorge Ben Jor 25 Anos</td><td>83.16</td></tr>",
                            "<tr><td>Jota Quest-1995</td><td>83.16</td></tr>",
                            "<tr><td>Vs.</td><td>83.16</td></tr>",
                            "<tr><td>Serie Sem Limite (Disc 2)</td><td>82.19</td></tr>",
                            "<tr><td>Raul Seixas</td><td>82.17</td></tr>",
                            "<tr><td>Big Ones</td><td>82.17</td></tr>",
                            "<tr><td>Cidade Negra - Hits</td><td>82.17</td></tr>",
                            "<tr><td>Warner 25 Anos</td><td>82.17</td></tr>",
                            "<tr><td>Revelations</td><td>81.30</td></tr>",
                            "<tr><td>Blue Moods</td><td>81.18</td></tr>",
                            "<tr><td>Arquivo Os Paralamas Do Sucesso</td><td>81.18</td></tr>",
                            "<tr><td>Jagged Little Pill</td><td>81.18</td></tr>",
                            "<tr><td>How To Dismantle An Atomic Bomb</td><td>80.37</td></tr>",
                            "<tr><td>Pop</td><td>80.32</td></tr>",
                            "<tr><td>Use Your Illusion II</td><td>80.19</td></tr>",
                            "<tr><td>Retrospective I (1974-1980)</td><td>78.21</td></tr>",
                            "<tr><td>Tangents</td><td>78.21</td></tr>",
                            "<tr><td>Audioslave</td><td>78.21</td></tr>",
                            "<tr><td>Ace Of Spades</td><td>78.21</td></tr>",
                            "<tr><td>A Real Dead One</td><td>77.22</td></tr>",
                            "<tr><td>Beyond Good And Evil</td><td>77.22</td></tr>",
                            "<tr><td>Facelift</td><td>77.22</td></tr>",
                            "<tr><td>Djavan Ao Vivo - Vol. 1</td><td>77.22</td></tr>",
                            "<tr><td>Synkronized</td><td>77.22</td></tr>",
                            "<tr><td>Miles Ahead</td><td>77.22</td></tr>",
                            "<tr><td>Os Cães Ladram Mas A Caravana Não Pára</td><td>76.23</td></tr>",
                            "<tr><td>Elis Regina-Minha História</td><td>76.23</td></tr>",
                            "<tr><td>King For A Day Fool For A Lifetime</td><td>76.23</td></tr>",
                            "<tr><td>ReLoad</td><td>75.24</td></tr>",
                            "<tr><td>Load</td><td>74.25</td></tr>",
                            "<tr><td>New Adventures In Hi-Fi</td><td>73.26</td></tr>",
                            "<tr><td>Pearl Jam</td><td>73.26</td></tr>",
                            "<tr><td>In Your Honor [Disc 2]</td><td>73.26</td></tr>",
                            "<tr><td>Brave New World</td><td>73.26</td></tr>",
                            "<tr><td>Chemical Wedding</td><td>72.27</td></tr>",
                            "<tr><td>News Of The World</td><td>72.27</td></tr>",
                            "<tr><td>Tribute</td><td>72.27</td></tr>",
                            "<tr><td>Van Halen</td><td>71.31</td></tr>",
                            "<tr><td>All That You Can't Leave Behind</td><td>69.53</td></tr>",
                            "<tr><td>Alcohol Fueled Brewtality Live! [Disc 1]</td><td>69.30</td></tr>",
                            "<tr><td>As Canções de Eu Tu Eles</td><td>69.30</td></tr>",
                            "<tr><td>Hot Rocks, 1964-1971 (Disc 1)</td><td>69.30</td></tr>",
                            "<tr><td>Killers</td><td>69.30</td></tr>",
                            "<tr><td>Fear Of The Dark</td><td>69.30</td></tr>",
                            "<tr><td>The Battle Rages On</td><td>69.30</td></tr>",
                            "<tr><td>Misplaced Childhood</td><td>69.30</td></tr>",
                            "<tr><td>Lulu Santos - RCA 100 Anos De Música - Álbum 02</td><td>69.30</td></tr>",
                            "<tr><td>Out Of Exile</td><td>69.30</td></tr>",
                            "<tr><td>Nevermind</td><td>69.30</td></tr>",
                            "<tr><td>Vozes do MPB</td><td>69.30</td></tr>",
                            "<tr><td>Olodum</td><td>68.31</td></tr>",
                            "<tr><td>Living After Midnight</td><td>68.31</td></tr>",
                            "<tr><td>Mezmerize</td><td>67.32</td></tr>",
                            "<tr><td>UB40 The Best Of - Volume Two [UK]</td><td>67.32</td></tr>",
                            "<tr><td>Into The Light</td><td>67.32</td></tr>",
                            "<tr><td>Arquivo II</td><td>67.32</td></tr>",
                            "<tr><td>Walking Into Clarksdale</td><td>67.32</td></tr>",
                            "<tr><td>Back to Black</td><td>66.37</td></tr>",
                            "<tr><td>Album Of The Year</td><td>66.33</td></tr>",
                            "<tr><td>Led Zeppelin III</td><td>66.33</td></tr>",
                            "<tr><td>Zooropa</td><td>66.33</td></tr>",
                            "<tr><td>Carry On</td><td>64.44</td></tr>",
                            "<tr><td>Temple of the Dog</td><td>64.44</td></tr>",
                            "<tr><td>Serie Sem Limite (Disc 1)</td><td>64.35</td></tr>",
                            "<tr><td>The Real Thing</td><td>64.35</td></tr>",
                            "<tr><td>Purpendicular</td><td>64.35</td></tr>",
                            "<tr><td>Diver Down</td><td>64.35</td></tr>",
                            "<tr><td>Djavan Ao Vivo - Vol. 02</td><td>64.35</td></tr>",
                            "<tr><td>Dance Of Death</td><td>64.35</td></tr>",
                            "<tr><td>War</td><td>63.36</td></tr>",
                            "<tr><td>The X Factor</td><td>62.37</td></tr>",
                            "<tr><td>Live [Disc 2]</td><td>61.38</td></tr>",
                            "<tr><td>For Those About To Rock We Salute You</td><td>60.39</td></tr>",
                            "<tr><td>Heart of the Night</td><td>60.39</td></tr>",
                            "<tr><td>Green</td><td>59.40</td></tr>",
                            "<tr><td>Knocking at Your Back Door: The Best Of Deep Purple in the 80's</td><td>59.40</td></tr>",
                            "<tr><td>Na Pista</td><td>59.40</td></tr>",
                            "<tr><td>One By One</td><td>59.40</td></tr>",
                            "<tr><td>The Best Of Men At Work</td><td>59.40</td></tr>",
                            "<tr><td>The Best Of 1980-1990</td><td>59.40</td></tr>",
                            "<tr><td>St. Anger</td><td>58.41</td></tr>",
                            "<tr><td>Out Of Time</td><td>58.41</td></tr>",
                            "<tr><td>Kill 'Em All</td><td>58.41</td></tr>",
                            "<tr><td>Emergency On Planet Earth</td><td>58.41</td></tr>",
                            "<tr><td>...And Justice For All</td><td>58.41</td></tr>",
                            "<tr><td>A Matter of Life and Death</td><td>58.41</td></tr>",
                            "<tr><td>Appetite for Destruction</td><td>58.41</td></tr>",
                            "<tr><td>Speak of the Devil</td><td>57.46</td></tr>",
                            "<tr><td>Transmission</td><td>57.42</td></tr>",
                            "<tr><td>No Prayer For The Dying</td><td>57.42</td></tr>",
                            "<tr><td>Faceless</td><td>57.42</td></tr>",
                            "<tr><td>Cesta Básica</td><td>56.43</td></tr>",
                            "<tr><td>Virtual XI</td><td>56.43</td></tr>",
                            "<tr><td>Bongo Fury</td><td>55.44</td></tr>",
                            "<tr><td>BBC Sessions [Disc 2] [Live]</td><td>55.44</td></tr>",
                            "<tr><td>Dark Side Of The Moon</td><td>55.44</td></tr>",
                            "<tr><td>Core</td><td>55.44</td></tr>",
                            "<tr><td>Iron Maiden</td><td>55.44</td></tr>",
                            "<tr><td>Outbreak</td><td>55.44</td></tr>",
                            "<tr><td>O Samba Poconé</td><td>55.44</td></tr>",
                            "<tr><td>Live At Donington 1992 (Disc 1)</td><td>55.44</td></tr>",
                            "<tr><td>The Essential Miles Davis [Disc 2]</td><td>55.44</td></tr>",
                            "<tr><td>Stormbringer</td><td>55.44</td></tr>",
                            "<tr><td>Surfing with the Alien (Remastered)</td><td>55.44</td></tr>",
                            "<tr><td>The Best Of Billy Cobham</td><td>55.44</td></tr>",
                            "<tr><td>Ten</td><td>55.44</td></tr>",
                            "<tr><td>Seventh Son of a Seventh Son</td><td>55.44</td></tr>",
                            "<tr><td>Slaves And Masters</td><td>55.44</td></tr>",
                            "<tr><td>Rock In Rio [CD1]</td><td>55.44</td></tr>",
                            "<tr><td>The Beast Live</td><td>54.45</td></tr>",
                            "<tr><td>The Return Of The Space Cowboy</td><td>54.45</td></tr>",
                            "<tr><td>In Your Honor [Disc 1]</td><td>54.45</td></tr>",
                            "<tr><td>Come Taste The Band</td><td>54.45</td></tr>",
                            "<tr><td>A Real Live One</td><td>54.45</td></tr>",
                            "<tr><td>Live [Disc 1]</td><td>53.46</td></tr>",
                            "<tr><td>Led Zeppelin II</td><td>52.47</td></tr>",
                            "<tr><td>In Step</td><td>52.47</td></tr>",
                            "<tr><td>Black Album</td><td>52.47</td></tr>",
                            "<tr><td>The Doors</td><td>50.49</td></tr>",
                            "<tr><td>Machine Head</td><td>50.49</td></tr>",
                            "<tr><td>MK III The Final Concerts [Disc 1]</td><td>50.49</td></tr>",
                            "<tr><td>Morning Dance</td><td>50.49</td></tr>",
                            "<tr><td>In Through The Out Door</td><td>49.50</td></tr>",
                            "<tr><td>20th Century Masters - The Millennium Collection: The Best of Scorpions</td><td>48.55</td></tr>",
                            "<tr><td>Black Sabbath Vol. 4 (Remaster)</td><td>48.51</td></tr>",
                            "<tr><td>Powerslave</td><td>48.51</td></tr>",
                            "<tr><td>Master Of Puppets</td><td>47.52</td></tr>",
                            "<tr><td>Ride The Lightning</td><td>47.52</td></tr>",
                            "<tr><td>Let There Be Rock</td><td>47.52</td></tr>",
                            "<tr><td>Live At Donington 1992 (Disc 2)</td><td>46.53</td></tr>",
                            "<tr><td>Plays Metallica By Four Cellos</td><td>45.54</td></tr>",
                            "<tr><td>Rock In Rio [CD2]</td><td>45.54</td></tr>",
                            "<tr><td>The Number of The Beast</td><td>45.54</td></tr>",
                            "<tr><td>Led Zeppelin I</td><td>45.54</td></tr>",
                            "<tr><td>Fireball</td><td>45.54</td></tr>",
                            "<tr><td>Garage Inc. (Disc 1)</td><td>44.55</td></tr>",
                            "<tr><td>The Best Of Buddy Guy - The Millenium Collection</td><td>43.56</td></tr>",
                            "<tr><td>Physical Graffiti [Disc 2]</td><td>43.56</td></tr>",
                            "<tr><td>Piece Of Mind</td><td>43.56</td></tr>",
                            "<tr><td>Santana - As Years Go By</td><td>41.58</td></tr>",
                            "<tr><td>Santana Live</td><td>41.58</td></tr>",
                            "<tr><td>Alcohol Fueled Brewtality Live! [Disc 2]</td><td>41.58</td></tr>",
                            "<tr><td>Coda</td><td>39.60</td></tr>",
                            "<tr><td>Houses Of The Holy</td><td>39.60</td></tr>",
                            "<tr><td>[1997] Black Light Syndrome</td><td>38.61</td></tr>",
                            "<tr><td>Presence</td><td>38.61</td></tr>",
                            "<tr><td>The Office, Season 1</td><td>37.71</td></tr>",
                            "<tr><td>IV</td><td>34.65</td></tr>",
                            "<tr><td>Frank</td><td>34.65</td></tr>",
                            "<tr><td>Deep Purple In Rock</td><td>31.68</td></tr>",
                            "<tr><td>The Song Remains The Same (Disc 1)</td><td>31.68</td></tr>",
                            "<tr><td>Somewhere in Time</td><td>28.71</td></tr>",
                            "<tr><td>Black Sabbath</td><td>27.72</td></tr>",
                            "<tr><td>Physical Graffiti [Disc 1]</td><td>22.77</td></tr>",
                            "<tr><td>Berlioz: Symphonie Fantastique</td><td>19.82</td></tr>",
                            "<tr><td>No More Tears (Remastered)</td><td>18.81</td></tr>",
                            "<tr><td>Quanta Gente Veio ver--Bônus De Carnaval</td><td>17.82</td></tr>",
                            "<tr><td>The Song Remains The Same (Disc 2)</td><td>17.82</td></tr>",
                            "<tr><td>Bach: The Cello Suites</td><td>16.86</td></tr>",
                            "<tr><td>Every Kind of Light</td><td>16.86</td></tr>",
                            "<tr><td>Wagner: Favourite Overtures</td><td>16.86</td></tr>",
                            "<tr><td>Scheherazade</td><td>16.85</td></tr>",
                            "<tr><td>Restless and Wild</td><td>16.83</td></tr>",
                            "<tr><td>Pachelbel: Canon &amp; Gigue</td><td>15.86</td></tr>",
                            "<tr><td>Muso Ko</td><td>15.86</td></tr>",
                            "<tr><td>Fauré: Requiem, Ravel: Pavane &amp; Others</td><td>15.86</td></tr>",
                            "<tr><td>Duos II</td><td>15.86</td></tr>",
                            "<tr><td>Holst: The Planets, Op. 32 &amp; Vaughan Williams: Fantasies</td><td>15.86</td></tr>",
                            "<tr><td>Handel: The Messiah (Highlights)</td><td>15.86</td></tr>",
                            "<tr><td>Haydn: Symphonies 99 - 104</td><td>15.86</td></tr>",
                            "<tr><td>Beethoven Piano Sonatas: Moonlight &amp; Pastorale</td><td>15.86</td></tr>",
                            "<tr><td>Adams, John: The Chairman Dances</td><td>15.86</td></tr>",
                            "<tr><td>Aquaman</td><td>14.89</td></tr>",
                            "<tr><td>Schubert: The Late String Quartets &amp; String Quintet (3 CD's)</td><td>14.85</td></tr>",
                            "<tr><td>Sozinho Remix Ao Vivo</td><td>14.85</td></tr>",
                            "<tr><td>The Final Concerts (Disc 2)</td><td>13.86</td></tr>",
                            "<tr><td>Purcell: Music for the Queen Mary</td><td>12.87</td></tr>",
                            "<tr><td>Diary of a Madman (Remastered)</td><td>12.87</td></tr>",
                            "<tr><td>Bach: Orchestral Suites Nos. 1 - 4</td><td>10.89</td></tr>",
                            "<tr><td>Balls to the Wall</td><td>10.89</td></tr>",
                            "<tr><td>Respighi:Pines of Rome</td><td>8.91</td></tr>",
                            "<tr><td>Nielsen: The Six Symphonies</td><td>8.91</td></tr>",
                            "<tr><td>Mozart: Symphonies Nos. 40 &amp; 41</td><td>5.94</td></tr>",
                            "<tr><td>Mendelssohn: A Midsummer Night's Dream</td><td>5.94</td></tr>",
                            "<tr><td>Szymanowski: Piano Works, Vol. 1</td><td>5.94</td></tr>",
                            "<tr><td>Bark at the Moon (Remastered)</td><td>5.94</td></tr>",
                            "<tr><td>Górecki: Symphony No. 3</td><td>5.94</td></tr>",
                            "<tr><td>Grieg: Peer Gynt Suites &amp; Sibelius: Pelléas et Mélisande</td><td>5.94</td></tr>",
                            "<tr><td>Liszt - 12 Études D'Execution Transcendante</td><td>5.94</td></tr>",
                            "<tr><td>Weill: The Seven Deadly Sins</td><td>5.94</td></tr>",
                            "<tr><td>J.S. Bach: Chaconne, Suite in E Minor, Partita in E Major &amp; Prelude, Fugue and Allegro</td><td>3.96</td></tr>",
                            "<tr><td>English Renaissance</td><td>3.96</td></tr>",
                            "<tr><td>Elgar: Cello Concerto &amp; Vaughan Williams: Fantasias</td><td>3.96</td></tr>",
                            "<tr><td>Blizzard of Ozz</td><td>3.96</td></tr>",
                            "<tr><td>Tchaikovsky: 1812 Festival Overture, Op.49, Capriccio Italien &amp; Beethoven: Wellington's Victory</td><td>3.96</td></tr>",
                            "<tr><td>Purcell: The Fairy Queen</td><td>3.96</td></tr>",
                            "<tr><td>Prokofiev: Romeo &amp; Juliet</td><td>3.96</td></tr>",
                            "<tr><td>Un-Led-Ed</td><td>2.98</td></tr>",
                            "<tr><td>The World of Classical Favourites</td><td>1.98</td></tr>",
                            "<tr><td>South American Getaway</td><td>1.98</td></tr>",
                            "<tr><td>Sibelius: Finlandia</td><td>1.98</td></tr>",
                            "<tr><td>Beethoven: Symphony No. 6 'Pastoral' Etc.</td><td>1.98</td></tr>",
                            "<tr><td>Bartok: Violin &amp; Viola Concertos</td><td>1.98</td></tr>",
                            "<tr><td>Bach: The Brandenburg Concertos</td><td>1.98</td></tr>",
                            "<tr><td>Chopin: Piano Concertos Nos. 1 &amp; 2</td><td>1.98</td></tr>",
                            "<tr><td>Carried to Dust (Bonus Track Version)</td><td>0.99</td></tr>",
                            "</table>"
                        ]
                    }
                },
                {
                    "output_type": "execute_result",
                    "metadata": {},
                    "execution_count": 16,
                    "data": {
                        "application/vnd.dataresource+json": {
                            "schema": {
                                "fields": [
                                    {
                                        "name": "Employee Name"
                                    },
                                    {
                                        "name": "Sales"
                                    }
                                ]
                            },
                            "data": [
                                {
                                    "0": "Jane Peacock",
                                    "1": "833.04"
                                },
                                {
                                    "0": "Margaret Park",
                                    "1": "775.40"
                                },
                                {
                                    "0": "Steve Johnson",
                                    "1": "720.16"
                                }
                            ]
                        },
                        "text/html": [
                            "<table>",
                            "<tr><th>Employee Name</th><th>Sales</th></tr>",
                            "<tr><td>Jane Peacock</td><td>833.04</td></tr>",
                            "<tr><td>Margaret Park</td><td>775.40</td></tr>",
                            "<tr><td>Steve Johnson</td><td>720.16</td></tr>",
                            "</table>"
                        ]
                    }
                },
                {
                    "output_type": "execute_result",
                    "metadata": {},
                    "execution_count": 16,
                    "data": {
                        "application/vnd.dataresource+json": {
                            "schema": {
                                "fields": [
                                    {
                                        "name": "name"
                                    },
                                    {
                                        "name": "(No column name)"
                                    }
                                ]
                            },
                            "data": [
                                {
                                    "0": "MPEG audio file",
                                    "1": "17838.27"
                                },
                                {
                                    "0": "Protected MPEG-4 video file",
                                    "1": "1775.90"
                                },
                                {
                                    "0": "Protected AAC audio file",
                                    "1": "1160.11"
                                },
                                {
                                    "0": "AAC audio file",
                                    "1": "48.58"
                                },
                                {
                                    "0": "Purchased AAC audio file",
                                    "1": "25.76"
                                }
                            ]
                        },
                        "text/html": [
                            "<table>",
                            "<tr><th>name</th><th>(No column name)</th></tr>",
                            "<tr><td>MPEG audio file</td><td>17838.27</td></tr>",
                            "<tr><td>Protected MPEG-4 video file</td><td>1775.90</td></tr>",
                            "<tr><td>Protected AAC audio file</td><td>1160.11</td></tr>",
                            "<tr><td>AAC audio file</td><td>48.58</td></tr>",
                            "<tr><td>Purchased AAC audio file</td><td>25.76</td></tr>",
                            "</table>"
                        ]
                    }
                },
                {
                    "output_type": "execute_result",
                    "metadata": {},
                    "execution_count": 16,
                    "data": {
                        "application/vnd.dataresource+json": {
                            "schema": {
                                "fields": [
                                    {
                                        "name": "name"
                                    },
                                    {
                                        "name": "(No column name)"
                                    }
                                ]
                            },
                            "data": [
                                {
                                    "0": "Rock",
                                    "1": "7720.02"
                                },
                                {
                                    "0": "Latin",
                                    "1": "3472.55"
                                },
                                {
                                    "0": "Metal",
                                    "1": "2093.13"
                                },
                                {
                                    "0": "Alternative & Punk",
                                    "1": "1961.66"
                                },
                                {
                                    "0": "TV Shows",
                                    "1": "817.71"
                                },
                                {
                                    "0": "Jazz",
                                    "1": "746.46"
                                },
                                {
                                    "0": "Drama",
                                    "1": "544.61"
                                },
                                {
                                    "0": "Blues",
                                    "1": "429.66"
                                },
                                {
                                    "0": "R&B/Soul",
                                    "1": "338.62"
                                },
                                {
                                    "0": "Reggae",
                                    "1": "332.64"
                                },
                                {
                                    "0": "Classical",
                                    "1": "317.04"
                                },
                                {
                                    "0": "Soundtrack",
                                    "1": "242.55"
                                },
                                {
                                    "0": "Pop",
                                    "1": "239.75"
                                },
                                {
                                    "0": "Alternative",
                                    "1": "211.17"
                                },
                                {
                                    "0": "Sci Fi & Fantasy",
                                    "1": "198.87"
                                },
                                {
                                    "0": "World",
                                    "1": "182.18"
                                },
                                {
                                    "0": "Hip Hop/Rap",
                                    "1": "166.41"
                                },
                                {
                                    "0": "Heavy Metal",
                                    "1": "161.37"
                                },
                                {
                                    "0": "Electronica/Dance",
                                    "1": "149.62"
                                },
                                {
                                    "0": "Easy Listening",
                                    "1": "138.60"
                                },
                                {
                                    "0": "Comedy",
                                    "1": "112.30"
                                },
                                {
                                    "0": "Science Fiction",
                                    "1": "102.41"
                                },
                                {
                                    "0": "Bossa Nova",
                                    "1": "86.13"
                                },
                                {
                                    "0": "Rock And Roll",
                                    "1": "83.16"
                                }
                            ]
                        },
                        "text/html": [
                            "<table>",
                            "<tr><th>name</th><th>(No column name)</th></tr>",
                            "<tr><td>Rock</td><td>7720.02</td></tr>",
                            "<tr><td>Latin</td><td>3472.55</td></tr>",
                            "<tr><td>Metal</td><td>2093.13</td></tr>",
                            "<tr><td>Alternative &amp; Punk</td><td>1961.66</td></tr>",
                            "<tr><td>TV Shows</td><td>817.71</td></tr>",
                            "<tr><td>Jazz</td><td>746.46</td></tr>",
                            "<tr><td>Drama</td><td>544.61</td></tr>",
                            "<tr><td>Blues</td><td>429.66</td></tr>",
                            "<tr><td>R&amp;B/Soul</td><td>338.62</td></tr>",
                            "<tr><td>Reggae</td><td>332.64</td></tr>",
                            "<tr><td>Classical</td><td>317.04</td></tr>",
                            "<tr><td>Soundtrack</td><td>242.55</td></tr>",
                            "<tr><td>Pop</td><td>239.75</td></tr>",
                            "<tr><td>Alternative</td><td>211.17</td></tr>",
                            "<tr><td>Sci Fi &amp; Fantasy</td><td>198.87</td></tr>",
                            "<tr><td>World</td><td>182.18</td></tr>",
                            "<tr><td>Hip Hop/Rap</td><td>166.41</td></tr>",
                            "<tr><td>Heavy Metal</td><td>161.37</td></tr>",
                            "<tr><td>Electronica/Dance</td><td>149.62</td></tr>",
                            "<tr><td>Easy Listening</td><td>138.60</td></tr>",
                            "<tr><td>Comedy</td><td>112.30</td></tr>",
                            "<tr><td>Science Fiction</td><td>102.41</td></tr>",
                            "<tr><td>Bossa Nova</td><td>86.13</td></tr>",
                            "<tr><td>Rock And Roll</td><td>83.16</td></tr>",
                            "</table>"
                        ]
                    }
                },
                {
                    "output_type": "execute_result",
                    "metadata": {},
                    "execution_count": 16,
                    "data": {
                        "application/vnd.dataresource+json": {
                            "schema": {
                                "fields": [
                                    {
                                        "name": "Year"
                                    },
                                    {
                                        "name": "Sales"
                                    }
                                ]
                            },
                            "data": [
                                {
                                    "0": "2009",
                                    "1": "449.46"
                                },
                                {
                                    "0": "2010",
                                    "1": "481.45"
                                },
                                {
                                    "0": "2011",
                                    "1": "469.58"
                                },
                                {
                                    "0": "2012",
                                    "1": "477.53"
                                },
                                {
                                    "0": "2013",
                                    "1": "450.58"
                                }
                            ]
                        },
                        "text/html": [
                            "<table>",
                            "<tr><th>Year</th><th>Sales</th></tr>",
                            "<tr><td>2009</td><td>449.46</td></tr>",
                            "<tr><td>2010</td><td>481.45</td></tr>",
                            "<tr><td>2011</td><td>469.58</td></tr>",
                            "<tr><td>2012</td><td>477.53</td></tr>",
                            "<tr><td>2013</td><td>450.58</td></tr>",
                            "</table>"
                        ]
                    }
                },
                {
                    "output_type": "execute_result",
                    "metadata": {},
                    "execution_count": 16,
                    "data": {
                        "application/vnd.dataresource+json": {
                            "schema": {
                                "fields": [
                                    {
                                        "name": "Year"
                                    },
                                    {
                                        "name": "Month"
                                    },
                                    {
                                        "name": "Sales"
                                    }
                                ]
                            },
                            "data": [
                                {
                                    "0": "2009",
                                    "1": "April",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2009",
                                    "1": "August",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2009",
                                    "1": "December",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2009",
                                    "1": "February",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2009",
                                    "1": "January",
                                    "2": "35.64"
                                },
                                {
                                    "0": "2009",
                                    "1": "July",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2009",
                                    "1": "June",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2009",
                                    "1": "March",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2009",
                                    "1": "May",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2009",
                                    "1": "November",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2009",
                                    "1": "October",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2009",
                                    "1": "September",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2010",
                                    "1": "April",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2010",
                                    "1": "August",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2010",
                                    "1": "December",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2010",
                                    "1": "February",
                                    "2": "46.62"
                                },
                                {
                                    "0": "2010",
                                    "1": "January",
                                    "2": "52.62"
                                },
                                {
                                    "0": "2010",
                                    "1": "July",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2010",
                                    "1": "June",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2010",
                                    "1": "March",
                                    "2": "44.62"
                                },
                                {
                                    "0": "2010",
                                    "1": "May",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2010",
                                    "1": "November",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2010",
                                    "1": "October",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2010",
                                    "1": "September",
                                    "2": "36.63"
                                },
                                {
                                    "0": "2011",
                                    "1": "April",
                                    "2": "51.62"
                                },
                                {
                                    "0": "2011",
                                    "1": "August",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2011",
                                    "1": "December",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2011",
                                    "1": "February",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2011",
                                    "1": "January",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2011",
                                    "1": "July",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2011",
                                    "1": "June",
                                    "2": "50.62"
                                },
                                {
                                    "0": "2011",
                                    "1": "March",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2011",
                                    "1": "May",
                                    "2": "42.62"
                                },
                                {
                                    "0": "2011",
                                    "1": "November",
                                    "2": "23.76"
                                },
                                {
                                    "0": "2011",
                                    "1": "October",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2011",
                                    "1": "September",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2012",
                                    "1": "April",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2012",
                                    "1": "August",
                                    "2": "47.62"
                                },
                                {
                                    "0": "2012",
                                    "1": "December",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2012",
                                    "1": "February",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2012",
                                    "1": "January",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2012",
                                    "1": "July",
                                    "2": "39.62"
                                },
                                {
                                    "0": "2012",
                                    "1": "June",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2012",
                                    "1": "March",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2012",
                                    "1": "May",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2012",
                                    "1": "November",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2012",
                                    "1": "October",
                                    "2": "42.62"
                                },
                                {
                                    "0": "2012",
                                    "1": "September",
                                    "2": "46.71"
                                },
                                {
                                    "0": "2013",
                                    "1": "April",
                                    "2": "33.66"
                                },
                                {
                                    "0": "2013",
                                    "1": "August",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2013",
                                    "1": "December",
                                    "2": "38.62"
                                },
                                {
                                    "0": "2013",
                                    "1": "February",
                                    "2": "27.72"
                                },
                                {
                                    "0": "2013",
                                    "1": "January",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2013",
                                    "1": "July",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2013",
                                    "1": "June",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2013",
                                    "1": "March",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2013",
                                    "1": "May",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2013",
                                    "1": "November",
                                    "2": "49.62"
                                },
                                {
                                    "0": "2013",
                                    "1": "October",
                                    "2": "37.62"
                                },
                                {
                                    "0": "2013",
                                    "1": "September",
                                    "2": "37.62"
                                }
                            ]
                        },
                        "text/html": [
                            "<table>",
                            "<tr><th>Year</th><th>Month</th><th>Sales</th></tr>",
                            "<tr><td>2009</td><td>April</td><td>37.62</td></tr>",
                            "<tr><td>2009</td><td>August</td><td>37.62</td></tr>",
                            "<tr><td>2009</td><td>December</td><td>37.62</td></tr>",
                            "<tr><td>2009</td><td>February</td><td>37.62</td></tr>",
                            "<tr><td>2009</td><td>January</td><td>35.64</td></tr>",
                            "<tr><td>2009</td><td>July</td><td>37.62</td></tr>",
                            "<tr><td>2009</td><td>June</td><td>37.62</td></tr>",
                            "<tr><td>2009</td><td>March</td><td>37.62</td></tr>",
                            "<tr><td>2009</td><td>May</td><td>37.62</td></tr>",
                            "<tr><td>2009</td><td>November</td><td>37.62</td></tr>",
                            "<tr><td>2009</td><td>October</td><td>37.62</td></tr>",
                            "<tr><td>2009</td><td>September</td><td>37.62</td></tr>",
                            "<tr><td>2010</td><td>April</td><td>37.62</td></tr>",
                            "<tr><td>2010</td><td>August</td><td>37.62</td></tr>",
                            "<tr><td>2010</td><td>December</td><td>37.62</td></tr>",
                            "<tr><td>2010</td><td>February</td><td>46.62</td></tr>",
                            "<tr><td>2010</td><td>January</td><td>52.62</td></tr>",
                            "<tr><td>2010</td><td>July</td><td>37.62</td></tr>",
                            "<tr><td>2010</td><td>June</td><td>37.62</td></tr>",
                            "<tr><td>2010</td><td>March</td><td>44.62</td></tr>",
                            "<tr><td>2010</td><td>May</td><td>37.62</td></tr>",
                            "<tr><td>2010</td><td>November</td><td>37.62</td></tr>",
                            "<tr><td>2010</td><td>October</td><td>37.62</td></tr>",
                            "<tr><td>2010</td><td>September</td><td>36.63</td></tr>",
                            "<tr><td>2011</td><td>April</td><td>51.62</td></tr>",
                            "<tr><td>2011</td><td>August</td><td>37.62</td></tr>",
                            "<tr><td>2011</td><td>December</td><td>37.62</td></tr>",
                            "<tr><td>2011</td><td>February</td><td>37.62</td></tr>",
                            "<tr><td>2011</td><td>January</td><td>37.62</td></tr>",
                            "<tr><td>2011</td><td>July</td><td>37.62</td></tr>",
                            "<tr><td>2011</td><td>June</td><td>50.62</td></tr>",
                            "<tr><td>2011</td><td>March</td><td>37.62</td></tr>",
                            "<tr><td>2011</td><td>May</td><td>42.62</td></tr>",
                            "<tr><td>2011</td><td>November</td><td>23.76</td></tr>",
                            "<tr><td>2011</td><td>October</td><td>37.62</td></tr>",
                            "<tr><td>2011</td><td>September</td><td>37.62</td></tr>",
                            "<tr><td>2012</td><td>April</td><td>37.62</td></tr>",
                            "<tr><td>2012</td><td>August</td><td>47.62</td></tr>",
                            "<tr><td>2012</td><td>December</td><td>37.62</td></tr>",
                            "<tr><td>2012</td><td>February</td><td>37.62</td></tr>",
                            "<tr><td>2012</td><td>January</td><td>37.62</td></tr>",
                            "<tr><td>2012</td><td>July</td><td>39.62</td></tr>",
                            "<tr><td>2012</td><td>June</td><td>37.62</td></tr>",
                            "<tr><td>2012</td><td>March</td><td>37.62</td></tr>",
                            "<tr><td>2012</td><td>May</td><td>37.62</td></tr>",
                            "<tr><td>2012</td><td>November</td><td>37.62</td></tr>",
                            "<tr><td>2012</td><td>October</td><td>42.62</td></tr>",
                            "<tr><td>2012</td><td>September</td><td>46.71</td></tr>",
                            "<tr><td>2013</td><td>April</td><td>33.66</td></tr>",
                            "<tr><td>2013</td><td>August</td><td>37.62</td></tr>",
                            "<tr><td>2013</td><td>December</td><td>38.62</td></tr>",
                            "<tr><td>2013</td><td>February</td><td>27.72</td></tr>",
                            "<tr><td>2013</td><td>January</td><td>37.62</td></tr>",
                            "<tr><td>2013</td><td>July</td><td>37.62</td></tr>",
                            "<tr><td>2013</td><td>June</td><td>37.62</td></tr>",
                            "<tr><td>2013</td><td>March</td><td>37.62</td></tr>",
                            "<tr><td>2013</td><td>May</td><td>37.62</td></tr>",
                            "<tr><td>2013</td><td>November</td><td>49.62</td></tr>",
                            "<tr><td>2013</td><td>October</td><td>37.62</td></tr>",
                            "<tr><td>2013</td><td>September</td><td>37.62</td></tr>",
                            "</table>"
                        ]
                    }
                },
                {
                    "output_type": "execute_result",
                    "metadata": {},
                    "execution_count": 16,
                    "data": {
                        "application/vnd.dataresource+json": {
                            "schema": {
                                "fields": [
                                    {
                                        "name": "(No column name)"
                                    },
                                    {
                                        "name": "BirthDate"
                                    },
                                    {
                                        "name": "HireDate"
                                    },
                                    {
                                        "name": "(No column name)"
                                    },
                                    {
                                        "name": "Address"
                                    },
                                    {
                                        "name": "City"
                                    },
                                    {
                                        "name": "State"
                                    },
                                    {
                                        "name": "Country"
                                    },
                                    {
                                        "name": "Title"
                                    },
                                    {
                                        "name": "(No column name)"
                                    },
                                    {
                                        "name": "(No column name)"
                                    }
                                ]
                            },
                            "data": [
                                {
                                    "0": "Andrew Adams",
                                    "1": "1962-02-18 00:00:00.000",
                                    "2": "2002-08-14 00:00:00.000",
                                    "3": "11",
                                    "4": "11120 Jasper Ave NW",
                                    "5": "Edmonton",
                                    "6": "AB",
                                    "7": "Canada",
                                    "8": "General Manager",
                                    "9": "NO MANAGER",
                                    "10": "NO MANAGER"
                                },
                                {
                                    "0": "Nancy Edwards",
                                    "1": "1958-12-08 00:00:00.000",
                                    "2": "2002-05-01 00:00:00.000",
                                    "3": "11",
                                    "4": "825 8 Ave SW",
                                    "5": "Calgary",
                                    "6": "AB",
                                    "7": "Canada",
                                    "8": "Sales Manager",
                                    "9": "Andrew Adams",
                                    "10": "General Manager"
                                },
                                {
                                    "0": "Jane Peacock",
                                    "1": "1973-08-29 00:00:00.000",
                                    "2": "2002-04-01 00:00:00.000",
                                    "3": "11",
                                    "4": "1111 6 Ave SW",
                                    "5": "Calgary",
                                    "6": "AB",
                                    "7": "Canada",
                                    "8": "Sales Support Agent",
                                    "9": "Nancy Edwards",
                                    "10": "Sales Manager"
                                },
                                {
                                    "0": "Margaret Park",
                                    "1": "1947-09-19 00:00:00.000",
                                    "2": "2003-05-03 00:00:00.000",
                                    "3": "10",
                                    "4": "683 10 Street SW",
                                    "5": "Calgary",
                                    "6": "AB",
                                    "7": "Canada",
                                    "8": "Sales Support Agent",
                                    "9": "Nancy Edwards",
                                    "10": "Sales Manager"
                                },
                                {
                                    "0": "Steve Johnson",
                                    "1": "1965-03-03 00:00:00.000",
                                    "2": "2003-10-17 00:00:00.000",
                                    "3": "10",
                                    "4": "7727B 41 Ave",
                                    "5": "Calgary",
                                    "6": "AB",
                                    "7": "Canada",
                                    "8": "Sales Support Agent",
                                    "9": "Nancy Edwards",
                                    "10": "Sales Manager"
                                },
                                {
                                    "0": "Michael Mitchell",
                                    "1": "1973-07-01 00:00:00.000",
                                    "2": "2003-10-17 00:00:00.000",
                                    "3": "10",
                                    "4": "5827 Bowness Road NW",
                                    "5": "Calgary",
                                    "6": "AB",
                                    "7": "Canada",
                                    "8": "IT Manager",
                                    "9": "Andrew Adams",
                                    "10": "General Manager"
                                },
                                {
                                    "0": "Robert King",
                                    "1": "1970-05-29 00:00:00.000",
                                    "2": "2004-01-02 00:00:00.000",
                                    "3": "9",
                                    "4": "590 Columbia Boulevard West",
                                    "5": "Lethbridge",
                                    "6": "AB",
                                    "7": "Canada",
                                    "8": "IT Staff",
                                    "9": "Michael Mitchell",
                                    "10": "IT Manager"
                                },
                                {
                                    "0": "Laura Callahan",
                                    "1": "1968-01-09 00:00:00.000",
                                    "2": "2004-03-04 00:00:00.000",
                                    "3": "9",
                                    "4": "923 7 ST NW",
                                    "5": "Lethbridge",
                                    "6": "AB",
                                    "7": "Canada",
                                    "8": "IT Staff",
                                    "9": "Michael Mitchell",
                                    "10": "IT Manager"
                                }
                            ]
                        },
                        "text/html": [
                            "<table>",
                            "<tr><th>(No column name)</th><th>BirthDate</th><th>HireDate</th><th>(No column name)</th><th>Address</th><th>City</th><th>State</th><th>Country</th><th>Title</th><th>(No column name)</th><th>(No column name)</th></tr>",
                            "<tr><td>Andrew Adams</td><td>1962-02-18 00:00:00.000</td><td>2002-08-14 00:00:00.000</td><td>11</td><td>11120 Jasper Ave NW</td><td>Edmonton</td><td>AB</td><td>Canada</td><td>General Manager</td><td>NO MANAGER</td><td>NO MANAGER</td></tr>",
                            "<tr><td>Nancy Edwards</td><td>1958-12-08 00:00:00.000</td><td>2002-05-01 00:00:00.000</td><td>11</td><td>825 8 Ave SW</td><td>Calgary</td><td>AB</td><td>Canada</td><td>Sales Manager</td><td>Andrew Adams</td><td>General Manager</td></tr>",
                            "<tr><td>Jane Peacock</td><td>1973-08-29 00:00:00.000</td><td>2002-04-01 00:00:00.000</td><td>11</td><td>1111 6 Ave SW</td><td>Calgary</td><td>AB</td><td>Canada</td><td>Sales Support Agent</td><td>Nancy Edwards</td><td>Sales Manager</td></tr>",
                            "<tr><td>Margaret Park</td><td>1947-09-19 00:00:00.000</td><td>2003-05-03 00:00:00.000</td><td>10</td><td>683 10 Street SW</td><td>Calgary</td><td>AB</td><td>Canada</td><td>Sales Support Agent</td><td>Nancy Edwards</td><td>Sales Manager</td></tr>",
                            "<tr><td>Steve Johnson</td><td>1965-03-03 00:00:00.000</td><td>2003-10-17 00:00:00.000</td><td>10</td><td>7727B 41 Ave</td><td>Calgary</td><td>AB</td><td>Canada</td><td>Sales Support Agent</td><td>Nancy Edwards</td><td>Sales Manager</td></tr>",
                            "<tr><td>Michael Mitchell</td><td>1973-07-01 00:00:00.000</td><td>2003-10-17 00:00:00.000</td><td>10</td><td>5827 Bowness Road NW</td><td>Calgary</td><td>AB</td><td>Canada</td><td>IT Manager</td><td>Andrew Adams</td><td>General Manager</td></tr>",
                            "<tr><td>Robert King</td><td>1970-05-29 00:00:00.000</td><td>2004-01-02 00:00:00.000</td><td>9</td><td>590 Columbia Boulevard West</td><td>Lethbridge</td><td>AB</td><td>Canada</td><td>IT Staff</td><td>Michael Mitchell</td><td>IT Manager</td></tr>",
                            "<tr><td>Laura Callahan</td><td>1968-01-09 00:00:00.000</td><td>2004-03-04 00:00:00.000</td><td>9</td><td>923 7 ST NW</td><td>Lethbridge</td><td>AB</td><td>Canada</td><td>IT Staff</td><td>Michael Mitchell</td><td>IT Manager</td></tr>",
                            "</table>"
                        ]
                    }
                },
                {
                    "output_type": "execute_result",
                    "metadata": {},
                    "execution_count": 16,
                    "data": {
                        "application/vnd.dataresource+json": {
                            "schema": {
                                "fields": [
                                    {
                                        "name": "Employee Age"
                                    },
                                    {
                                        "name": "Sales"
                                    }
                                ]
                            },
                            "data": [
                                {
                                    "0": "66",
                                    "1": "168.30"
                                },
                                {
                                    "0": "65",
                                    "1": "197.20"
                                },
                                {
                                    "0": "64",
                                    "1": "125.77"
                                },
                                {
                                    "0": "63",
                                    "1": "122.76"
                                },
                                {
                                    "0": "62",
                                    "1": "161.37"
                                },
                                {
                                    "0": "48",
                                    "1": "125.85"
                                },
                                {
                                    "0": "47",
                                    "1": "133.73"
                                },
                                {
                                    "0": "46",
                                    "1": "159.47"
                                },
                                {
                                    "0": "45",
                                    "1": "136.77"
                                },
                                {
                                    "0": "44",
                                    "1": "164.34"
                                },
                                {
                                    "0": "40",
                                    "1": "156.43"
                                },
                                {
                                    "0": "39",
                                    "1": "146.60"
                                },
                                {
                                    "0": "38",
                                    "1": "184.34"
                                },
                                {
                                    "0": "37",
                                    "1": "221.92"
                                },
                                {
                                    "0": "36",
                                    "1": "123.75"
                                }
                            ]
                        },
                        "text/html": [
                            "<table>",
                            "<tr><th>Employee Age</th><th>Sales</th></tr>",
                            "<tr><td>66</td><td>168.30</td></tr>",
                            "<tr><td>65</td><td>197.20</td></tr>",
                            "<tr><td>64</td><td>125.77</td></tr>",
                            "<tr><td>63</td><td>122.76</td></tr>",
                            "<tr><td>62</td><td>161.37</td></tr>",
                            "<tr><td>48</td><td>125.85</td></tr>",
                            "<tr><td>47</td><td>133.73</td></tr>",
                            "<tr><td>46</td><td>159.47</td></tr>",
                            "<tr><td>45</td><td>136.77</td></tr>",
                            "<tr><td>44</td><td>164.34</td></tr>",
                            "<tr><td>40</td><td>156.43</td></tr>",
                            "<tr><td>39</td><td>146.60</td></tr>",
                            "<tr><td>38</td><td>184.34</td></tr>",
                            "<tr><td>37</td><td>221.92</td></tr>",
                            "<tr><td>36</td><td>123.75</td></tr>",
                            "</table>"
                        ]
                    }
                },
                {
                    "output_type": "execute_result",
                    "metadata": {},
                    "execution_count": 16,
                    "data": {
                        "application/vnd.dataresource+json": {
                            "schema": {
                                "fields": [
                                    {
                                        "name": "Employee Age"
                                    },
                                    {
                                        "name": "Sales"
                                    }
                                ]
                            },
                            "data": [
                                {
                                    "0": "66",
                                    "1": "168.30"
                                },
                                {
                                    "0": "65",
                                    "1": "197.20"
                                },
                                {
                                    "0": "64",
                                    "1": "125.77"
                                },
                                {
                                    "0": "63",
                                    "1": "122.76"
                                },
                                {
                                    "0": "62",
                                    "1": "161.37"
                                },
                                {
                                    "0": "48",
                                    "1": "125.85"
                                },
                                {
                                    "0": "47",
                                    "1": "133.73"
                                },
                                {
                                    "0": "46",
                                    "1": "159.47"
                                },
                                {
                                    "0": "45",
                                    "1": "136.77"
                                },
                                {
                                    "0": "44",
                                    "1": "164.34"
                                },
                                {
                                    "0": "40",
                                    "1": "156.43"
                                },
                                {
                                    "0": "39",
                                    "1": "146.60"
                                },
                                {
                                    "0": "38",
                                    "1": "184.34"
                                },
                                {
                                    "0": "37",
                                    "1": "221.92"
                                },
                                {
                                    "0": "36",
                                    "1": "123.75"
                                }
                            ]
                        },
                        "text/html": [
                            "<table>",
                            "<tr><th>Employee Age</th><th>Sales</th></tr>",
                            "<tr><td>66</td><td>168.30</td></tr>",
                            "<tr><td>65</td><td>197.20</td></tr>",
                            "<tr><td>64</td><td>125.77</td></tr>",
                            "<tr><td>63</td><td>122.76</td></tr>",
                            "<tr><td>62</td><td>161.37</td></tr>",
                            "<tr><td>48</td><td>125.85</td></tr>",
                            "<tr><td>47</td><td>133.73</td></tr>",
                            "<tr><td>46</td><td>159.47</td></tr>",
                            "<tr><td>45</td><td>136.77</td></tr>",
                            "<tr><td>44</td><td>164.34</td></tr>",
                            "<tr><td>40</td><td>156.43</td></tr>",
                            "<tr><td>39</td><td>146.60</td></tr>",
                            "<tr><td>38</td><td>184.34</td></tr>",
                            "<tr><td>37</td><td>221.92</td></tr>",
                            "<tr><td>36</td><td>123.75</td></tr>",
                            "</table>"
                        ]
                    }
                }
            ],
            "execution_count": 16
        },
        {
            "cell_type": "code",
            "source": [
                ""
            ],
            "metadata": {
                "azdata_cell_guid": "91cb89d5-3887-4e6a-8dd7-c0375f81efe8"
            },
            "outputs": [
{
    "output_type": "display_data",
    "data": {
        "text/html": "Commands completed successfully."
    },
    "metadata": {}
}, {
    "output_type": "display_data",
    "data": {
        "text/html": "Total execution time: 00:00:00"
    },
    "metadata": {}
}
],
            "execution_count": 17
        }
    ]
}