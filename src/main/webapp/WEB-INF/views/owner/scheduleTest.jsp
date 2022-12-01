<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href='${pageContext.request.contextPath}/css/main.css' rel='stylesheet' />
	<script src='${pageContext.request.contextPath}/js/main.js'></script>
	
	<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      /* initialDate: '2020-09-12', */
     
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      selectable: true,
      events: [
        {
          title: 'Business Lunch',
          start: '2022-11-03T13:00:00',
          constraint: 'businessHours'
        },
        {
          title: 'Meeting',
          start: '2022-11-13T11:00:00',
          constraint: 'availableForMeeting', // defined below
          color: '#257e4a'
        },
        {
          title: 'Conference',
          start: '2022-11-18',
          end: '2022-11-20'
        },
        {
          title: 'Party',
          start: '2022-11-29T20:00:00'
        },

        // areas where "Meeting" must be dropped
        {
          groupId: 'availableForMeeting',
          start: '2022-11-11T10:00:00',
          end: '2022-11-11T16:00:00',
          display: 'background'
        },
        {
          groupId: 'availableForMeeting',
          start: '2022-11-13T10:00:00',
          end: '2022-11-13T16:00:00',
          display: 'background'
        },

        // red areas where no events can be dropped
        {
          start: '2022-11-24',
          end: '2022-11-28',
          overlap: false,
          display: 'background',
          color: '#ff9f89'
        },
        {
          start: '2022-11-06',
          end: '2022-11-08',
          overlap: false,
          display: 'background',
          color: '#ff9f89'
        }
      ]
    });

    calendar.render();
  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style> 
	  
</head>
<body>
	<div id='calendar'></div>
</body>
</html>