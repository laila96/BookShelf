<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dao.*"%>
     <%
       Produit pro = (Produit) request.getAttribute("produit");
    
    
      
       
    %>
    
    <%
    
    
    
    Utilisateur utilisateur = (Utilisateur) request.getSession().getAttribute("user");
    
    
    	
    	if(utilisateur == null){
    		
    		 System.out.println( "c'est un anonyme !! ");
    		 response.sendRedirect("login.jsp");
    		
    	}else if( utilisateur.getRole().equals("admin") )
    	   
        {
        	
    		response.sendRedirect("listeCommandes.jsp");
        	
        }else if( utilisateur.getRole().equals("user") ) {
        	     
        	     
        }
                   
       
   
   %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BookShelf Books</title>
</head>

 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>BookShelf</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- styles -->
<link href='http://fonts.googleapis.com/css?family=Droid+Serif' rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,800,700,300' rel='stylesheet' type='text/css'>
<link href="./assets/template1/assets/css/bootstrap.css" rel="stylesheet">
<link href="./assets/template1/assets/css/bootstrap-responsive.css" rel="stylesheet">
<link href="./assets/template1/assets/css/docs.css" rel="stylesheet">
<link href="./assets/template1/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
<link href="./assets/template1/assets/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="./assets/template1/assets/css/flexslider.css" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="./assets/template1/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- fav and touch icons -->
<link rel="shortcut icon" href="./assets/template1/assets/ico/favicon.html">
</head>
<body>

