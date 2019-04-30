<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/15/015
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css"
          href="../js/jquery-easyui-1.4.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css"
          href="../js/jquery-easyui-1.4.1/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../css/taotao.css" />
    <script type="text/javascript"
            src="../js/jquery-easyui-1.4.1/jquery.min.js"></script>
    <script type="text/javascript"
            src="../js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="../js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <link href="../css/jquery.easy_slides.css" rel="stylesheet">
    <script src="../js/jquery.easy_slides.js"></script>
    <style type="text/css">
        a:link{text-decoration: none;}
        a{
            color:#041343;
            font-weight: 560;
        }
        p{
            line-height: 30px;
            margin-top: -7px;
            text-indent: 2em;
            padding-left: 5px;
            font-size: 12px;
        }
    </style>
    <title>防雷工程后台管理系统</title>
</head>

<body class="easyui-layout">
<div data-options="region:'north',title:'四川雷盾科技有限公司'" style="width:100%;height: 60px">
    <table border="0" cellspacing="0">
        <tr style="height: 31px">
            <td style="width: 200px;background-color: #CCDCF7;color: #041343">防雷工程管理系统</td>
            <td style="background-color:#CCDCF7;text-align: right;width: 1710px;font-size: 12px">欢迎您，系统管理员！</td>
            <td style="background-color:#CCDCF7;text-align: center;width: 40px;font-size: 12px"><a href="javascript:void(0)" style="font-weight: 500" onClick="alert()">退出</a></td>
        </tr>
    </table>
</div>
<div region="west" title="菜单" split="true" style="width: 180px;">
    <ul id="menu" class="easyui-tree"
        style="margin-top: 10px; margin-left: 5px;">
        <li>
            <span>防雷工程管理</span>
            <ul>
                <li data-options="attributes:{'url':'project-man'}">防雷项目管理</li>
                <li data-options="attributes:{'url':'project-add'}">新增项目</li>
                <%--<li data-options="attributes:{'url':'project-update'}">编辑项目</li>--%>
                <li data-options="attributes:{'url':'unit-man'}">建设单位管理</li>
                <li data-options="attributes:{'url':'unit-add'}">新增单位</li>
                <%--<li data-options="attributes:{'url':'unit-update'}">编辑单位</li>--%>
                <li data-options="attributes:{'url':'project-place-man'}">项目所在地管理</li>
                <li data-options="attributes:{'url':'project-place-add'}">新增所在地</li>
                <%--<li data-options="attributes:{'url':'project-place-update'}">编辑所在地</li>--%>
            </ul>
        </li>
        <li>
            <span>工程管理</span>
            <ul>
                <li data-options="attributes:{'url':'contract-man'}">合同管理</li>
                <li data-options="attributes:{'url':'fixed-assets'}">固定资产</li>
            </ul>
        </li>
        <li>
            <span>审核管理</span>
            <ul>
                <li data-options="attributes:{'url':'project_check'}">项目审核</li>
                <li data-options="attributes:{'url':'contract-check'}">合同审核</li>
            </ul>
        </li>
    </ul>
