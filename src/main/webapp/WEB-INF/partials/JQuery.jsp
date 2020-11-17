<%--
  Created by IntelliJ IDEA.
  User: caleb
  Date: 11/17/20
  Time: 8:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<script>

    $('.searchAds').hide();
    $('#search').keyup(function() {
        if($('#search').val() !== "") {
            $('.allAds').hide();
            $('.searchAds').show();
        }
        else if($('#search').val() === "") {
            $('.searchAds').hide();
            $('.allAds').show();
        }

    })

</script>