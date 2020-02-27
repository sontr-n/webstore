<%@page import="com.webstore.app.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="/resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <!-- js -->
        <script src="/resources/js/jquery.min.js"></script>
        <script src="/resources/js/bootstrap-notify.min.js"></script>
        <script type="text/javascript">
        
        
        function checkNewBill(){
    		$.ajax({
				url : "/bill/news",
				type : "GET",
				async : false,
				success : function(data) {
					$.each(data, function(idx, obj){
						generateNotify('Khách hàng có sđt: ' + obj + ' vừa đặt hàng.');
					});
				},
				error : function(jqXHR, status, errorThrown) {
					console.log(errorThrown)
				}
				});
    	}
        
        
        function generateNotify(mess) {
			$.notify({
			      title: '<strong>Thông báo: </strong>',
			      icon: 'glyphicon glyphicon-star',
			      message: mess
			    },{
			      type: 'info',
			      animate: {
					    enter: 'animated fadeInDown',
			        	exit: 'animated fadeOutUp'
			      },
			      placement: {
			        from: "top",
			        align: "right"
			      },
			      newest_on_top: true,
			      offset: 40,
			      spacing: 10,
			      z_index: 1031,
			    template: '<div data-notify="container" class="col-xs-11 col-sm-3 alert alert-{0}" role="alert">' +
				'<button type="button" aria-hidden="true" class="close" data-notify="dismiss">×</button>' +
				'<span data-notify="icon"></span> ' +
				'<span data-notify="title">{1}</span> ' +
				'<span data-notify="message">{2}</span>' +
				'<div class="progress" data-notify="progressbar">' +
					'<div class="progress-bar progress-bar-{0}" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>' +
				'</div>' +
				'<a href="{3}" target="{4}" data-notify="url"></a>' +
			'</div>'
			    });
		}
        
        $(document).ready(function(){
        	
        	
        	setInterval(function(){ 
        		//generateNotify("test")
        		checkNewBill();
        		}, 15000);
        });
        
        </script>
    </head>
    <body>
        <div id="header">
            <div class="inHeader">
                <div class="mosAdmin">
                    Hello, Administrator<br>         
                    <a href='/admin/logout'>Log out</a>
                </div>
                <div class="clear"></div>
            </div>
        </div>

    </body>
</html>
