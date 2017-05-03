<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>题目管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {

        });
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="active"><a href="${ctx}/exam/exam/tExamList">题目列表</a></li>
    <li><a href="${ctx}/exam/exam/tExamForm">添加题目</a></li>
</ul>
<form:form id="searchForm" modelAttribute="exam" action="${ctx}/exam/exam/tExamList" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>名称：</label>
            <form:input path="ename" htmlEscape="false" maxlength="100" class="input-medium"/>
        </li>

        <li><label>语言：</label>
            <form:select path="lan" class="input-medium">
                <form:option value="" label=""/>
                <form:options items="${fns:getDictList('language')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>名称</th>
        <th>语言</th>
        <th>截止时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="exam">
        <tr>
            <td><a href="${ctx}/result/result/tResultList?id=${exam.id}">
                    ${exam.ename}
            </a></td>
            <td>
                    ${fns:getDictLabel(exam.lan, 'language', '')}
            </td>
            <td>
                <fmt:formatDate value="${exam.deadline}" pattern="yyyy-MM-dd"/>
            </td>
            <td>
                <a href="${ctx}/exam/exam/tExamForm?id=${exam.id}">修改</a>
                <a href="${ctx}/exam/exam/delete?id=${exam.id}"
                   onclick="return confirmx('确认要删除该题目吗？', this.href)">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>