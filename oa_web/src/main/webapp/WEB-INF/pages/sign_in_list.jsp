<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 考勤记录 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel  heading-border">
                <div class="panel-menu">
                    <div class="row">
                        <div class="hidden-xs hidden-sm col-md-3">
                            <div class="btn-group">
                                <button type="button" class="button">
                                    <i onclick="javascript:window.location.href='/sign_in/sign';">签到</i>
                                </button>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-9 text-right">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-chevron-left" onclick="javascript:window.location.href='/sign_in/list?page=${sessionScope.pageInfo-1}';"></i>
                                </button>
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-chevron-right" onclick="javascript:window.location.href='/sign_in/list?page=${sessionScope.pageInfo+1}';"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-body pn">
                    <table id="message-table" class="table admin-form theme-warning tc-checkbox-1">
                        <thead>
                        <tr class="">
                            <th class="hidden-xs" style="text-align: center">工号</th>
                            <th class="hidden-xs" style="text-align: center">姓名</th>
                            <th class="hidden-xs" style="text-align: center">签到时间</th>
                            <th class="hidden-xs" style="text-align: center">签到状态</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="signIn">
                            <tr class="message-unread">
                                <td style="text-align: center">${signIn.signInSn}</td>
                                <td style="text-align: center">${signIn.employee.name}</td>
                                <td style="text-align: center"><spring:eval expression="signIn.signInTime"/></td>
                                <td style="text-align: center" class="text-center fw600">${signIn.status}</td>
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