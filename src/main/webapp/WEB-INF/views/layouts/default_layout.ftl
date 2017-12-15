<#setting url_escaping_charset='ISO-8859-1'>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <script src="${context_path}/js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="${context_path}/js/aw.js" type="text/javascript"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.6.1/css/bulma.min.css" rel="stylesheet" type="text/css">
    <link href="${context_path}/css/main.css" rel="stylesheet" type="text/css"/>
    <title>ProHouse - <@yield to="title"/></title>
</head>
<body>

<div class="main">
<#include "header.ftl" >
    <div class="container" style="margin: 20px auto">
    <div class="message"><@flash name="message"/></div>

    ${page_content}
    </div>
</div>

</body>

</html>
