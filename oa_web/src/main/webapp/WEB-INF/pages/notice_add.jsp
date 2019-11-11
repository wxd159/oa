<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="top.jsp" %>
<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 添加公告 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <form:form action="/notice/add" modelAttribute="notice" id="admin-form" name="addForm">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 基本信息 </span>
                        </div>
                        <div class="section row">
                            <div class="col-md-12">
                                <label for="title" class="field prepend-icon">
                                    <form:input path="title" cssClass="gui-input" placeholder="标题"/>
<%--                                    <label for="title" class="field-icon">--%>
<%--                                        <i class="fa fa-user"></i>--%>
<%--                                    </label>--%>
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-12">
                                <label for="content" class="field prepend-icon">
                                    <form:input path="content" cssClass="gui-input" placeholder="正文"/>
<%--                                    <label for="content" class="field-icon">--%>
<%--                                        <i class="fa fa-user"></i>--%>
<%--                                    </label>--%>
                                </label>
                            </div>
                        </div>
                        <div class="panel-footer text-right">
                            <button type="submit" class="button"> 提交 </button>
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