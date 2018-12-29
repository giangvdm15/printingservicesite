<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Tài khoản - Công ty In ấn Ao Sen đệ nhất photo</title>
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

<%
    if (session.getAttribute("loggedIn") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<body data-page-name="account">
    <!-- HEADER -->
    <%@ include file="includes/customer-header.jsp" %>

    <!-- NAVIGATION -->
    <jsp:include page="/includes/customer-nav.jsp" />

    <main class="main-content container" id="main-content">
        <h2 class="main-content__title">Tài khoản</h2>

        <section class="section" id="order-history">
            <h3 class="main-content__sub-title">Đơn hàng đã đặt</h3>

            <table id="order-list-table">
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Ngày đặt</th>
                        <th>Mô tả</th>
                        <th>Thành tiền</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <button class="action__button action__button--view">
                                <i class="fas fa-eye"></i>
                            </button>
                            <button class="action__button action__button--cancel">
                                <i class="fas fa-times"></i>
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </section>

        <section class="section" id="profile">
            <h3 class="main-content__sub-title">Chỉnh sửa thông tin cá nhân</h3>

            <div class="row">
                <%
                    if ("edit-profile".equalsIgnoreCase((String)request.getAttribute("action")) && "success".equalsIgnoreCase((String)request.getAttribute("status"))) {
                %>
                <div class="message_div">
                    <div class="dialog__container dialog__container--success">
                        <div class="dialog__dismiss-button dialog__dismiss-button--success js-dialogDismissButton">
                            <i class="fas fa-times"></i>
                        </div>
                        <div class="dialog__content">
                            <p>Cập nhật thông tin cá nhân thành công!</p>
                        </div>
                    </div>
                </div>
                <%  
                    }    
                %>
            </div>

            <form class="form" action="EditProfile" method="POST" id="edit-profile-form">
                <input type="hidden" name="id" value="${sessionScope.currentUser.getId()}">
                <fieldset id="customer-info">
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="customer-name">Họ và tên</label>
                        </div>
                        <div class="seven columns">
                            <input type="text" id="customer-name" name="customer-name" required value="${sessionScope.currentUser.getFullname()}">
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="customer-tel">Số điện thoại</label>
                        </div>
                        <div class="seven columns">
                            <input type="tel" id="customer-tel" name="customer-tel" required value="${sessionScope.currentUser.getPhoneNumber()}">
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="customer-email">Email</label>
                        </div>
                        <div class="seven columns">
                            <input type="email" id="customer-email" name="customer-email" required value="${sessionScope.currentUser.getEmail()}">
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label" for="customer-address">Địa chỉ</label>
                        </div>
                        <div class="seven columns">
                            <textarea name="customer-address" id="customer-address" cols="30" rows="10">${sessionScope.currentUser.getAddress()}</textarea>
                        </div>
                    </div>
                </fieldset>
                <div class="row form__line-wrapper">
                    <div class="six columns form__button-container">
                        <input class="form__button form__button--submit" type="submit" value="Cập nhật" id="submit-button">
                    </div>
                    <div class="six columns form__button-container">
                        <input class="form__button form__button--reset" type="reset" value="Điền lại" id="reset-button">
                    </div>
                </div>
            </form>
        </section>

        <section class="section" id="change-password">
            <h3 class="main-content__sub-title">Đổi mật khẩu</h3>

            <div class="row">
                <%
                    if ("change-password".equalsIgnoreCase((String)request.getAttribute("action")) && "success".equalsIgnoreCase((String)request.getAttribute("status"))) {
                %>
                <div class="message_div">
                    <div class="dialog__container dialog__container--success">
                        <div class="dialog__dismiss-button dialog__dismiss-button--success js-dialogDismissButton">
                            <i class="fas fa-times"></i>
                        </div>
                        <div class="dialog__content">
                            <p>Đổi mật khẩu thành công!</p>
                        </div>
                    </div>
                </div>
                <%  
                    }  
                %>
                <%
                    if ("change-password".equalsIgnoreCase((String)request.getAttribute("action")) && "error".equalsIgnoreCase((String)request.getAttribute("status"))) {
                %>
                <div class="message_div">
                    <div class="dialog__container dialog__container--error">
                        <div class="dialog__dismiss-button dialog__dismiss-button--error js-dialogDismissButton">
                            <i class="fas fa-times"></i>
                        </div>
                        <div class="dialog__content">
                            <p>Mật khẩu cũ không đúng! Đổi mật khẩu thất bại!</p>
                        </div>
                    </div>
                </div>
                <%  
                    }  
                %>
            </div>

            <form class="form" action="ChangePassword" method="POST" id="change-password-form">
                <input type="hidden" name="id" value="${sessionScope.currentUser.getId()}">
                <fieldset>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="customer-name">Mật khẩu cũ</label>
                        </div>
                        <div class="seven columns">
                            <input type="password" id="password-old" name="password-old" required>
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="customer-name">Nhập mật khẩu mới</label>
                        </div>
                        <div class="seven columns">
                            <input type="password" id="password" name="password" required>
                        </div>
                    </div>
                    <div class="row form__line-wrapper">
                        <div class="five columns form__label-container">
                            <label class="form__label required" for="customer-name">Nhắc lại mật khẩu mới</label>
                        </div>
                        <div class="seven columns">
                            <input type="password" id="password-repeat" name="password-repeat" required>
                            <div class="theme__input__validity" id="js-passwordRepeatValidityDisplay"></div>
                        </div>
                    </div>
                </fieldset>
                <div class="row form__line-wrapper">
                    <div class="six columns form__button-container">
                        <input class="form__button form__button--submit" type="submit" value="Cập nhật" id="submit-button">
                    </div>
                    <div class="six columns form__button-container">
                        <input class="form__button form__button--reset" type="reset" value="Điền lại" id="reset-button">
                    </div>
                </div>
            </form>
        </section>

        <section class="section">
            <form action="LogoutServlet" method="POST" id="logout-form">
                <input type="hidden" name="user-type" value="customer">
                <button type="submit" class="button" id="logout-button">Đăng xuất</button>
            </form>
        </section>
    </main>

    <!-- FOOTER -->
    <%@ include file="includes/customer-footer.jsp" %>

    <script src="src/lib/jquery-3.3.1.min.js"></script>
    <script src="src/js/main.js"></script>
    <script src="src/js/universal-form.js"></script>
</body>

</html>