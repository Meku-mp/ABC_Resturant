<!-- header.jsp -->

<!-- ========== MOBILE MENU ========== -->
<nav id="mobile-menu"></nav>
<!--Navbar-->

<header class="horizontal-header sticky-header transparent-header"
        data-menutoggle="991">

    <!--Header-->
    <div class="container">
        <!-- BRAND -->
        <div class="brand">
            <div class="logo">
                <a href="/"> <img src="../images/logo ABC.png" class="nav-logo"
                    alt="Hotel" style="width: 150px;">
                </a>
            </div>
        </div>
        <!-- MOBILE MENU BUTTON -->
        <div id="toggle-menu-button" class="toggle-menu-button">
            <span class="line"></span> <span class="line"></span> <span
                class="line"></span>
        </div>
        <!-- MAIN MENU -->
        <nav id="main-menu" class="main-menu">
            <ul class="menu">
                <li class="menu-item dropdown"><a href="adminhome.jsp">HOME</a></li>
                <li class="menu-item dropdown"><a href="staff.jsp">STAFF</a></li>
                <li class="menu-item"><a href="restaurants.jsp">RESATURANTS</a></li>
                <li class="menu-item dropdown"><a href="reservations.jsp">RESERVATIONS</a></li>
                <li class="menu-item dropdown"><a href="payments.jsp">PAYMENTS</a></li>
                <li class="menu-item"><a href="foods.jsp">FOODS</a></li>
                <li class="menu-item"><a href="facilities.jsp">FACILITIES</a></li>
                <li class="menu-item">
                    <form action="../LogoutServlet" method="post">
                        <button
                            style="margin-top: 23px; padding: 5px; border-radius: 5%;">LOGOUT</button>
                    </form>
                </li>
            </ul>
        </nav>
    </div>
</header>
