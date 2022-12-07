<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  	<title>Insert title here</title>
  	<style>
  .heart {
    width: 30px;
    height: 30px;
    background: #ea2027;
    position: relative;
    transform: rotate(45deg);
  }
  .heart::before,
  .heart::after {
    content: "";
    width: 30px;
    height: 30px;
    position: absolute;
    border-radius: 50%;
    background: #ea2027;
  }
  .heart::before {
    left: -50%;
  }
  .heart::after {
    top: -50%;
  }
</style>
 
</head>

<body>
 <div class="heart"></div>

</body>

</html>
