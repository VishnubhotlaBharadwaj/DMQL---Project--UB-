
<!DOCTYPE html>  
<html>  
<head>  
<meta name="viewport" content="width=device-width, initial-scale=1">  
<style>  
body{  
  font-family: Calibri, Helvetica, sans-serif;  
  background-color: pink;  
}  
.container {  
    padding: 50px;  
  background-color: lightblue;  
}  
  
input[type=text], input[type=password], textarea {  
  width: 100%;  
  padding: 15px;  
  margin: 5px 0 22px 0;  
  display: inline-block;  
  border: none;  
  background: #f1f1f1;  
}  
input[type=text]:focus, input[type=password]:focus {  
  background-color: orange;  
  outline: none;  
}  
 div {  
            padding: 10px 0;  
         }  
hr {  
  border: 1px solid #f1f1f1;  
  margin-bottom: 25px;  
}  
.registerbtn {  
  background-color: #4CAF50;  
  color: white;  
  padding: 16px 20px;  
  margin: 8px 0;  
  border: none;  
  cursor: pointer;  
  width: 100%;  
  opacity: 0.9;  
}  
.registerbtn:hover {  
  opacity: 1;  
}  
</style>  
</head>  
<body>  
<form action="ins">  
  <div class="container">  
  <center>  <h1> Customer Registeration Form</h1> </center>  
  <hr>  
  <label> Name </label>   
<input type="text" name="Name" placeholder= " Name" size="25" required />   
<div>  
<label>   
<label>   
Phone :  
</label>  
<br>
<input type="text" name="phone" placeholder="phone no." size="10"/ required>   
Primary Address :  
<textarea cols="80" rows="5" placeholder="primary Address" name="p_address" required>  
</textarea> 
 Secondary Address :  
<textarea cols="80" rows="5" placeholder="Secondary Address" name="s_address" >  
</textarea>  
<label> State </label>   
<input type="text" name="State" placeholder= " State" size="25" required />
<label> City </label>   
<input type="text" name="City" placeholder= " City" size="25" required />
<label> Country </label>   
<input type="text" name="Country" placeholder= " Country" size="25" required />
<label>PostalCode </label>   
<input type="text" name="PostalCode" placeholder= "PostalCode" size="25" required />

 <label for="email"><b>Email</b></label>  
 <input type="text" placeholder="Enter Email" name="email" required>  
  
    <label for="psw"><b>Password</b></label>  
    <input type="password" placeholder="Enter Password" name="psw" required>  
  
    <label for="psw-repeat"><b>Re-type Password</b></label>  
    <input type="password" placeholder="Retype Password" name="psw-repeat" required>  
    <button type="submit" class="registerbtn">Register</button>    
</form>  
</body>  
</html>  