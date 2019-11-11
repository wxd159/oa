<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.nuc.oa.global.Contant" %>
<!DOCTYPE html>
<html>


<!-- Mirrored from admindesigns.com/demos/absolute/1.1/admin_forms-validation.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 06 Aug 2015 02:56:15 GMT -->
<head>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">

    <title> 人事管理信息系统 </title>

    <link rel="stylesheet" type="text/css" href="/assets/skin/default_skin/css/theme.css">
    <link rel="stylesheet" type="text/css" href="/assets/admin-tools/admin-forms/css/admin-forms.css">
    <link rel="shortcut icon" href="/assets/img/favicon.ico">
    <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
    <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="jqueryui/style.css">
    <script>
        $(function () {
            $(".datepicker").datepicker({
                changeYear: true,
                changeMonth: true,
                dateFormat: "yy-mm-dd",
                clearText: '清除',
                clearStatus: '清除已选日期',
                closeText: '关闭',
                closeStatus: '不改变当前选择',
                prevText: '< 上月',
                prevStatus: '显示上月',
                prevBigText: '<<',
                prevBigStatus: '显示上一年',
                nextText: '下月>',
                nextStatus: '显示下月',
                nextBigText: '>>',
                nextBigStatus: '显示下一年',
                currentText: '今天',
                currentStatus: '显示本月',
                monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
                monthNamesShort: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
                monthStatus: '选择月份',
                yearStatus: '选择年份',
                weekHeader: '周',
                weekStatus: '年内周次',
                dayNames: ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
                dayNamesShort: ['周日', '周一', '周二', '周三', '周四', '周五', '周六'],
                dayNamesMin: ['日', '一', '二', '三', '四', '五', '六'],
                dayStatus: '设置 DD 为一周起始',
                dateStatus: '选择 m月 d日, DD',
                dateFormat: 'yy-mm-dd',
                firstDay: 1,
                initStatus: '请选择日期',
                isRTL: false,
            });
        });
    </script>

    <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
</head>

