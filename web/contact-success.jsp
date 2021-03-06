<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
    <title>Gửi yêu cầu liên hệ thành công - Công ty In ấn Ao Sen đệ nhất photo</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Load normalize.css -->
    <link rel="stylesheet" href="src/lib/normalize.css">
    <!-- Load skeleton.css -->
    <link rel="stylesheet" href="src/lib/skeleton.css">
    <!-- Load fontawesome -->
    <link rel="stylesheet" href="src/lib/fontawesome/all.css">
    <!-- Load custom css -->
    <link rel="stylesheet" type="text/css" href="src/css/main.css">
</head>

<body data-page-name="contact">
    <%-- HEADER --%>
    <%@ include file="/includes/customer-header.jsp" %>

    <%-- NAVIGATION --%>
    <jsp:include page="/includes/customer-nav.jsp" />

    <%-- CONTENT --%>
    <main class="main-content container" id="main-content">
        <h2 class="main-content__title">Gửi yêu cầu liên hệ thành công</h2>

        <div class="theme__text--success">Yêu cầu liên hệ của quý khách đã được gửi thành công! <br /> Chúng tôi
            sẽ liên hệ với quý khách trong vòng 24h.</div>

        <br />

        <button class="button" onclick="location.href='index.jsp';">Bấm vào đây để quay về ...</button>
    </main>

    <!-- FOOTER -->
    <%@ include file="/includes/customer-footer.jsp" %>

    <script src="src/lib/jquery-3.3.1.min.js"></script>
    <script src="src/js/main.js"></script>
</body>

</html>