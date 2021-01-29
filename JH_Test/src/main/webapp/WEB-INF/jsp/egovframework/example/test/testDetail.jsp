<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-Type" content="text/html"; charset="UTF-8">
<meta name="viewport" content="width=device-width, intial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<link href="/css/test/test.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
    <div class="container">
        <table class="table table-bordered">
            <thead>
                <h2>글 상세보기</h2>
            </thead>
            <tbody>
                <form action="updateTest.do" id="viewForm" method="POST" enctype="multiplart/form-data">
                    <tr>
                        <th>글번호:</th>
                        <td>
                            <input name="testId" type="text" value="${result.testId}" class="form-control" readonly />
                        </td>
                    </tr>
                    <tr>
                        <th>제목:</th>
                        <td>
                            <input type="text" value="${result.testTitle}" name="testTitle" class="form-control"/>
                        </td>
                    </tr>
                    <tr>
                        <th>내용:</th>
                        <td>
                            <textarea name="testContent" class="form-control" style="height: 200px;">${result.testContent}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button id="btn_previous" type="button" class="btn_previous">이전</button>
                            <button id="btn_delete" type="button" class="btn_delete">삭제</button>
                            <button id="btn_modify" type="button" class="btn_modify">수정</button>
                    </tr>        
                </form>
            </tbody>
        </table>
    </div>
</body>
<script>
    $(document).on('click', '#btn_modify', function(e) {
        if(confirm("정말 수정하시겠습니까?")==true) {
            $("#viewForm").submit();   
        } else {
            return;
        } 
    });

    $(document).on('click', '#btn_delete', function(e) {
        if(confirm("정말 삭제하시겠습니까?")==true) {
            $("#viewForm").attr("action","deleteTest.do");
            $("#viewForm").submit();   
        } else {
            return;
        } 
    });

    $("#btn_previous").click(function javascript_onclikc() {
		$(location).attr('href', 'testList.do');
	});
</script>
</html>