<% if (!(utilisateur == null)){ %> 
<!-- Header Start -->
<header>
  <!-- Sticky Navbar Start -->
  <div class="navbar navbar-fixed-top" id="main-nav">
    <div class="container">
      <button data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar" type="button">
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      </button>
      <ul class="nav pull-right left-tablet">
        <li class="dropdown hover topcart">
          <a  class="dropdown-toggle" href="#">
            <i class="carticon"></i> Panier <span class="label label-success font14">1 item(s)</span> - $589.50<b class="caret"></b></a>
          <ul class="dropdown-menu topcartopen">
            <li>
              <table>
                <tbody>
                  <tr>
                    <td class="image"><a href="product.html"><img title="product" alt="product" src="./assets/template1/assets/img/a.jpg" height="50" width="50"></a></td>
                    <td class="name"><a href="product.html">MacBook</a></td>
                    <td class="quantity">x&nbsp;1</td>
                    <td class="total">$589.50</td>
                    <td class="remove"><i class="icon-remove"></i></td>
                  </tr>
                  <tr>
                    <td class="image"><a href="product.html"><img title="product" alt="product" src="./assets/template1/assets/img/a.jpg" height="50" width="50"></a></td>
                    <td class="name"><a href="product.html">MacBook</a></td>
                    <td class="quantity">x&nbsp;1</td>
                    <td class="total">$589.50</td>
                    <td class="remove"><i class="icon-remove "></i></td>
                  </tr>
                </tbody>
              </table>
              <table>
                <tbody>
                  <tr>
                    <td class="textright"><b>Sub-Total:</b></td>
                    <td class="textright">$500.00</td>
                  </tr>
                  <tr>
                    <td class="textright"><b>Eco Tax (-2.00):</b></td>
                    <td class="textright">$2.00</td>
                  </tr>
                  <tr>
                    <td class="textright"><b>VAT (17.5%):</b></td>
                    <td class="textright">$87.50</td>
                  </tr>
                  <tr>
                    <td class="textright"><b>Total:</b></td>
                    <td class="textright">$589.50</td>
                  </tr>
                </tbody>
              </table>
              <div class="well pull-right">
                <a href="#" class="btn btn-success">View Cart</a>
                <a href="#" class="btn btn-success">Checkout</a>
              </div>
            </li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
  <!--Sticky Navbar End -->
  <div class="header-white">
    <div class="container">
      <div class="row">
        <div class="span4">
          <a class="logo" href="Home"><img src="./images/iii.png" alt="ShopSimple" title="ShopSimple"></a>
        </div>
        <div class="span8">
          <div class="row">
            <div class="pull-right logintext">Welcome <%= utilisateur.getUsername() %> </a>
              
            </div>
          </div>
          <form class="form-search marginnull topsearch pull-right">
            <input type="text" class="input-large search-query search-icon-top" value="Search here..."  onFocus="if (this.value=='Search here...') this.value='';" onblur="if (this.value=='') this.value='Search here...';"
        >
          </form>
        </div>
      </div>
    </div>
    <div  >
      <div class="container">
        <nav class="subnav">
          <ul class="nav-pills categorymenu">
            <li><a href="index-2.html">Home</a>
            </li>
            <li><a class="active" href="panier.jsp">Products</a>
            </li>
             <li><a  href="panier.jsp">Panier</a>
            </li>
            <li><a href="inscription.jsp">Signup</a>
            </li>
            <li><a  href="login.jsp">Login</a>
            </li>
            <li><a href="about.jsp">About us</a>
            </li>   
            <li><a href="contactus.jsp">Contact us</a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  </div>
</header>
<!-- Header End -->
<div id="maincontainer">
  <section id="product">
    <div class="container">
      
      <!-- Product Details-->
      <div class="row">
        <div class="span5">
          <ul class="thumbnails mainimage">
            <li class="span5">
              <a  rel="position: 'inside' , showTitle: false, adjustX:-4, adjustY:-4" class="thumbnail cloud-zoom" href="<%= pro.getImage()%>">
                <img alt="" src="<%= pro.getImage()%>">
              </a>
              <span>Mouse move on Image to zoom</span>
            </li>
           
           
          </ul>
        </div>
        <div class="span7">
          <div class="row">
            <div class="span7">
              <h1 class="productname"><span class="bgnone"><%= pro.getNom()%></span></h1>
              <div class="productprice">
              <form action="AjoutPanier" method="post">   
                <div class="prnewprice"><%= pro.getPrix() %>$</div>
              </div>
              <div class="quantitybox">
                <div>
                 <label>Quntite: </label>
                 <input type="text" name="qte" value="1">
                 </div>
                 <p>
             <input type="hidden" name="id" value="<%= pro.getId()%>">
             <input type="hidden" name="idUser" value="<%= utilisateur.getId() %>">
            <input class="btn btn-success" type="submit"  value="Acheter">
          </p>
          
          </form>
                <div class="links  productlinks">
                  <a class="wishlist" href="wishlist.html">wishlist</a>
                  <a class="compare" href="compare.html">compare</a>
                </div>
              </div>
              <div class="productdesc">
                <ul class="nav nav-tabs" id="myTab">
                  <li class="active"><a href="#description">Description</a>
                  </li>
                  <li><a href="#review">Review</a>
                  </li>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="description">
                    <h2><%= pro.getNom()%></h2>
                       <%= pro.getDescription()%>
                   
                  </div>
                  <div class="tab-pane" id="review">
                    <ul class="reveiw">
                      <li>
                        <h4 class="title"> <span class="date"><i class="icon-calendar"></i> 2018 </span></h4>
                        <ul class="rate">
                          <li class="on"></li>
                          <li class="on"></li>
                          <li class="on"></li>
                          <li class="off"></li>
                          <li class="off"></li>
                        </ul>
                         </li>
                    </ul>
                  </div>
                  
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <!-- Product Description tab & comments-->
      
    </div>
  </section>
  

<!-- Footer -->
<footer id="footer">
  <section class="footersocial">
    <div class="container">
      <div class="row">
        <div class="span3 aboutus">
          <h2>About Us </h2>
          <p> Bookshelf is an e-commerce platform that allows students to buy books or contact admin to sell a book.<br>
This application encourage people to read by buying books with suitable price. </p>
        </div>
        <div class="span3 contact">
          <h2>Contact Us </h2>
          <ul>
            <li class="phone"> +123 123 456, +123 654 321,<br>
              +123 123 456,</li>
            <li class="mobile"> +123 123 456, +123 654 321,<br>
               +123 654 321,</li>
            <li class="email"> Book@Shelf.com <br>
              Book@Shelf.com</li>
          </ul>
        </div>
        <!-- <div class="span3 twitter">
          <h2>Twitter </h2>
          <div id="twitter">
          </div>
        </div>
        <div class="span3 facebook">
          <h2>Facebook </h2>
          <div id="fb-root"></div>
          <script src="http://static.ak.connect.facebook.com/js/api_lib/v0.4/FeatureLoader.js.php" type="text/javascript"></script>
          <script type="text/javascript">FB.init("");</script>
          <script type="text/javascript">
//<![CDATA[
document.write('<fb:fan profile_id="80655071208" stream="0"	connections="8"	logobar="0" height="190px"	width="250"css="assets/css/fb.css"></fb:fan> ');
//]]>
</script>
        </div> -->
      </div>
    </div>
  </section>
  <section class="footerlinks">
    <div class="container">
      <div class="info">
        <ul>
          <li><a href="#">BookShelf is created by  Laila MADANI and Nadia FAHSSI, supervise by M.BENMAISSA  </a>
          </li>
        </ul>
      </div>
      <div id="footersocial">
        <a href="#" title="Facebook" class="facebook">Facebook</a>
        <a href="#" title="Twitter" class="twitter">Twitter</a>
        <a href="#" title="Linkedin" class="linkedin">Linkedin</a>
        <a href="#" title="Googleplus" class="googleplus">Googleplus</a>
      </div>
    </div>
  </section>
  <!-- <section class="copyrightbottom">
    <div class="container">
      <div class="row">
        <div class="span6"> All images are copyright to their owners. </div>
        <div class="span6 textright"> ShopSimple @ 2012 </div>
      </div>
    </div>
  </section> -->
  <a id="gotop" href="#">Back to top</a>
</footer>
<!-- /maincontainer -->
<!-- javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="./assets/template1/assets/js/jquery.js"></script>
<script src="./assets/template1/assets/js/google-code-prettify/prettify.js"></script>
<script src="./assets/template1/assets/js/respond.min.js"></script>
<script src="./assets/template1/assets/js/bootstrap-transition.js"></script>
<script src="./assets/template1/assets/js/bootstrap-alert.js"></script>
<script src="./assets/template1/assets/js/bootstrap-modal.js"></script>
<script src="./assets/template1/assets/js/bootstrap-dropdown.js"></script>
<script src="./assets/template1/assets/js/bootstrap-scrollspy.js"></script>
<script src="./assets/template1/assets/js/bootstrap-tab.js"></script>
<script src="./assets/template1/assets/js/bootstrap-tooltip.js"></script>
<script src="./assets/template1/assets/js/bootstrap-popover.js"></script>
<script src="./assets/template1/assets/js/bootstrap-button.js"></script>
<script src="./assets/template1/assets/js/bootstrap-collapse.js"></script>
<script src="./assets/template1/assets/js/bootstrap-carousel.js"></script>
<script src="./assets/template1/assets/js/bootstrap-typeahead.js"></script>
<script src="./assets/template1/assets/js/application.js"></script>
<script defer src="./assets/template1/assets/js/jquery.flexslider.js"></script>
<script type="text/javascript" src="./assets/template1/assets/js/jquery.tweet.js"></script>
<script src="./assets/template1/assets/js/jflickrfeed.min.js"></script>
<script  src="./assets/template1/assets/js/cloud-zoom.1.0.2.js"></script>
<script  src="./assets/template1/assets/jscloud-zoom.1.0.2.min.html"></script>
<script type="text/javascript" src="./assets/template1/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<script  type="text/javascript" src="./assets/template1/assets/js/jquery.validate.js"></script>
<script defer src="./assets/template1/assets/js/custom.js"></script>
<% }%> 
</body>
</html>
 