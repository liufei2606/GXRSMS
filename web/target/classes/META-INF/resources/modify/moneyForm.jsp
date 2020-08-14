<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <c:set var="request" value="${pageContext.request.contextPath}"/>
    <title>layuiAdmin 文章管理 iframe 框</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${request}/static/plugins/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${request}/static/plugins/layuiadmin/style/admin.css" media="all">

</head>
<body>

<div class="layui-form" lay-filter="layuiadmin-app-form-list" id="layuiadmin-app-form-list"
     style="padding: 20px 30px 0 0;">
    <div class="layui-form-item">
        <div class="layui-input-inline">
            <input type="hidden" name="id" id="id" value="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">员工编号</label>
        <div class="layui-input-inline">
            <input type="text" name="empNo" id="empNo" autocomplete="off" value="" class="layui-input" lay-verify="no">
        </div>
        <div class="layui-form-mid " style="color:red">*必填项</div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">基本工资</label>
        <div class="layui-input-inline">
            <input type="text" name="jiben" id="jiben" autocomplete="off" value="" class="layui-input" lay-verify="no">
        </div>
        <div class="layui-form-mid " style="color:red">*必填项</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">员工津贴</label>
        <div class="layui-input-inline">
            <input type="text" name="jintie" id="jintie" autocomplete="off" value="" class="layui-input" lay-verify="no">
        </div>
        <div class="layui-form-mid " style="color:red">*必填项</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">课时费</label>
        <div class="layui-input-inline">
            <input type="text" name="keshi" id="keshi" autocomplete="off" value="" class="layui-input" lay-verify="no">
        </div>
        <div class="layui-form-mid " style="color:red">*必填项</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">扣除社保</label>
        <div class="layui-input-inline">
            <input type="text" name="shebao" id="shebao" autocomplete="off" value="" class="layui-input" lay-verify="no">
        </div>
        <div class="layui-form-mid " style="color:red">*必填项</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">应发薪资</label>
        <div class="layui-input-inline">
            <input type="text" name="salary" id="salary" autocomplete="off" value="" class="layui-input" lay-verify="name">
        </div>
        <div class="layui-form-mid " style="color:red">*必填项</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">发薪时间</label>
        <div class="layui-input-inline">
            <input type="text" name="extendTime" id="extendTime" autocomplete="off" value="" class="layui-input" lay-verify="name">
        </div>
        <div class="layui-form-mid " style="color:red">*必填项</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">发放状态</label>
        <div class="layui-input-inline">
            <select name="finished" id="finished" lay-verify="required">
                <option value="已发放" >已发放</option>
                <option value="未发放" >未发放</option>
            </select>
        </div>
        <div class="layui-form-mid " style="color:red">*必填项</div>
    </div>

    <div class="layui-form-item layui-hide">
        <input type="button" lay-submit lay-filter="layuiadmin-app-form-submit" id="layuiadmin-app-form-submit"
               value="确认添加">
        <input type="button" lay-submit lay-filter="layuiadmin-app-form-edit" id="layuiadmin-app-form-edit"
               value="确认编辑">
    </div>


</div>

<script src="${request}/static/plugins/layuiadmin/layui/layui.js"></script>
<script src="${request}/static/custom/js/myLayVerify.js"></script>
<script src="${request}/static/custom/js/myValidity.js"></script>
</body>

<script>
    layui.config({
        base: '${request}/static/plugins/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'form','laydate'], function () {
        var $ = layui.$
            , form = layui.form
            , laydate = layui.laydate;

        laydate.render({
            elem: '#extendTime' //指定元素
            , value: '2000-1-1'
            , isInitValue: true //是否允许填充初始值，默认为 true'
            , min: '1920-1-1'
            , max: '2018-12-31'
        });
        $("#empNo").blur(function () {
            var empNo = $("#empNo").val();
            $.ajax({
                type:"get",
                url:"${request}/employee/checkEmpName.html",
                data:{empNo:empNo},
                success:function (res) {
                    if(res.data === "empnameNotExist"){
                        layer.msg("该员工不存在!");
                    }
                }
            })
        });
    })
</script>
</html>