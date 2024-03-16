<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<h1>${page}</h1>

<div class="container w-25">
	<c:forEach var="value" items="${students}">
		<div class="card mt-4">
		  <div class="card-body text-center">
		    ${value.name}
		  </div>
		</div>
	</c:forEach>
</div>