<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <spring:message code="jsp.include.charset"/>
    <spring:message code="jsp.include.equiv"/>
    <spring:message code="jsp.include.viewport"/>
    
    <base href="<%=basePath%>">
    
    <title>投递管理-求职者</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">  
	
	<spring:message code="jsp.include.basecss"/>
	<spring:message code="jsp.include.listcssforback"/>
	<link rel="stylesheet" href="http/business/login/css/public.css">
	
  </head>
  
  <body>
  	<div class="container">
	  		 <div class="table-responsive">
				<div class="panel-heading-choose">投递管理-管理员</div>
			  	<div id="searchDiv"></div>
				<table id="table-javascript" ></table>
	    	</div>
    	</div>
    	<spring:message code="jsp.include.basejs"/>
    	<spring:message code="jsp.include.listjsforback"/>
    	
    	<script type="text/javascript">
    		
    		$(document).ready(function () {
		       	$("#table-javascript").initBootTable({
		       		method: 'post',
		       		searchDiv:"searchDiv",
	                url: 'business/deliver/manageList.do',
	                addUrl:"",
	                striped: true,
	                pagination: true,
	                sidePagination:"server",
	                pageSize: 10,
	                minimumCountColumns: 2,
	                permissionOperate:function(data){
	                	var op={};
	                	if(data.interviewStatusCode && (data.interviewStatusCode!="dhmstg" 
		                			&& data.interviewStatusCode!="dhmswjt" 
		                				&& data.interviewStatusCode!="dhmsbtg")){
	                		op["dhms"]="false";
	                	}
	                	if(data.interviewStatusCode!="xcmstg") {
	                		op["entrant"]="false";
	                	}
	                	return op;
	                }, 
	                rowButtons:[ // select 表示选择规则，1表示多选，0表示单选，空表示不选
                            {name:'电话确认',position:'row',select:"",css:"dhms",dialog:{url:"business/interview/toDhInterview.do",width:"850px",height:"500px"}},//电话确认、预约时间
                        	{name:'报到入职',position:'row',select:"",css:"entrant",dialog:{url:"business/entrant/toAddUpdate.do",width:"850px",height:"500px"}},//报到入职
                            {name:'详情',position:'row',select:"",css:"view",dialog:{url:"business/deliver/toView.do",width:"850px",height:"500px"}}//详情
	                ],
	                clickToSelect: true,
	                columns: [
				                	//{field: 'statu_msb',checkbox: true},   //复选框
				                	{field: 'id',title:'id',visible:false}, 
				                	{field: 'interviewStatusCode',title:'interviewStatusCode',visible:false}, 
				                    {field: 'customerName',title: '公司名称',align: 'center',valign: 'middle',searchable:true}, //公司名称
				                    {field: 'requirementName',title: '需求名称',align: 'center',valign: 'middle'}, //需求名称
				                    {field: 'addressName',index:'address',title: '地址',align: 'left',valign: 'top'},	//地址
				                    {field: 'resumeName',title: '简历',align: 'center',valign: 'middle',searchable:true}, //投递人
				                    {field: 'positionName',title: '申请岗位',align: 'center',valign: 'middle',searchable:true}, //招聘岗位
				                    {field: 'yearsName',title: '工作年限',align: 'center',valign: 'middle',searchable:true,type:'select:work_life',selectCode:"id"}, //工作年限
				                    {field: 'degreeName',title: '学历',align: 'left',valign: 'top',searchable:true,type:'select:degree',selectCode:"id"},//学历
				                    {field: 'status',formatter:"dictCode:deliver_status",title: '投递状态',align: 'left',valign: 'top',searchable:true,type:'select:deliver_status',selectCode:"id"},//投递状态
				                    {field: 'interviewStatusName',title: '面试状态',align: 'left',valign: 'top',searchable:true,type:'select:dhms,xcms',selectCode:"id"},//面试状态
				                    {field: 'deliverTime',formatter:"date:yyyy-MM-dd hh:mm:ss",title: '投递时间',align: 'left',valign: 'top'}	//投递时间
				                  ]
	            	});
		    	});
		    	
    	</script>
  </body>
</html>
