<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>
<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 添加员工 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <form:form action="/employee/add" modelAttribute="employee"  id="admin-form" name="addForm">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 基本信息 </span>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label for="sn" class="field prepend-icon">
                                    <form:input path="sn" cssClass="gui-input" placeholder="工号..." />
                                    <label for="sn" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                    <i class="arrow double"></i>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label for="name" class="field prepend-icon">
                                    <form:input path="name" class="gui-input" placeholder="姓名..."/>
                                    <label for="name" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label for="sn" class="field select">
                                    <form:select path="departmentSn" items="${dlist}" itemLabel="name" itemValue="sn" cssClass="gui-input" placeholder="所属部门..."/>
                                    <i class="arrow double"></i>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label for="post" class="field select">
                                    <form:select path="post" items="${plist}" cssClass="gui-input" placeholder="职务..."/>
                                    <i class="arrow double"></i>
                                </label>
                            </div>
                        </div>

                        <div class="section row">
                            <div class="col-md-6">
                                <label for="birthday" class="field prepend-icon">
                                    <form:input path="birthday" cssClass="gui-input datepicker" placeholder="出生年月..." />
                                    <label for="birthday" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label for="baseSalary" class="field prepend-icon">
                                    <form:input path="baseSalary" class="gui-input" placeholder="基本工资..."/>
                                    <label for="baseSalary" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                        </div>

                        <div class="section row">
                            <div class="col-md-6">
                                <label for="school" class="field prepend-icon">
                                    <form:input path="school" cssClass="gui-input" placeholder="学校..." />
                                    <label for="school" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label for="degree" class="field select">
                                    <form:select path="degree" items="${degreelist}" class="gui-input" placeholder="学历..."/>
                                    <label for="degree" class="field-icon">
                                        <i class="arrow double"></i>
                                    </label>
                                </label>
                            </div>
                        </div>

                        <div class="section row">
                            <div class="col-md-6">
                                <label for="school" class="field prepend-icon">
                                    <form:input path="IDCard" cssClass="gui-input" placeholder="身份证号..." />
                                    <label for="school" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label for="degree" class="field prepend-icon">
                                    <form:input path="address" class="gui-input" placeholder="地址..."/>
                                    <label for="degree" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                        </div>

                        <div class="section row">
                            <div class="col-md-6">
                                <label for="school" class="field prepend-icon">
                                    <form:input path="startDate" cssClass="gui-input datepicker" placeholder="合同生效日期..." />
                                    <label for="school" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label for="degree" class="field prepend-icon">
                                    <form:input path="endDate" class="gui-input datepicker" placeholder="合同终止日期..."/>
                                    <label for="degree" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                        </div>

                        <div class="section row">
                            <div class="col-md-6">
                                <label for="status" class="field select">
                                    <form:select path="status" items="${slist}" cssClass="gui-input" placeholder="状态..." />
                                    <label for="status" class="field-icon">
                                        <i class="arrow double"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <label for="degree" class="field prepend-icon">
                                    <form:input path="remarks" class="gui-input" placeholder="备注..."/>
                                    <label for="degree" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                        </div>

                        <div class="panel-footer text-right">
                            <button type="submit" class="button"> 保存 </button>
                            <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>