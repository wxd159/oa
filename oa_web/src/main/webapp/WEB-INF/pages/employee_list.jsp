<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 员工列表 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block">
            <form method="post" action="/employee/search" id="admin-form">
                <div class="section row">
                    <div class="col-md-6">
                        <label for="name" class="field prepend-icon">
                            <input type="name" name="name" id="name" style="height:40px" placeholder="姓名..." >
                            <button type="submit" class="button"> 搜索</button>
                        </label>
                    </div>
                </div>
            </form>
        </div>


        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel  heading-border">
                <div class="panel-menu">
                    <div class="row">
                        <div class="hidden-xs hidden-sm col-md-3">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-refresh"></i>
                                </button>
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-trash"></i>
                                </button>
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-plus"
                                       onclick="javascript:window.location.href='/employee/to_add';"></i>
                                </button>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-9 text-right">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-chevron-left" onclick="javascript:window.location.href='/employee/list?page=${sessionScope.pageInfo-1}';"></i>
                                </button>
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-chevron-right" onclick="javascript:window.location.href='/employee/list?page=${sessionScope.pageInfo+1}';"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-body pn">
                    <table id="message-table" class="table admin-form theme-warning tc-checkbox-1">
                        <thead>
                        <tr class="">
                            <th class="text-center hidden-xs">Select</th>
                            <th class="hidden-xs" style="text-align: center">工号</th>
                            <th class="hidden-xs" style="text-align: center">姓名</th>
                            <th class="hidden-xs" style="text-align: center">所属部门</th>
                            <th class="hidden-xs" style="text-align: center">职务</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="emp">
                            <tr class="message-unread">
                                <td class="hidden-xs">
                                    <label class="option block mn">
                                        <input type="checkbox" name="mobileos" value="FR">
                                        <span class="checkbox mn"></span>
                                    </label>
                                </td>
                                <td style="text-align: center">${emp.sn}</td>
                                <td style="text-align: center">${emp.name}</td>
                                <td class="text-center fw600" style="text-align: center">${emp.department.name}</td>
                                <td class="hidden-xs" style="text-align: center">
                                    <span class="badge badge-warning mr10 fs11" style="text-align: center">${emp.post}</span>
                                </td>
                                <td>
                                    <a href="/employee/to_update?sn=${emp.sn}">编辑</a>
                                    <a href="/employee/remove?sn=${emp.sn}">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>