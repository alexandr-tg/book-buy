<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/vendor/autoload.php';
$info = new \controller\HeadInfo();
$cart = $info->cartInfo();
$wish = $info->wishInfo();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bookbuy</title>
    <link rel="icon" href="../../web/images/templateImage/icon.png">
    <link rel="stylesheet" href="../../web/css/main.css">
</head>
<body>
<header id="header">
    <div class="blackHead">
        <div class="container clearfix">
            <div>
                <nav>
                    <ul class="blackHeadNav">
                        <?php if(!isset($_SESSION['user_id'])):?>
                        <li>
                            <a href="../../user/auth/">Sign in</a>
                        </li>
                        <li>
                            <a href="../../user/reg/">Create account</a>
                        </li>
                        <?php endif; ?>
                        <?php if($_SESSION['role'] && $_SESSION['role'] == 'admin'):?>
                        <li>
                            <a href="../../admin/panel/">Admin panel</a>
                        </li>
                        <?php endif; ?>
                        <?php if (isset($_SESSION['user_id'])):?>
                        <li>
                            <a href="../../order/show/">Order Status</a>
                        </li>
                        <?php endif; ?>
                        <li>
                            <a href="../../help/show">Help</a>
                        </li>
                        <?php if (isset($_SESSION['user_id'])):?>
                            <li>
                                <a href="../../user/logout">Logout</a>
                            </li>
                        <?php endif; ?>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

    <div class="search">
        <div class="container clearfix">
            <div class="logo">
                <a href="/"><img src="../../web/images/templateImage/logo.png" alt="Home"></a>
            </div>
            <div class="search_form">
                <form action="">
                    <input type="text">
                    <a href="#">Search</a>
                </form>
            </div>

            <div class="card">
                <div class="clearfix">
                    <img src="../../web/images/templateImage/card.png" alt="">
                    <span class="b_span">Your cart</span>
                    <span class="l_span"><?=$cart['count_item']?></span>
                </div>
                <div class="sum_a">
                    <p><?=$cart['sum']?></p>
                    <a href="../../cart/show">Checkout</a>
                </div>
            </div>

            <div class="wish_list">
                <img src="../../web/images/templateImage/star.png" alt="">
                <span class="wish_list_count"><?=$wish['count']?></span>
                <a href="../../wish/show" class="wish_list_str">Wish list</a>
            </div>
        </div>
    </div>
</header>
<section id="nav">
    <div class="container clearfix nav">
        <nav class="navigation">
            <ul>
                <a href="../../category/main/?id=4"><li>Computers</li></a>
                <a href="../../category/main/?id=5"><li>Cooking</li></a>
                <a href="../../category/main/?id=6"><li>Education</li></a>
                <a href="../../category/main/?id=1"><li>Fiction</li></a>
                <a href="../../category/main/?id=7"><li>Health</li></a>
                <a href="../../category/main/?id=8"><li>Mathematics</li></a>
                <a href="../../category/main/?id=9"><li>Medical</li></a>
                <a href="../../category/main/?id=10"><li>Reference</li></a>
                <a href="../../category/main/?id=11"><li>Science</li></a>
            </ul>
        </nav>
    </div>
</section>

<section id="main">
    <div class="container clearfix banners">