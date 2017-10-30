<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"></jsp:include>
<script type="text/javascript">

function write_note() {
	if(validateMode()){
		
		/* var myWindow = window.open("", "myWindow", "width=13000, height=10000,");
	    myWindow.document.write("<p>잠시만 기다려주세요'</p>");
	    setTimeout(function(){ myWindow.close() }, 1000);
	    setTimeout(function(){ document.writeFrm.submit() }, 1001); */
	     
	  /*   myWindow.opener.document.write("<p>This is the source window!</p>") */;
	/*   $('.crud').one('click',function(){
	    	document.writeFrm.submit()
	    	
	    }) */
	    if(${memberVO.theme == 1}){
	        $('.navbar').toggleClass("animateCocoaProcess");
	        }else{
	        	$('.navbar').toggleClass("animatePeachProcess");
	        }
	    setTimeout(function(){ document.writeFrm.submit() }, 1000);
		
		
		return true;
	}
	return false;
}

function update_note() {
	document.updateFrm.content.value=oDoc.innerHTML;
/* 	var myWindow = window.open("", "myWindow", "width=13000, height=10000,");
    myWindow.document.write("<p>잠시만 기다려주세요.'</p>");
    setTimeout(function(){ myWindow.close() }, 1000);
    setTimeout(function(){ document.updateFrm.submit() }, 1001);
  
    document.updateFrm.submit() */
    
    /* $('.crud').one('click',function(){
    	document.updateFrm.submit()
    	
    }) */
    if(${memberVO.theme == 1}){
    $('.navbar').toggleClass("animateCocoaProcess");
    }else{
    	$('.navbar').toggleClass("animatePeachProcess");
    }
	setTimeout(function(){ document.updateFrm.submit() }, 1000);
	
	
	
}

function deleteNote(no) {
	if(no != '0'){
	if(confirm("정말 삭제할까요?")){
   location.href="DispatcherServlet?command=deleteDiary&no="+no;
	}else{}
}else{alert("삭제할 노트가 없습니다.");}
}

var oDoc, sDefTxt;
function initDoc() {
	oDoc = document.getElementById("textBox");
	<c:if test="${note.content!=null}">
		oDoc.innerHTML = '${note.content}';
	</c:if>
	sDefTxt = oDoc.innerHTML;
}
function formatDoc(sCmd, sValue) {
	if (validateMode()) { document.execCommand(sCmd, false, sValue); oDoc.focus(); }
}
	
function validateMode() {
	
	return true;
}
	
</script>

