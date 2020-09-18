Use MiniSocialNetwork
Go
Create Proc CheckLogin
@email nvarchar(256),
@password nvarchar(256)
As
Begin
	Select Email, Name, Role, Status From Users Where Email = @email And Password = @password And Status = 'Confirmed'
End
Go
Create Proc Register
@email nvarchar(256),
@password nvarchar(256),
@name nvarchar(256)
As
Begin
	Insert Into Users (Email, Password, Name) Values (@email, @password, @name)
End
Go
Create Proc CreatePost
@title nvarchar(256),
@content nvarchar(MAX),
@image nvarchar(256),
@email nvarchar(256)
As
Begin
	Insert Into Posts (Title, Content, Image, Email) Values (@title, @content, @image, @email)
End
Go
Create Proc GetPostById
@postId int
As
Begin
	Select Title, Content, Image, 
	(Select COUNT(Email) From Emotions Where PostId = @postId And Type = 1) As Likes, 
	(Select COUNT(Email) From Emotions Where PostId = @postId And Type = -1) As Dislikes, 
	Email, Date From Posts 
	Where Id = @postId And Status = 1
End
Go
Create Proc Search
@search nvarchar(256),
@pageNumber int,
@rowsOfPage int = 5
As
Begin
	SELECT Id, Title, Content, Image, Email, Date FROM Posts Where Content Like N'%' + @search + '%' And Status = 1
	ORDER BY Date DESC 
	OFFSET (@pageNumber-1)*@rowsOfPage ROWS
	FETCH NEXT @rowsOfPage ROWS ONLY
End
Go
Create Proc ExpressEmotion
@email nvarchar(256),
@postId int,
@emotion int = 0
As
Begin
	Insert Into Emotions (Email, PostId, Type) Values (@email, @postId, @emotion)
	Insert Into Notices (Email, PostId, Content, Author) Values (@email, @postId, @emotion, (Select Email From Posts Where Posts.Id = @postId))
End
Go
Create Proc UpdateEmotion
@email nvarchar(256),
@postId int,
@emotion int = 0
As
Begin
	Update Emotions Set Type = @emotion Where Email = @email and PostId = @postId
	Insert Into Notices (Email, PostId, Content, Author) Values (@email, @postId, @emotion, (Select Email From Posts Where Posts.Id = @postId))
End
Go
Create Proc GetNotice
@email nvarchar(256)
As
Begin
	Select Id, Email, PostId, Content, Date From Notices Where Author = @email Order By Date DESC
End
Go
Create Proc DeletePost
@postId int
As
Begin
	Update Posts Set Status = 0 Where Id = @postId
End
Go
Create Proc DeleteComment
@commentId int
As
Begin
	Delete From Comments Where Id = @commentId
End