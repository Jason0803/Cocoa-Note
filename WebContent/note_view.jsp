<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"></jsp:include>
<script type="text/javascript">
function write_note() {
   document.writeFrm.submit();
}

function deleteNote(no) {
   location.href="DispatcherServlet?command=deleteDiary&no="+no;
}
</script>

<div class="row" style="height: 1000px;">
   <div class="col-8">
      <div class="card rounded-content" style="width: 100%; height: 75%;">
         <div class="card-body">
         <div class="row">
            &nbsp;&nbsp;&nbsp;&nbsp;<h4 class="card-title">New Note</h4>
            <input class="btn bg-pink" style="position:absolute; right:3%;" type="button" value="새 노트 작성" onclick="javascript:write_note();">
            </div>
            
            <form class="hidden_form" name="writeFrm" method="post"
               action="DispatcherServlet">
               <input type="text" name="title" value="제목 없음" />
               <textarea name="content">-</textarea>
               <input type="hidden" name="command" value="writeNote" /> 
               <input type="hidden" name="isCurr" value="true" />
            </form>
            
               
               
               <div>
                  <c:forEach var="noteitem" items="${notes}">
                     <a href="DispatcherServlet?command=noteView&diaryNo=${noteitem.no}&isCurr=false">${noteitem.title}</a>
                  </c:forEach>
               <form action="DispatcherServlet" name="updateFrm" method="post">
                  제목<input class="form-control" type="text" value="${note.title}" name="title"> <br />
                  작성일 ${note.writeDate.year}-${note.writeDate.month}-${note.writeDate.date}&nbsp;&nbsp;
                  최근 수정일 ${note.currentDate.year}-${note.currentDate.month}-${note.currentDate.date}<br />
                  <textarea class="form-control" name="content" rows="19">${note.content}</textarea><br/>
                     <div class="d-flex justify-content-end">
                        <input  class="button btn bg-pink rounded-bar" type="submit" value="저장" />&nbsp;
                        <input class="btn bg-pink rounded-bar" type="button" value="노트삭제" onclick="deleteNote(${note.no})" /> 
                     </div>   
                     <input  type="hidden" name="command" value="updateNote" /> 
                     <input  type="hidden" name="isCurr" value="false" /> 
                     <input  type="hidden" name="diaryNo" value="${note.no}" />
               </form>
            </div>
            </div>
            

            

         </div>
      </div>
   
   <div class="col-4">
      <div class="card rounded-content" style="width: 100%; height: 75%;">
         <div class="card-body">
            <h4 class="card-title">Note list</h4>
            <h6 class="card-subtitle mb-2 text-muted"></h6>
            <div class="card-body">
            <c:forEach var="noteitem" items="${notes}">
               
                  
                     <a href="DispatcherServlet?command=noteView&diaryNo=${noteitem.no}&isCurr=false">${noteitem.title}</a>
                  
               <div class="dropdown-divider"></div>
               
            </c:forEach>
            </div>




         </div>
      </div>
   </div>
</div>





<jsp:include page="foot.jsp"></jsp:include>