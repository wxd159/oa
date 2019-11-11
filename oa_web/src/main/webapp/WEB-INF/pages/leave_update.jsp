<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 填写请假条 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <form:form id="admin-form" name="addForm" action="/leaveInfo/update" modelAttribute="info">
                <form:hidden path="id"/>
                <form:hidden path="createSn"/>
                <form:hidden path="createTime"/>
                <div class="panel-body bg-light">
                    <div class="section-divider mt20 mb40">
                        <span> 请假信息 </span>
                    </div>
                    <div class="section row">
                        <label for="reason" class="field prepend-icon">
                            <form:input path="reason" cssClass="gui-input" placeholder="事由..."/>
                            <label for="reason" class="field-icon">
                                <i class="fa fa-lock"></i>
                            </label>
                        </label>
                    </div>
                    <div class="section row">
                        <div class="col-md-6">
                            <label for="startTime" class="field prepend-icon">
                                <form:input path="startTime" cssClass="gui-input" placeholder="开始时间..."/>
                                <label for="startTime" class="field-icon">
                                    <i class="fa fa-lock"></i>
                                </label>
                            </label>
                        </div>
                        <div class="col-md-6">
                            <label for="endTime" class="field prepend-icon">
                                <form:input path="endTime" cssClass="gui-input" placeholder="结束时间..."/>
                                <label for="endTime" class="field-icon">
                                    <i class="fa fa-lock"></i>
                                </label>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="panel-footer text-right">
                    <button type="submit" class="button"> 保存</button>
                    <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回
                    </button>
                </div>
            </div>
            </form:form>
        </div>
    </div>
    </div>
</section>


<jsp:include page="bottom.jsp"/>