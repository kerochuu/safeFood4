<%@ page 
	trimDirectiveWhitespaces="true"
	language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<?xml version="1.0" encoding="utf-8"?>

<foodList>
	<c:choose>
		<c:when test="${not empty foodList }">
			<count>${foodList.size()}</count>
			<c:forEach items="${foodList }" var="food">
				<food>
					<code>${food.code }</code>
					<name>${food.name }</name>
					<img>${food.img }</img>
					<supportpereat>${food.supportpereat }</supportpereat>
					<calory>${food.calory }</calory>
					<carbo>${food.carbo }</carbo>
					<protein>${food.protein }</protein>
					<fat>${food.fat }</fat>
					<sugar>${food.sugar }</sugar>
					<natrium>${food.natrium }</natrium>
					<chole>${food.chole }</chole>
					<fattyacid>${food.fattyacid }</fattyacid>
					<transfat>${food.transfat }</transfat>
					<maker>${food.maker }</maker>
					<material>${food.material }</material>
					<allergy>${food.allergy }</allergy>
				</food>
			</c:forEach>
		</c:when>
		
		<c:otherwise>
			<count>0</count>
		</c:otherwise>
	</c:choose>
</foodList>