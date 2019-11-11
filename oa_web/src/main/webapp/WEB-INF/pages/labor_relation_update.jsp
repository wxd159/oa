<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="top.jsp" %>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 劳动关系管理 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <form:form id="admin-form" name="addForm" action="/labor_relation/update" modelAttribute="labor_relation">
                    <form:hidden path="id"/>
                    <form:hidden path="createSn"/>
                    <form:hidden path="createTime"/>
                <div class="panel-body bg-light">
                    <div class="section-divider mt20 mb40">
                        <span> 关系申请 </span>
                    </div>
                    <div class="section row">
                        <div class="col-md-6">
                            <label for="item" class="field select">
                                <form:select path="item" items="${slist}" cssClass="gui-input" placeholder="类别..."/>
                                <label for="item" class="field-icon">
                                    <i class="arrow double"></i>
                                </label>
                            </label>
                        </div>
                        <div class="col-md-6">
                            <label for="cause" class="field prepend-icon">
                                <form:input path="cause" cssClass="gui-input" placeholder="事由..."/>
                                <label for="cause" class="field-icon">
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