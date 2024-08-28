# JsonWebToken_Demo

## Step 1: Insert a User into the Database

Run the following SQL command to insert a user into the `tbl_Account` table:

```sql
INSERT INTO tbl_Account (UserName, PassWord)
VALUES ('Quang', pwdencrypt('2053'))

### Step 2: Verify User Addition
```sql
EXEC [dbo].[spAdmin_UserLogin] @UserName = 'Quang', @PassWord = '2053'

### Step 3: Activate the User Account
```sql
UPDATE tbl_Account
SET UserStatus = 1
WHERE UserName = 'Quang'

