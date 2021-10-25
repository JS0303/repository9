<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.List"  %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>

<%@ page import="com.model2.mvc.service.domain.Product" %>
<%@ page import="com.model2.mvc.common.Search" %>
<%@ page import="com.model2.mvc.common.Page"%>

<!DOCTYPE html>


<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////
<%

	List<Product> list= (List<Product>)request.getAttribute("list");
	Page resultPage=(Page)request.getAttribute("resultPage");
	
	Search search = (Search)request.getAttribute("search");
	//==> null �� ""(nullString)���� ����
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
	
	System.out.println(":: listProduct�� searchCondition :: "+searchCondition);
	System.out.println(":: listProduct�� searchKeyword :: "+searchKeyword);
%>
/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>

<html>

<head>
<meta charset="EUC-KR">
<title>��ǰ�����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	
	//=====����Code �ּ� ó�� ��  jQuery ���� ======//
	//�˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	function fncGetProductList(currentPage) {
		console.log(currentPage);
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
   		//document.detailForm.submit();
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
}
	//===========================================//
	//==> �߰��Ⱥκ� : "�˻�" ,  productName link  Event ���� �� ó��
	 $(function() {
		
		//==> �˻� Event ����ó���κ�
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����. 
			 $( "td.ct_btn01:contains('�˻�')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
				fncGetProductList(1);
			});
			
			
			//==> productName LINK Event ����ó��
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
			$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
					//Debug..
					//alert(  $( this ).text().trim() );
					self.location ="/product/getProduct?prodName="+$(this).text().trim();
			});
			
			//==> currentPage LINK Event ����ó��
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
			//$("#currentPage").on("click" , function() {
					//Debug.
					//alert(  $( this ).text().trim() );
			//		self.location ="/product/getProduct?prodName="+$(this).text().trim();
			//});
			
			//==> UI ���� �߰��κ�  :  userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			
			//==> �Ʒ��� ���� ������ ������ ??
			//==> �Ʒ��� �ּ��� �ϳ��� Ǯ�� ���� �����ϼ���.					
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
			//console.log ( $(".ct_list_pop:nth-child(1)" ).html() );
			//console.log ( $(".ct_list_pop:nth-child(2)" ).html() );
			//console.log ( $(".ct_list_pop:nth-child(3)" ).html() );
			//console.log ( $(".ct_list_pop:nth-child(4)" ).html() ); //==> ok
			//console.log ( $(".ct_list_pop:nth-child(5)" ).html() ); 
			//console.log ( $(".ct_list_pop:nth-child(6)" ).html() ); //==> ok
			//console.log ( $(".ct_list_pop:nth-child(7)" ).html() ); 
		});	

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">
<!-- ////////////////// jQuery Event ó���� ����� /////////////////////////
<form name="detailForm" action="/product/listProduct?menu=${param.menu}" method="post">
////////////////////////////////////////////////////////////////////////////////////////////////// -->
<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////
				<%
				if (request.getParameter("menu").equals("search")){
				%>
				/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>
				<c:if test="${param.menu=='search'}">
					<td width="93%" class="ct_ttl01">��ǰ �����ȸ</td>
				</c:if>
				<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////
				<%
				}else{
				%>
				/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>
				<c:if test="${param.menu=='manage'}">
					<td width="93%" class="ct_ttl01">��ǰ ����</td>
				</c:if>
				<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////
				<%
				}
				%>
				/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////
				<option value="0" <%= (searchCondition.equals("0") ? "selected" : "")%>>��ǰ��ȣ</option>
				<option value="1" <%= (searchCondition.equals("1") ? "selected" : "")%>>��ǰ��</option>
				<option value="2" <%= (searchCondition.equals("2") ? "selected" : "")%>>��ǰ����</option>
				/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>
				<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
			</select>
			<input type="text" name="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : ''}" class="ct_input_g" style="width:200px; height:19px" />
		</td>
	
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<!-- ////////////////// jQuery Event ó���� ����� /////////////////////////
						<a href="javascript:fncGetProductList(1);">�˻�</a>
						////////////////////////////////////////////////////////////////////////////////////////////////// -->
						�˻�
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >��ü  ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<!-- ////////////////// jQuery Event ó���� ����� /////////////////////////
		<td class="ct_list_b" width="150">��ǰ��</td>
		////////////////////////////////////////////////////////////////////////////////////////////////// -->
		<td class="ct_list_b" width="150">��ǰ��<br>
			<h7>(��ǰ�� click:������</h7>)
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////
	<%
		for(int i=0; i<list.size(); i++) {
			Product product = list.get(i);
		%>
/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>
	
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${i}</td>
			<td></td>
			<td align="left">
			<!-- ////////////////// jQuery Event ó���� ����� /////////////////////////
			<a href="/product/getProduct?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}</a>
			////////////////////////////////////////////////////////////////////////////////////////////////// -->
			${product.prodNo}
			</td>
			
			<td></td>
			<td align="left">${product.price}</td>
			<td></td>
			<td align="left">${product.regDate}</td>
			<td></td>
			<td align="left"></td>	
		</tr>
	</c:forEach>
	<tr>
	<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////
	<% } %>	
/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////
			<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
			<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
			�� ����
			</c:if>
			<% }else{ %>
			<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
				<a href="javascript:fncGetProductList('${ resultPage.currentPage-1}')">�� ����</a>
			</c:if>
			<% } %>
			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
			<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
				<a href="javascript:fncGetProductList('${ i }');">${ i }</a>
			</c:forEach>
			<% 	}  %>
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
			<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
			���� ��
			</c:if>
			<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////
			<% }else{ %>	
			<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
				<a href="javascript:fncGetProductList('${resultPage.endUnitPage+1}')">���� ��</a>
			</c:if>
			<% } %>	
/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>
			
			<jsp:include page="../common/pageNavigator.jsp"/>
			
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>