</div>
<div data-options="region:'center',title:''">
    <div id="tabs" class="easyui-tabs">
        <div title="首页" style="padding: 20px;">
            <table cellspacing="7">
                <tr>
                    <td>
                        <div style="width:830px;height: 400px;border:2px solid #D0E2F7">
                            <div style="height: 35px;background-color:#CCDCF7">
                                <span style="font-size: 15px;padding-left: 18px;letter-spacing: 2px;font-weight: 560">企业图片</span>
                            </div>
                            <div class="slider slider_one_big_picture" style="width:830px;height: 365px">
                                <div style="width:830px;border: none"><img src="../img/p4.jpg" width="830px" height="365px"></div>
                                <div style="width:830px;border: none"><img src="../img/p2.jpg" width="830px" height="365px"></div>
                                <div style="width:830px;border: none"><img src="../img/p3.jpg" width="830px" height="365px"></div>
                                <div style="width:830px;border: none"><img src="../img/p1.jpg" width="830px" height="365px"></div>
                                <div class="next_button">NEXT</div>
                                <div class="prev_button">PREV</div>
                                <div class="nav_indicators"></div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div style="width:830px;height: 400px;border:2px solid #D0E2F7">
                            <div style="height: 35px;background-color:#CCDCF7">
                                <span style="font-size: 15px;padding-left: 18px;letter-spacing: 2px;font-weight: 560">企业简介</span>
                            </div>
                            <p style="margin-top: 7px">四川雷盾科技有限公司成立于1997年，从事现代综合防雷工程、软件开发工程、网络工程、咨询服务的高科技企业，具有较强的科研、开发、设计和施工实力。</p>
                            <p>本公司是具有国家颁发的防雷工程专业设计、施工双甲级资质企业，公司多年从事防雷工程的设计与施工，拥有多位防雷专家组成的顾问小组，专业的技术人员、专业的施工队伍，使公司成为爆炸和火灾危险场所防雷专家。在石油、石化、通信、交通、电力、机场、部队、古建筑防雷等行业和领域完成大量的现代综合防雷工程，具有丰富的防雷工程设计和施工经验，具有优质的售前售后服务，完整的跟踪服务体系。公司通过了ISO9001:2008质量管理体系认证，是国家认可和受到用户好评的专业的现代综合防雷工程公司。</p>
                            <p>公司积极参加防雷规范和标准的制定，特别注重与高校和研究院所的技术交流和合作，致力于新技术的开发与应用，“一流技术，一流质量，一流服务”是公司员工的共同目标。</p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="width:830px;height: 300px;border:2px solid #D0E2F7">
                            <div style="height: 35px;background-color:#CCDCF7">
                                <span style="font-size: 15px;padding-left: 18px;letter-spacing: 2px;font-weight: 560">企业动态</span>
                            </div>
                            <table cellspacing="0">
                                <tr>
                                    <div>
                                        <img src="../img/jiantou.jpg" style="width: 25px;padding-left: 30px;padding-top: 15px;padding-right: 5px">
                                        <span style="font-size: 14px;color: #041343;font-weight: 560">置顶新闻</span>
                                    </div>
                                </tr><br>
                                <tr>
                                    <th style="font-size: 13px;width:350px;text-align:left;padding-left: 27px;padding-bottom: 5px; border-bottom: 4px solid #EAEADE">公告标题</th>
                                    <th style="font-size: 13px;width:350px;text-align: center;padding-bottom: 5px; border-bottom: 4px solid #EAEADE">发布人</th>
                                    <th style="font-size: 13px;width:350px;text-align: center;padding-bottom: 5px; border-bottom: 4px solid #EAEADE">发布日期</th>
                                </tr>
                                <tr>
                                    <td style="font-size:13px;padding-top: 12px;padding-left: 27px"><a href="">四川防雷安全性鉴定的基本工作内容</a></td>
                                    <td style="font-size:13px;text-align: center;color: #041343;font-weight: 560;">李海华</td>
                                    <td style="font-size:13px;text-align: center;color: #041343;font-weight: 560;">2018-12-21</td>
                                </tr>
                                <tr>
                                    <td style="font-size:13px;padding-top: 12px;padding-left: 27px"><a href="">工程质量鉴定概念及鉴定常见方面</a></td>
                                    <td style="font-size:13px;text-align: center;color: #041343;font-weight: 560;">张程</td>
                                    <td style="font-size:13px;text-align: center;color: #041343;font-weight: 560;">2019-01-02</td>
                                </tr>
                                <tr>
                                    <td style="font-size:13px;padding-top: 12px;padding-left: 27px"><a href="">工程管理，安全质量检查</a></td>
                                    <td style="font-size:13px;text-align: center;color: #041343;font-weight: 560;">龚洪成</td>
                                    <td style="font-size:13px;text-align: center;color: #041343;font-weight: 560;">2019-01-12</td>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <td>
                        <div style="width:830px;height: 300px;border:2px solid #D0E2F7">
                            <div style="height: 35px;background-color:#CCDCF7">
                                <span style="font-size: 15px;padding-left: 18px;letter-spacing: 2px;font-weight: 560">消息公告</span>
                            </div>
                            <table cellspacing="0">
                                <tr>
                                    <div>
                                        <img src="../img/jiantou.jpg" style="width: 25px;padding-left: 30px;padding-top: 15px;padding-right: 5px">
                                        <span style="font-size: 14px;color: #041343;font-weight: 560">置顶消息</span>
                                    </div>
                                </tr><br>
                                <tr>
                                    <th style="font-size:13px;width:350px;text-align:left;padding-left: 27px;padding-bottom: 5px; border-bottom: 4px solid #EAEADE">公告标题</th>
                                    <th style="font-size:13px;width:350px;text-align: center;padding-bottom: 5px; border-bottom: 4px solid #EAEADE">发布人</th>
                                    <th style="font-size:13px;width:350px;text-align: center;padding-bottom: 5px; border-bottom: 4px solid #EAEADE">发布日期</th>
                                </tr>
                                <tr>
                                    <td style="font-size:13px;padding-top: 12px;padding-left: 27px"><a href="">关于振华建筑公司的招标通知</a></td>
                                    <td style="font-size:13px;text-align: center;color: #041343;font-weight: 560;">张立</td>
                                    <td style="font-size:13px;text-align: center;color: #041343;font-weight: 560;">2018-12-28</td>
                                </tr>
                                <tr>
                                    <td style="font-size:13px;padding-top: 12px;padding-left: 27px"><a href="">工程质量鉴定概念及鉴定常见方面</a></td>
                                    <td style="font-size:13px;text-align: center;color: #041343;font-weight: 560;">陈小立</td>
                                    <td style="font-size:13px;text-align: center;color: #041343;font-weight: 560;">2019-01-08</td>
                                </tr>
                                <tr>
                                    <td style="font-size:13px;padding-top: 12px;padding-left: 27px"><a href="">工程管理，安全质量检查</a></td>
                                    <td style="font-size:13px;text-align: center;color: #041343;font-weight: 560;">王绑国</td>
                                    <td style="font-size:13px;text-align: center;color: #041343;font-weight: 560;">2019-02-10</td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function() {
        $('#menu').tree({
            onClick : function(node) {
                if ($('#menu').tree("isLeaf", node.target)) {
                    var tabs = $("#tabs");
                    var tab = tabs.tabs("getTab", node.text);
                    if (tab) {
                        tabs.tabs("select", node.text);
                    } else {
                        tabs.tabs('add', {
                            title : node.text,
                            href : node.attributes.url,
                            closable : true,
                            bodyCls : "content"
                        });
                    }
                }
            }
        });
    });
    function alert(){
        if(confirm("确认退出？")){
            window.location.href="./login"
        }else{}
    }
    $('.slider_one_big_picture').EasySlides()
</script>
</body>
</html>
