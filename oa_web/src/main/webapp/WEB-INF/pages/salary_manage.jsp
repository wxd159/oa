<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 工资管理 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel  heading-border">
                <div class="panel-menu">
                    <div class="row">
                        <div class="hidden-xs hidden-sm col-md-3">
                            <div class="btn-group">
                                <button type="button" class="button">
                                    <i onclick="javascript:window.location.href='/salary/manage';">生成工资单</i>
                                </button>
                            </div>
                            <div class="btn-group">
                                <button type="button" class="button">
                                    <i onclick="javascript:window.location.href='/salary/export';">导出</i>
                                </button>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-9 text-right">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-chevron-left" onclick="javascript:window.location.href='/salary/manage?page=${sessionScope.pageInfo-1}';"></i>
                                </button>
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-chevron-right" onclick="javascript:window.location.href='/salary/manage?page=${sessionScope.pageInfo+1}';"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-body pn">
                    <table id="message-table" class="table admin-form theme-warning tc-checkbox-1">
                        <thead>
                        <tr class="">
                            <th class="hidden-xs" style="text-align: center">姓名</th>
                            <th class="hidden-xs" style="text-align: center">日期</th>
                            <th class="hidden-xs" style="text-align: center">基础工资</th>
                            <th class="hidden-xs" style="text-align: center">出勤次数</th>
                            <th class="hidden-xs" style="text-align: center">出勤奖金</th>
                            <th class="hidden-xs" style="text-align: center">总计</th>
                            <th class="hidden-xs" style="text-align: center">税金</th>
                            <th class="hidden-xs" style="text-align: center">实发金额</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="salary">
                            <tr class="message-unread">
                                <td style="text-align: center">${salary.name}</td>
                                <td style="text-align: center">${salary.times}</td>
                                <td style="text-align: center">${salary.baseSalary}</td>
                                <td style="text-align: center"> ${salary.sign_in_number}</td>
                                <td style="text-align: center">${salary.attendance_bonus}</td>
                                <td style="text-align: center">${salary.total}</td>
                                <td style="text-align: center">${salary.tax}</td>
                                <td style="text-align: center">${salary.pay}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="panel-footer text-right">
                    <button type="button" class="button">
                        <i onclick="javascript:window.location.href='/salary/insert';">确定</i>
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>