<%--
  Created by IntelliJ IDEA.
  User: caleb
  Date: 11/17/20
  Time: 8:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
        integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
        $('.searchAds').hide();
        $('#search').keyup((e) => {
                $('.allAds').hide();
                $('.searchAds').show();
                console.log($('#search').val())

                let searchVal = $('#search').val();
                let ads = jQuery.makeArray($('.searchContainer'));

            // console.log(ads)
                for(let ad of ads) {
                    console.log(ad.html)
                }


                e.preventDefault();

                let value = $('#search').val();
                if (value === "") {
                    $('.searchAds').hide();
                    $('.allAds').show();
                }
        })
    })


</script>