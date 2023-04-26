<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Upload File</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-times.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}
</script>
<style type="text/css">
<!--
.style1 {
	color: #1e5381;
	font-family: "Times New Roman", Times, serif;
	font-size: 25px;
}
.style4 {font-family: "Times New Roman", Times, serif}
.style5 {font-size: 20px}
.style6 {color: #0000FF}
.style8 {color: #000000}
.style9 {font-family: "Times New Roman", Times, serif; font-size: 20px; color: #000000; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header style9">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html">Achieving Efficient and Secure Data Acquisition for Cloud-supported Internet</a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li><a href="index.html">Home Page</a></li>
          <li><a href="cs_login.jsp">Cloud Server</a></li>
          <li><a href="au_login.jsp">Authority</a></li>
          <li class="active"><a href="do_login.jsp">Data Owner</a></li>
          <li><a href="dr_login.jsp">Data Receiver</a></li>
        </ul>
      </div>
      <div class="style10"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="360" alt="" /></a> <a href="#"><img src="images/slide2.jpg" width="960" height="360" alt="" /></a> <a href="#"><img src="images/slide3.jpg" width="960" height="360" alt="" /></a> </div>
        <div class="style10"></div>
      </div>
      <div class="style10"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar style9">
          <h2 align="center" class="style13"> Upload File </h2>
		  <p>&nbsp;</p>
		  
		  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream,java.math.*"%>

<% 
try 
{
      		String file=request.getParameter("fname");
      		String cont=request.getParameter("text");
      		//String start=request.getParameter("start");
      		String keys = "ef50a0ef2c3e3a5f";
      		String h[]=new String[5];
      		String filename="filename";
			String filename1="filename1";
			String filename2="filename2";
			String filename3="filename3";
			String filename4="filename4";
			ResultSet rs=connection.createStatement().executeQuery("select * from cloud_files where fname='"+file+"' ");
			if(!rs.next())
			{
      		
			int sourceFileSize=cont.length();
			int s=sourceFileSize%4;
			int s1=sourceFileSize/4;
			int a1=s1;
			int a2=s1+s1;
			int a3=s1+s1+s1;
			int a4=s1+s1+s1+s1+s;
			
			String encryptedValue1="",encryptedValue2="",encryptedValue3="",encryptedValue4="";
			
			
		//	String keys = "ef50a0ef2c3e3a5f";
				byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.ENCRYPT_MODE, key);
				String encryptedValue = new String(Base64.encode(cont.getBytes()));
				
				encryptedValue1 = new String(Base64.encode(cont.substring(0,a1).getBytes()));
				encryptedValue2 = new String(Base64.encode(cont.substring(a1+1,a2).getBytes()));
				encryptedValue3 = new String(Base64.encode(cont.substring(a2+1,a3).getBytes()));
				encryptedValue4 = new String(Base64.encode(cont.substring(a3+1,a4).getBytes()));		
												
			
%>
<p>Source File Size = (<%=sourceFileSize %>), a1 = (<%=a1 %>), a2 = (<%=a2 %>), a3 = (<%=a3 %>), a4 = (<%=a4 %>), split : (<%=s %>)</p>
<%
      	
      		PrintStream p1 = new PrintStream(new FileOutputStream(filename1+".txt"+"/"));
			p1.print(new String(encryptedValue1));
			PrintStream p2 = new PrintStream(new FileOutputStream(filename2+".txt"+"/"));
			p2.print(new String(encryptedValue2));
			PrintStream p3 = new PrintStream(new FileOutputStream(filename3+".txt"+"/"));
			p3.print(new String(encryptedValue3));
			PrintStream p4 = new PrintStream(new FileOutputStream(filename4+".txt"+"/"));
			p4.print(new String(encryptedValue4));
			
			for(int i=1;i<5;i++)
			{
				MessageDigest md = MessageDigest.getInstance("SHA1");
				FileInputStream fis11 = new FileInputStream(filename+i+".txt"+"/");
				DigestInputStream dis1 = new DigestInputStream(fis11, md);
				BufferedInputStream bis1 = new BufferedInputStream(dis1);
	 
				//Read the bis so SHA1 is auto calculated at dis
				while (true) 
				{
					int b1 = bis1.read();
					if (b1 == -1)
						break;
				}
	 
				BigInteger bi1 = new BigInteger(md.digest());
				String spl1 = bi1.toString();
				h[i] = bi1.toString(16);
			
			
			
			
      		}		
%>
          </span>
          <div class="clr"></div>
<form action="do_upload_file3.jsp" method="post">

<input type="hidden" name="fsize" value="<%=sourceFileSize %>" />

  <table width="560" border="0" align="center">
  
    <tr>
      <td width="173" height="39" bgcolor="#99FF99"><span class="style4 style22 style5 style6">File Name :- </span></td>
      <td width="377" bgcolor="#FFCC00"><input name="t42" type="text" id="t42" value="<%= file %>" size="50" readonly="readonly" /></td>
    </tr>
    <tr>
      <td width="173" height="40" bgcolor="#99FF99"><span class="style4 style22 style5 style6">Block-1 :- </span></td>
      <td width="377" bgcolor="#FFCC00"><span class="style22 style4 style5 style8">Size:<%=a1%>Bytes</span></td>
    </tr>
    <tr>
      <td width="173" height="40" bgcolor="#99FF99"><span class="style4 style22 style5 style6">Content :- </span></td>
      <td bgcolor="#FFCC00">
        <span class="style9">
        <textarea name="text1" cols="50" rows="8" readonly="readonly"><%= encryptedValue1 %></textarea>
        </span> </td>
    </tr>
    <tr>
      <td height="40" bgcolor="#99FF99"><span class="style4 style22 style5 style6">MAC-1:- </span></td>
      <td bgcolor="#FFCC00"><input name="t1" type="text" id="t4" value="<%= h[1] %>" size="50" readonly="readonly" /></td>
    </tr>
	<tr>
      <td height="40" bgcolor="#99FF99"><span class="style4 style22 style5 style6">Accessible to :- </span></td>
      <td bgcolor="#FFCC00"><input name="ac1" type="text" id="t4" value="Researcher" size="50" /></td>
    </tr>
    <tr>
      <td width="173" height="41" bgcolor="#99FF99"><span class="style4 style22 style5 style6">Block-2 :-</span></td>
      <td width="377" bgcolor="#FFCC00"><span class="style22 style4 style5 style8">Size:<%=(a2-a1)%>Bytes</span></td>
    </tr>
    <tr>
      <td width="173" height="40" bgcolor="#99FF99"><span class="style4 style22 style5 style6">Content :-</span></td>
      <td bgcolor="#FFCC00">
        <span class="style9">
        <textarea name="text2" cols="50" rows="8" readonly="readonly"><%= encryptedValue2 %></textarea>
        </span> </td>
    </tr>
    <tr>
      <td height="37" bgcolor="#99FF99"><span class="style4 style22 style5 style6">MAC-2 :- </span></td>
      <td bgcolor="#FFCC00"><input name="t2" type="text" id="t4" value="<%= h[2] %>" size="50" readonly="readonly" /></td>
    </tr>
	<tr>
      <td height="40" bgcolor="#99FF99"><span class="style4 style22 style5 style6">Accessible to :- </span></td>
      <td bgcolor="#FFCC00"><input name="ac2" type="text" id="t4" value="Power Grid Staff" size="50" /></td>
    </tr>
    <tr>
      <td width="173" height="40" bgcolor="#99FF99"><span class="style4 style22 style5 style6">Block-3 </span><span class="style4 style22 style5 style6">:-</span></td>
      <td width="377" bgcolor="#FFCC00"><span class="style22 style4 style5 style8">Size:<%=(a3-a2)%>Bytes</span></td>
    </tr>
	
    <tr>
      <td width="173" height="40" bgcolor="#99FF99"><span class="style4 style22 style5 style6">Content </span><span class="style4 style22 style5 style6">:-</span></td>
      <td bgcolor="#FFCC00">
        <span class="style9">
        <textarea name="text3" cols="50" rows="8" readonly="readonly"><%= encryptedValue3 %></textarea>
        </span> </td>
    </tr>
    <tr>
      <td height="41" bgcolor="#99FF99"><span class="style4 style22 style5 style6">MAC-3 :- </span></td>
      <td bgcolor="#FFCC00"><input name="t3" type="text" id="t4" value="<%= h[3]%>" size="50" readonly="readonly" /></td>
    </tr>
	<tr>
      <td height="40" bgcolor="#99FF99"><span class="style4 style22 style5 style6">Accessible to :- </span></td>
      <td bgcolor="#FFCC00"><input name="ac3" type="text" id="t4" value="Government Staff" size="50" /></td>
    </tr>
    <tr>
      <td width="173" height="35" bgcolor="#99FF99"><span class="style4 style22 style5 style6">Block-4 :- </span></td>
      <td width="377" bgcolor="#FFCC00"><span class="style22 style4 style5 style8">Size:<%=(a4-a3)%>Bytes</span></td>
    </tr>
	
    <tr>
      <td width="173" height="40" bgcolor="#99FF99"><span class="style4 style22 style5 style6">Content :- </span></td>
      <td bgcolor="#FFCC00">
        <span class="style9">
        <textarea name="text4" cols="50" rows="8" readonly="readonly"><%= encryptedValue4 %></textarea>
        </span> </td>
    </tr>
    <tr>
      <td height="42" bgcolor="#99FF99"><span class="style4 style22 style5 style6">MAC-4 :- </span></td>
      <td bgcolor="#FFCC00"><input name="t4" type="text" id="t4" value="<%= h[4] %>" size="50" readonly="readonly" /></td>
    </tr>
	<tr>
      <td height="40" bgcolor="#99FF99"><span class="style4 style22 style5 style6">Accessible to :- </span></td>
      <td bgcolor="#FFCC00"><input name="ac4" type="text" id="t4" value="Others" size="50" /></td>
    </tr>
    <tr>
      <td><span class="style22"></span></td>
      <td><span class="style22"></span></td>
    </tr>
    <tr>
      <td></td>
      <td><input name="Submit2" type="submit" value="Upload" /></td>
    </tr>
  </table>
</form>
<%
}
else
{
%>
<p>File name already exist ! </p>

<%
}
	   

         connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>		  
		  
		  
	<p align="right"><a href="do_upload_file.jsp">Back</a></p>	  
		  
		  
		  
		
      </div>
      <div class="sidebar">
	  <p class="style9">&nbsp;</p>
        <div class="gadget">
          <p class="star style1">Data Owner Menu</p>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="do_main.jsp">Data Owner Main</a></li>
            <li><a href="do_login.jsp">Log Out</a></li>
          </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2><span>Image</span> Gallery</h2>
        <a href="#"><img src="images/gal1.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal2.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal3.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal4.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal5.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal6.jpg" width="75" height="75" alt="" class="gal" /></a> </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center></div>
</body>
</html>
