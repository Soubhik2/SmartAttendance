<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<% String pages = (String) request.getAttribute("page"); %>

<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">SmartAttendance</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">{user name}</a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="/admin/dashboard" class="nav-link <%= pages.equals("dashboard")?"active":"" %>">
              <!-- <i class="nav-icon fas fa-th"></i> -->
              <i class="nav-icon bi bi-box-fill"></i>
              <p>
                Dashboard
                <!-- <span class="right badge badge-danger">New</span> -->
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="/admin/students" class="nav-link <%= pages.equals("my_students")?"active":"" %>">
              <i class="nav-icon bi bi-clipboard-check-fill"></i>
              
              <p>
                My students
                <!-- <span class="right badge badge-danger">New</span> -->
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="/admin/check" class="nav-link <%= pages.equals("check_attendance")?"active":"" %>">
              <i class="nav-icon bi bi-bar-chart-fill"></i>
              <p>
                Check Attendance
                <!-- <span class="right badge badge-danger">New</span> -->
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="/admin/classes" class="nav-link <%= pages.equals("my_classes")?"active":"" %>">
              <!-- <i class="nav-icon fas fa-th"></i> -->
              <i class="nav-icon bi bi-aspect-ratio-fill"></i>
              <p>
                My Classes
                <!-- <span class="right badge badge-danger">New</span> -->
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="/admin/add" class="nav-link <%= pages.equals("add_students")?"active":"" %>">
              <i class="nav-icon bi bi-plus-circle-fill"></i>
              <p>
                Add students
                <!-- <span class="right badge badge-danger">New</span> -->
              </p>
            </a>
          </li>
          
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>