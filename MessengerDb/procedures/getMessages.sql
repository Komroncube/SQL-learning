create procedure GetMessages
@sender varchar(255), @recepient varchar(255)
as 
select sender, recepient, messagetext, created_at from messages WHERE sender in (@sender, @recepient) and recepient in (@sender, @recepient);