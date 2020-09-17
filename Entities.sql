Create Database MiniSocialNetwork
Go
Use MiniSocialNetwork
Go
Create Table Users (
	Email nvarchar(256) primary key,
	Password nvarchar(256),
	Name nvarchar(256),
	Role nvarchar(256) Default 'Member',
	Status nvarchar(256) Default 'New',
)
Go
Create Table Posts (
	Id int primary key identity,
	Title nvarchar(256),
	Content nvarchar(MAX),
	Image nvarchar(256),
	Email nvarchar(256) foreign key references Users(Email),
	Date datetime default getdate(),
	Status bit default 1,
)
Go
Create Table Likes (
	Email nvarchar(256) foreign key references Users(Email),
	PostId int foreign key references Posts(Id),
	Date datetime default getdate(),
	Primary key(Email, PostId)
)
Go
Create Table Dislikes (
	Email nvarchar(256) foreign key references Users(Email),
	PostId int foreign key references Posts(Id),
	Date datetime default getdate(),
	Primary key(Email, PostId)
)
Go
Create Table Comments (
	Id int primary key identity,
	Email nvarchar(256) foreign key references Users(Email),
	Comment nvarchar(256),
	PostId int foreign key references Posts(Id),
	Date datetime default getdate()
)
Go
Create Table Notices (
	Id int identity primary key,
	Email nvarchar(256) foreign key references Users(Email),
	PostId int foreign key references Posts(Id),
	Content nvarchar(MAX),
	Date datetime default Getdate()
)