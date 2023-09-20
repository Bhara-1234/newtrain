<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/taglib.tld" prefix="tag" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Custom Tag Example</title>
</head>
<body>
    <h1>Custom JSP Tag Example</h1>

    <tag:drop table="t_rain" column="from_station" /><br>
    <tag:drop table="t_rain" column="to_station" />
   
    <p>This is regular JSP content.</p>
   
</body>
</html>
