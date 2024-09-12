# JsonWebToken_Demo

## Step 1: Insert a User into the Database

Run the following SQL command to insert a user into the `tbl_Account` table:

```sql
INSERT INTO tbl_Account (UserName, UserPass)
VALUES ('Quang', pwdencrypt('2053'))
```

## Step 2: Verify User Addition

Execute the stored procedure spAdmin_UserLogin with the following command:

```sql
EXEC [dbo].[spAdmin_UserLogin] @UserName = 'Quang', @PassWord = '2053'
```

## Step 3: Activate the User Account

Set the UserStatus to 1 (true) to activate the user account:

```sql
UPDATE tbl_Account
SET UserStatus = 1
WHERE UserName = 'Quang'
```

## Now run the file
```code
dotnet run
```

## You should get a link like this:
```code
http://localhost:5016
```
## Next go to Postman and use this link with "/login" next to it then run with:
```code
{
    "UserName": "Quang",
    "PassWord": "2053"
}
```
## Result: Postman will return an encrypted token and you are done!




