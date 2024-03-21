<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!-- <h1>${page}</h1> -->

<div class="container w-25">
	<c:forEach var="value" items="${users}">
		<div class="card mt-4">
		  <div class="card-body text-center">
		    ${value}
		  </div>
		</div>
	</c:forEach>
</div>

<div class="px-4 pt-5 my-5 text-center border-bottom">
    <h1 class="display-4 fw-bold text-body-emphasis">SmartAttendance</h1>
    <div class="col-lg-6 mx-auto">
      <p class="lead mb-4">This is a attendance system for better future this for faster attendance system then regular attendance system <br>This attendance is made using Java Spring Boot</p>
      <div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">
        <a href="/checking" class="btn btn-primary btn-lg px-4 me-sm-3">Check Your attendance</a>
        <a href="/login" class="btn btn-outline-secondary btn-lg px-4">Use as teacher</a>
      </div>
    </div>
    <div class="overflow-hidden" style="max-height: 30vh;">
      <div class="container px-5">
        <img src="https://media.istockphoto.com/id/1458169384/photo/education-internet-technology-person-who-attends-online-lessons-on-a-digital-screen-education.webp?b=1&s=170667a&w=0&k=20&c=rlWolO4U9U5ENEd3_z_QXpGFR4ivuJ6MM6lGFtIHfZU=" class="img-fluid border rounded-3 shadow-lg mb-4" alt="Example image" width="700" height="500" loading="lazy">
      </div>
    </div>
</div>

<div class="container px-4 py-5" id="featured-3">
    <h2 class="pb-2 border-bottom">Our Features</h2>
    <div class="row g-4 py-5 row-cols-1 row-cols-lg-3">
      <div class="feature col">
        <div class="feature-icon d-inline-flex align-items-center justify-content-center text-bg-primary bg-gradient fs-2 mb-3 rounded-4">
          <!-- <svg class="bi" width="1em" height="1em"><use xlink:href="#collection"></use></svg> -->
		  <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-shield-fill-check m-3" viewBox="0 0 16 16">
			<path fill-rule="evenodd" d="M8 0c-.69 0-1.843.265-2.928.56-1.11.3-2.229.655-2.887.87a1.54 1.54 0 0 0-1.044 1.262c-.596 4.477.787 7.795 2.465 9.99a11.8 11.8 0 0 0 2.517 2.453c.386.273.744.482 1.048.625.28.132.581.24.829.24s.548-.108.829-.24a7 7 0 0 0 1.048-.625 11.8 11.8 0 0 0 2.517-2.453c1.678-2.195 3.061-5.513 2.465-9.99a1.54 1.54 0 0 0-1.044-1.263 63 63 0 0 0-2.887-.87C9.843.266 8.69 0 8 0m2.146 5.146a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 7.793z"/>
		  </svg>
        </div>
        <h3 class="fs-2 text-body-emphasis">Fast and Secure</h3>
        <p>We provide the fast and secure app for your work. It's help's you</p>
        <a href="#" class="icon-link">
          	View more
          	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
				<path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
			</svg>
        </a>
      </div>
      <div class="feature col">
        <div class="feature-icon d-inline-flex align-items-center justify-content-center text-bg-primary bg-gradient fs-2 mb-3 rounded-4">
          <!-- <svg class="bi" width="1em" height="1em"><use xlink:href="#people-circle"></use></svg> -->
		  <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-bullseye m-3" viewBox="0 0 16 16">
			<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
			<path d="M8 13A5 5 0 1 1 8 3a5 5 0 0 1 0 10m0 1A6 6 0 1 0 8 2a6 6 0 0 0 0 12"/>
			<path d="M8 11a3 3 0 1 1 0-6 3 3 0 0 1 0 6m0 1a4 4 0 1 0 0-8 4 4 0 0 0 0 8"/>
			<path d="M9.5 8a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0"/>
		  </svg>
        </div>
        <h3 class="fs-2 text-body-emphasis">Easy to use</h3>
        <p>We provide a user friendly ui for use the app for your work.</p>
        <a href="#" class="icon-link">
			View more
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
				<path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
			</svg>
        </a>
      </div>
      <div class="feature col">
        <div class="feature-icon d-inline-flex align-items-center justify-content-center text-bg-primary bg-gradient fs-2 mb-3 rounded-4">
          <!-- <svg class="bi" width="1em" height="1em"><use xlink:href="#toggles2"></use></svg> -->
		  <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="m-3 bi bi-cloud-arrow-down-fill" viewBox="0 0 16 16">
			<path d="M8 2a5.53 5.53 0 0 0-3.594 1.342c-.766.66-1.321 1.52-1.464 2.383C1.266 6.095 0 7.555 0 9.318 0 11.366 1.708 13 3.781 13h8.906C14.502 13 16 11.57 16 9.773c0-1.636-1.242-2.969-2.834-3.194C12.923 3.999 10.69 2 8 2m2.354 6.854-2 2a.5.5 0 0 1-.708 0l-2-2a.5.5 0 1 1 .708-.708L7.5 9.293V5.5a.5.5 0 0 1 1 0v3.793l1.146-1.147a.5.5 0 0 1 .708.708"/>
		  </svg>
        </div>
        <h3 class="fs-2 text-body-emphasis">Updates</h3>
        <p>We provide more update in future for better user experience for out users.</p>
        <a href="#" class="icon-link">
			View more
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
				<path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
			</svg>
        </a>
      </div>
    </div>
</div>