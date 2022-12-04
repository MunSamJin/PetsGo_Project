<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
<title>All files</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/
      4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/
        jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/
        umd/popper.min.js"></script>
<script    src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/
        bootstrap.min.js"></script>
</head>
 
<body>
    <div class="container h-100">
    <div class="row h-100 justify-content-center align-items-center">
    <div class="col-md-7 table-responsive">
    <h2>Uploaded Files</h2>
    <table id="customerTable" class="table">
    <thead>
            <tr>
                <th>File Name</th>
                <th>File Type</th>
            </tr>
    </thead>
    <tbody>
            <tr th:each="file: ${allFiles}">
                <td th:text="${file.fileName}"></td>
                <td th:text="${file.fileType}"></td>
            </tr>
    </tbody>
    </table>
    <hr>
    <div>
         <a href="/" class="btn btn-light btn-block"
           role="button">Back to Upload Form</a>
    </div>
    </div>
    </div>
    </div>
</body>
</html>