<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <!-- HEAD START -->
    <jsp:include page="../includes/head.jsp" flush="false" />
    <!-- //HEAD START -->
</head>
<body>
<div id="wrapper">
    <jsp:include page="../includes/header.jsp" flush="false" />
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">게시글 등록</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-7">
                <div class="panel panel-default">

                    <div class="panel-heading">
                        ${boardDto.bbsWriterId}
                    </div>
                    <form id="frm" action="" method="post">
                        <input type="hidden" id="method" name="_method">
                        <input type="hidden" id="bbsId" name="bbsId" value="<c:out value='${boardDto.bbsId}'/>" >
                        <div class="panel-body">
                            <div class="col-sm-6">
                                <div class="form-group input-group">
                                    <span class="input-group-addon">분류</span>
                                    <select name="groupCd" class="form-control" >
                                        <option>게시판 선택</option>
                                        <option>free</option>
                                        <option>news</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group input-group">
                                    <span class="input-group-addon">제목</span>
                                    <input type="text" class="form-control" name="bbsTitle" value="<c:out value='${boardDto.bbsTitle}'/>" placeholder="제목을 입력해 주세요.">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <%--<span class="input-group-addon">내용</span>--%>
                                    <textarea id="summernote" class="form-control" name="bbsContent">${boardDto.bbsContent}</textarea>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="panel-footer">
                        <button type="button" class="btn btn-default" onclick="fnSave()">저장</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../includes/footer.jsp" flush="false" />
</div>

<jsp:include page="../includes/foot.jsp" flush="false" />

<script type="text/javascript">
    $(document).ready(function(){
        summernote();
    });

    function fnSave(){
        const bbsId = parseInt($("#bbsId").val());
        if(bbsId>0){    //수정
            const groupCd = $("select[name=groupCd]").val();
            $("#method").val("put");
            $("#frm").attr("action", "/board/"+groupCd+"/"+bbsId).submit();
        }else{  //등록
            $("#frm").attr("action", "/board/write").submit();
            $("#frm").submit();
        }
    }

</script>
</body>
</html>