<body class="admin-validation-page" data-spy="scroll" data-target="#nav-spy" data-offset="200">
<div id="main">
    <header class="navbar navbar-fixed-top navbar-shadow">
        <div class="navbar-branding">
            <a class="navbar-brand" href="dashboard.html">
                <b>人事管理信息系统</b>
            </a>
            <span id="toggle_sidemenu_l" class="ad ad-lines"></span>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown menu-merge">
                <a href="#" class="dropdown-toggle fw600 p15" data-toggle="dropdown">
                    <img src="/assets/img/avatars/5.jpg" alt="avatar" class="mw30 br64">
                    <span class="hidden-xs pl15"> ${sessionScope.employee.name} </span>
                    <span class="caret caret-tp hidden-xs"></span>
                </a>
                <ul class="dropdown-menu list-group dropdown-persist w250" role="menu">
                    <li class="list-group-item">
                        <a href="/employee/to_self" class="animated animated-short fadeInUp">
                            <span class="fa fa-user"></span> 个人信息
                            <span class="label label-warning"></span>
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="/to_change_password" class="animated animated-short fadeInUp">
                            <span class="fa fa-gear"></span> 设置密码 </a>
                    </li>
                    <li class="dropdown-footer">
                        <a href="/quit" class="">
                            <span class="fa fa-power-off pr5"></span> 退出 </a>
                    </li>
                </ul>
            </li>
        </ul>
    </header>
    <aside id="sidebar_left" class="nano nano-light affix">
        <div class="sidebar-left-content nano-content">
            <header class="sidebar-header">
                <div class="sidebar-widget author-widget">
                    <div class="media">
                        <a class="media-left" href="#">
                            <img src="/assets/img/avatars/5.jpg" alt="avatar" class="mw30 br64">
                        </a>
                        <div class="media-body">
                            <div class="media-author">${sessionScope.employee.name}--${sessionScope.employee.post}</div>
                            <div class="media-links">
                                <a href="/quit">退出</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sidebar-widget search-widget hidden">
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="fa fa-search"></i>
                        </span>
                        <input type="text" id="sidebar-search" class="form-control" placeholder="Search...">
                    </div>
                </div>
            </header>
            <ul class="nav sidebar-menu">
                <li class="sidebar-label pt20">日常管理</li>
                <li>
                    <a class="accordion-toggle" href="#">
                        <span class="glyphicon glyphicon-check"></span>
                        <span class="sidebar-title">报销单管理</span>
                        <span class="caret"></span>
                        <c:if test="${sessionScope.claimVoucherNews!=0}">
                            <span class="label label-xs bg-primary">New</span>
                        </c:if>
                    </a>
                    <ul class="nav sub-nav">
                        <li class="active">
                            <a href="/claim_voucher/self">
                                <span class="glyphicon glyphicon-home"></span>
                                <span class="sidebar-title">个人报销单</span>
                            </a>
                        </li>
                        <li>
                            <a href="/claim_voucher/to_add">
                                <span class="fa fa-calendar"></span>
                                <span class="sidebar-title">填写报销单</span>
                            </a>
                        </li>
                        <li>
                            <a href="/claim_voucher/deal">
                                <span class="glyphicon glyphicon-book"></span>
                                <span class="sidebar-title">待处理报销单</span>
                                <span class="sidebar-title-tray">
                            <c:if test="${sessionScope.claimVoucherNews!=0}">
                                <span class="label label-xs bg-primary">New</span>
                            </c:if>
                                </span>
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="/sign_in/list">
                        <span class="fa fa-calendar"></span>
                        <span class="sidebar-title">签到</span>
                    </a>
                </li>
                <li>
                    <a href="/employee/salary">
                        <span class="fa fa-calendar"></span>
                        <span class="sidebar-title">工资明细</span>
                    </a>
                </li>
                <c:if test="${sessionScope.employee.post==Contant.POST_FM || sessionScope.employee.post==Contant.POST_GM || sessionScope.employee.post==Contant.POST_HR }">
                    <li>
                        <a href="/salary/to_manage">
                            <span class="fa fa-calendar"></span>
                            <span class="sidebar-title">工资管理</span>
                        </a>
                    </li>
                </c:if>
                <li>
                    <a class="accordion-toggle" href="#">
                        <span class="glyphicon glyphicon-check"></span>
                        <span class="sidebar-title">请假记录管理</span>
                        <span class="caret"></span>
                        <c:if test="${sessionScope.leaveInfoNews!=0}">
                            <span class="label label-xs bg-primary">New</span>
                        </c:if>
                    </a>
                    <ul class="nav sub-nav">
                        <li class="active">
                            <a href="/leaveInfo/self">
                                <span class="glyphicon glyphicon-home"></span>
                                <span class="sidebar-title">个人请假记录</span>
                            </a>
                        </li>
                        <li>
                            <a href="/leaveInfo/to_add">
                                <span class="fa fa-calendar"></span>
                                <span class="sidebar-title">填写请假条</span>
                            </a>
                        </li>
                        <li>
                            <a href="/leaveInfo/deal">
                                <span class="glyphicon glyphicon-book"></span>
                                <span class="sidebar-title">待处理请假请求</span>
                                <span class="sidebar-title-tray">
                            <c:if test="${sessionScope.leaveInfoNews!=0}">
                                <span class="label label-xs bg-primary">New</span>
                            </c:if>
                                </span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="accordion-toggle" href="#">
                        <span class="glyphicon glyphicon-check"></span>
                        <span class="sidebar-title">公告列表管理</span>
                        <span class="caret"></span>
                    </a>
                    <ul class="nav sub-nav">
                        <li>
                            <a href="/notice/list">
                                <span class="fa fa-calendar"></span>
                                <span class="sidebar-title">公告列表</span>
                            </a>
                        </li>
                        <c:if test="${sessionScope.employee.post==Contant.POST_FM || sessionScope.employee.post==Contant.POST_GM}">
                            <li>
                                <a href="/notice/to_add">
                                    <span class="fa fa-calendar"></span>
                                    <span class="sidebar-title">添加公告</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </li>

                <li>
                    <a class="accordion-toggle" href="#">
                        <span class="glyphicon glyphicon-check"></span>
                        <span class="sidebar-title">劳动关系管理</span>
                        <span class="caret"></span>
                        <c:if test="${sessionScope.laborRelationNews!=0}">
                            <span class="label label-xs bg-primary">New</span>
                        </c:if>
                    </a>
                    <ul class="nav sub-nav">
                        <li class="active">
                            <a href="/labor_relation/self">
                                <span class="glyphicon glyphicon-home"></span>
                                <span class="sidebar-title">个人劳动关系</span>
                            </a>
                        </li>
                        <li>
                            <a href="/labor_relation/to_add">
                                <span class="fa fa-calendar"></span>
                                <span class="sidebar-title">劳动关系管理</span>
                            </a>
                        </li>
                        <li>
                            <a href="/labor_relation/deal">
                                <span class="glyphicon glyphicon-book"></span>
                                <span class="sidebar-title">待处理劳动关系请求</span>
                                <span class="sidebar-title-tray">
                            <c:if test="${sessionScope.laborRelationNews!=0}">
                                <span class="label label-xs bg-primary">New</span>
                            </c:if>
                                </span>
                            </a>
                        </li>
                    </ul>
                </li>


                <c:if test="${sessionScope.employee.post==Contant.POST_FM || sessionScope.employee.post==Contant.POST_GM || sessionScope.employee.post==Contant.POST_HR }">

                    <li class="sidebar-label pt15">基础信息管理</li>
                    <li>
                        <a class="accordion-toggle" href="#">
                            <span class="glyphicon glyphicon-check"></span>
                            <span class="sidebar-title">员工管理</span>
                            <span class="caret"></span>
                        </a>
                        <ul class="nav sub-nav">
                            <li>
                                <a href="/employee/list">
                                    <span class="glyphicon glyphicon-calendar"></span> 所有员工 </a>
                            </li>
                            <c:if test="${sessionScope.employee.post==Contant.POST_HR}">
                                <li class="active">
                                    <a href="/employee/to_add">
                                        <span class="glyphicon glyphicon-check"></span> 添加员工 </a>
                                </li>
                            </c:if>
                        </ul>
                    </li>
                    <li>
                        <a class="accordion-toggle" href="#">
                            <span class="fa fa-columns"></span>
                            <span class="sidebar-title">部门管理</span>
                            <span class="caret"></span>
                        </a>
                        <ul class="nav sub-nav">
                            <li>
                                <a href="/department/list">
                                    <span class="glyphicon glyphicon-calendar"></span> 所有部门 </a>
                            </li>
                            <c:if test="${sessionScope.employee.post==Contant.POST_HR}">
                                <li class="active">
                                    <a href="/department/to_add">
                                        <span class="glyphicon glyphicon-check"></span> 添加部门 </a>
                                </li>
                            </c:if>
                        </ul>
                    </li>
                </c:if>
            </ul>
            <div class="sidebar-toggle-mini">
                <a href="#">
                    <span class="fa fa-sign-out"></span>
                </a>
            </div>
        </div>
    </aside>
    <section id="content_wrapper">