<div class="row" style="min-height:650px">
   <div class="col-8">
      <div class="card rounded-content" style="width: 100%; min-height: 75%;">
         <div class="card-body">
         	<div class="row">
            	<input class="newNoteBtn" id="writeBtn" type="button" value="+" onclick="write_note();" />
            </div>
            <form class="hidden_form" name="writeFrm" method="post" action="DispatcherServlet">
               <input type="text" name="title" value="새 노트" />
               <textarea name="content">여기에 입력하세요.</textarea>
               <input type="hidden" name="command" value="writeNote" /> 
               <input type="hidden" name="isCurr" value="true" />
            </form>
			
			<form action="DispatcherServlet" name="updateFrm" method="post">
				<input class="form-invisible note-title" type="text" value="${note.title}" name="title"> 
				<span class="text-muted" style="padding-left:10px;">최종 수정 ${note.currentDate.year}/${note.currentDate.month}/${note.currentDate.date} ${note.currentDate.hour}:${note.currentDate.minute}</span>
				<div class="dropdown-divider"></div>
				<div id="toolBar1">
					<select onchange="formatDoc('fontname',this[this.selectedIndex].value);this.selectedIndex=0;">
						<option class="heading" selected>- font -</option>
						<option>Arial</option>
						<option>Arial Black</option>
						<option>Courier New</option>
						<option>Times New Roman</option>
					</select>
					<select onchange="formatDoc('fontsize',this[this.selectedIndex].value);this.selectedIndex=0;">
						<option class="heading" selected>- size -</option>
						<option value="1">Very small</option>
						<option value="2">A bit small</option>
						<option value="3">Normal</option>
						<option value="4">Medium-large</option>
						<option value="5">Big</option>
						<option value="6">Very big</option>
						<option value="7">Maximum</option>
					</select>
					<select onchange="formatDoc('forecolor',this[this.selectedIndex].value);this.selectedIndex=0;">
						<option class="heading" selected>- color -</option>
						<option value="red">Red</option>
						<option value="blue">Blue</option>
						<option value="green">Green</option>
						<option value="black">Black</option>
					</select>
				</div>
				<div id="toolBar2">
					<img class="intLink" title="Bold" onclick="formatDoc('bold');" src="data:image/gif;base64,R0lGODlhFgAWAID/AMDAwAAAACH5BAEAAAAALAAAAAAWABYAQAInhI+pa+H9mJy0LhdgtrxzDG5WGFVk6aXqyk6Y9kXvKKNuLbb6zgMFADs=" />
					<img class="intLink" title="Italic" onclick="formatDoc('italic');" src="data:image/gif;base64,R0lGODlhFgAWAKEDAAAAAF9vj5WIbf///yH5BAEAAAMALAAAAAAWABYAAAIjnI+py+0Po5x0gXvruEKHrF2BB1YiCWgbMFIYpsbyTNd2UwAAOw==" />
					<img class="intLink" title="Underline" onclick="formatDoc('underline');" src="data:image/gif;base64,R0lGODlhFgAWAKECAAAAAF9vj////////yH5BAEAAAIALAAAAAAWABYAAAIrlI+py+0Po5zUgAsEzvEeL4Ea15EiJJ5PSqJmuwKBEKgxVuXWtun+DwxCCgA7" />
					<img class="intLink" title="Left align" onclick="formatDoc('justifyleft');" src="data:image/gif;base64,R0lGODlhFgAWAID/AMDAwAAAACH5BAEAAAAALAAAAAAWABYAQAIghI+py+0Po5y02ouz3jL4D4JMGELkGYxo+qzl4nKyXAAAOw==" />
					<img class="intLink" title="Center align" onclick="formatDoc('justifycenter');" src="data:image/gif;base64,R0lGODlhFgAWAID/AMDAwAAAACH5BAEAAAAALAAAAAAWABYAQAIfhI+py+0Po5y02ouz3jL4D4JOGI7kaZ5Bqn4sycVbAQA7" />
					<img class="intLink" title="Right align" onclick="formatDoc('justifyright');" src="data:image/gif;base64,R0lGODlhFgAWAID/AMDAwAAAACH5BAEAAAAALAAAAAAWABYAQAIghI+py+0Po5y02ouz3jL4D4JQGDLkGYxouqzl43JyVgAAOw==" />
					<img class="intLink" title="Add indentation" onclick="formatDoc('outdent');" src="data:image/gif;base64,R0lGODlhFgAWAMIHAAAAADljwliE35GjuaezxtDV3NHa7P///yH5BAEAAAcALAAAAAAWABYAAAM2eLrc/jDKCQG9F2i7u8agQgyK1z2EIBil+TWqEMxhMczsYVJ3e4ahk+sFnAgtxSQDqWw6n5cEADs=" />
					<img class="intLink" title="Delete indentation" onclick="formatDoc('indent');" src="data:image/gif;base64,R0lGODlhFgAWAOMIAAAAADljwl9vj1iE35GjuaezxtDV3NHa7P///////////////////////////////yH5BAEAAAgALAAAAAAWABYAAAQ7EMlJq704650B/x8gemMpgugwHJNZXodKsO5oqUOgo5KhBwWESyMQsCRDHu9VOyk5TM9zSpFSr9gsJwIAOw==" />
				</div>
				<div id="textBox" class="form-invisible note-content" style="min-height:200px" contenteditable="true"><p>${note.content}</p></div>
                <input type="hidden" name="content" /><br/>
                <div class="d-flex justify-content-end">
                	<input class="button btn bg-pink rounded-bar"   type="button" value="저장" onclick="update_note()" />&nbsp;
                	<input class="btn bg-pink rounded-bar"  type="button" value="삭제" onclick="deleteNote(${note.no})" /> 
                </div>   
                <input  type="hidden" name="command" value="updateNote" /> 
                <input  type="hidden" name="isCurr" value="false" /> 
                <input  type="hidden" name="diaryNo" value="${note.no}" />
			</form>
			</div>
		</div>
	</div>
	<div class="col-4">
		<div class="card rounded-content" style="width: 100%; min-height: 75%;">
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
<script type="text/javascript">
	initDoc();
</script>
<jsp:include page="foot.jsp"></jsp:include>