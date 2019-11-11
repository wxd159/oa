<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.nuc.oa.global.Contant" %>
<%@ include file="top.jsp" %>
<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 待处理劳动关系信息 </h2>
            <p class="lead"></p>
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
                                       onclick="javascript:window.location.href='/labor_relation/to_add';"></i>
                                </button>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-9 text-right">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-chevron-left" onclick="javascript:window.location.href='/labor_relation/deal?page=${sessionScope.pageInfo-1}';"></i>
                                </button>
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-chevron-right" onclick="javascript:window.location.href='/labor_relation/deal?page=${sessionScope.pageInfo+1}';"></i>
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
                            <th>状态</th>
                            <th class="hidden-xs">类型</th>
                            <th class="text-center">创建时间</th>
                            <th class="hidden-xs">创建人</th>
                            <th class="hidden-xs">事由</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="laborRelation">
                            <tr class="message-unread">
                                <td class="hidden-xs">
                                    <label class="option block mn">
                                        <input type="checkbox" name="mobileos" value="FR">
                                        <span class="checkbox mn"></span>
                                    </label>
                                </td>
                                <td class="hidden-xs">
                                    <span class="badge badge-warning mr10 fs11">${laborRelation.status}</span>
                                </td>
                                <td>${laborRelation.item}</td>
                                <td><spring:eval expression="laborRelation.createTime"/></td>
                                <td>${laborRelation.creater.name}</td>
                                <td>${laborRelation.cause}</td>
                                <td>
                                    <c:if test="${laborRelation.status==Contant.CREATED || laborRelation.status==Contant.BACK}">
                                        <a href="/labor_relation/to_update?id=${laborRelation.id}">修改</a>
                                        <a href="/labor_relation/submit?id=${laborRelation.id}">提交</a>
                                    </c:if>
                                    <c:if test="${laborRelation.status==Contant.SUBMIT || laborRelation.status==Contant.RECHECK}">
                                        <a href="/labor_relation/to_check?id=${laborRelation.id}">审核</a>
                                    </c:if>
                                    <a href="/labor_relation/detail?id=${laborRelation.id}">详细信息</a>
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
