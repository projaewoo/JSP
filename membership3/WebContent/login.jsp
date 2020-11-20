<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f8f8f8;
            padding: 60px 0;
        }
        
        #login-form > div {
            margin: 15px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <div class="panel-title">로그인</div>
                </div>
                <div class="panel-body">
                    <form id="login-form" action="login_ok.jsp" method="POST">
                        <div>
                            <input type="text" class="form-control" name="userid" id="userid" placeholder="login" autofocus value="${sessionScope.userid  }">
                        </div>
                        <div>
                            <input type="password" class="form-control" name="passwd" id="userid" placeholder="Passwd">
                        </div>
                        <div>
                            <button type="submit" class="form-control btn btn-primary">로그인</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
