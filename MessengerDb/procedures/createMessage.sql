create procedure CreateMessage

@sender varchar(255), @recepient varchar(255), @messagetext text
as 
Insert into Messages (sender, Recepient,MessageText)
values (@sender, @recepient, @messagetext);