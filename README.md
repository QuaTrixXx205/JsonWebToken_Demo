# JsonWebToken_Demo

Step 1: insert an user to database
INSERT INTO tbl_Account (UserName, PassWord)
values ('Quang', pwdencrypt('2053'))

Step 2: check user if added succesfully
[spAdmin_UserLogin] 'Quang', '2053'

Turn UserStatus to 1 (true)

