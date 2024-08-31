<!-- header.jsp -->

<!-- ========== MOBILE MENU ========== -->
<nav id="mobile-menu"></nav>
<!--Navbar-->

<header class="horizontal-header sticky-header transparent-header" style="position: fixed; top: 0; width: 100%; z-index: 1000; background: rgba(0, 0, 0, 0.8); padding: 15px 0; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);">

    <!--Header-->
    <div class="container" style="display: flex; justify-content: space-between; align-items: center; padding: 0 20px;">
        <!-- BRAND -->
        <div class="brand" style="display: flex; align-items: center;">
            <div class="logo">
                <a href="/" style="text-decoration: none;">
                    <img src="../images/logo ABC.png" class="nav-logo" alt="Hotel" style="width: 150px;">
                </a>
            </div>
        </div>
        <!-- MOBILE MENU BUTTON -->
        <div id="toggle-menu-button" class="toggle-menu-button" style="display: none;">
            <span class="line" style="display: block; width: 30px; height: 3px; background: #fff; margin: 5px 0;"></span>
            <span class="line" style="display: block; width: 30px; height: 3px; background: #fff; margin: 5px 0;"></span>
            <span class="line" style="display: block; width: 30px; height: 3px; background: #fff; margin: 5px 0;"></span>
        </div>
        <!-- MAIN MENU -->
        <nav id="main-menu" class="main-menu" style="flex-grow: 1; display: flex; justify-content: flex-end; align-items: center;">
            <ul class="menu" style="list-style: none; margin: 0; padding: 0; display: flex;">
                <li class="menu-item dropdown" style="margin-left: 30px; position: relative;">
                    <a href="adminhome.jsp" style="color: #fff; text-decoration: none; font-size: 18px; font-weight: 500; transition: color 0.3s;">HOME</a>
                </li>
                <li class="menu-item dropdown" style="margin-left: 30px; position: relative;">
                    <a href="staff.jsp" style="color: #fff; text-decoration: none; font-size: 18px; font-weight: 500; transition: color 0.3s;">STAFF</a>
                </li>
                <li class="menu-item" style="margin-left: 30px; position: relative;">
                    <a href="restaurants.jsp" style="color: #fff; text-decoration: none; font-size: 18px; font-weight: 500; transition: color 0.3s;">RESTAURANTS</a>
                </li>
                <li class="menu-item dropdown" style="margin-left: 30px; position: relative;">
                    <a href="reservations.jsp" style="color: #fff; text-decoration: none; font-size: 18px; font-weight: 500; transition: color 0.3s;">RESERVATIONS</a>
                </li>
         <!--        <li class="menu-item dropdown" style="margin-left: 30px; position: relative;">
                    <a href="payments.jsp" style="color: #fff; text-decoration: none; font-size: 18px; font-weight: 500; transition: color 0.3s;">PAYMENTS</a>
                </li> -->
                <li class="menu-item" style="margin-left: 30px; position: relative;">
                    <a href="foods.jsp" style="color: #fff; text-decoration: none; font-size: 18px; font-weight: 500; transition: color 0.3s;">FOODS</a>
                </li>
                <li class="menu-item" style="margin-left: 30px; position: relative;">
                    <a href="facilities.jsp" style="color: #fff; text-decoration: none; font-size: 18px; font-weight: 500; transition: color 0.3s;">FACILITIES</a>
                </li>
                <li class="menu-item" style="margin-left: 30px;">
                    <form action="../LogoutServlet" method="post" style="display: inline;">
                        <button style="color: #fff; background-color: transparent; border: 2px solid #fff; border-radius: 5px; padding: 5px 15px; font-size: 18px; font-weight: 500; cursor: pointer; transition: background-color 0.3s, color 0.3s;">
                            LOGOUT
                        </button>
                    </form>
                </li>
            </ul>
        </nav>
    </div>
</header>
