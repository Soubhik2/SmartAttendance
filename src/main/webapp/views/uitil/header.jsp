<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<% String pagename = (String) request.getAttribute("page"); %>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">SmartAttendance</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link <% out.print(pagename.equals("home")?"active":""); %>" aria-current="page" href="/">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <% out.print(pagename.equals("about")?"active":""); %>" href="/about">About</a>
        </li>
        
      </ul>
      <div class="left">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link" aria-current="page" href="/login">Login</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</nav>