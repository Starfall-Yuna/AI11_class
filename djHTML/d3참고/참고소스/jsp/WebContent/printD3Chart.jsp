<%@page import="com.lec.myjsp.Vo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://d3js.org/d3.v3.min.js"></script>
<style>
svg {
	height: 2400px;
	width: 2400px;
}

rect {
	fill: red
}
</style>
</head>
<body>
	<svg id="myg"></svg>
	<script>
	console.log('<%="안녕 Test"%>')
	let data = []
	
	<c:forEach items="${datas}" var="dto">
	data.push({
		name: "${dto.name}",
		value : "${dto.value}"}
	)
</c:forEach>
	
 d3.select("#myg")
.selectAll("rect")
.data(data)
.enter()
.append("rect")
.attr("x",function(d,i){return i*75})
.attr("y",function(d,i){return 200-data[i].value} )
.attr("height",(d,i)=>{return d.value})
.attr("width", "25")

d3.select("#myg")
.selectAll("text")
.data(data)
.enter()
.append("text")
.attr("x",function(d,i){return i*77})
.attr("y",function(d,i){return 200-data[i].value} )
.attr("height",(d,i)=>{return d.value})
.attr("width", "25")
.attr("font-family", "sans-serif")
    .attr("font-size", "11px")
    .attr("fill", "black")
    .attr("text-anchor", "left")
    .text((d)=>{return d.name});
    
    </script>
</body>
</html>