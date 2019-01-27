

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="dao.*"%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="com.mysql.jdbc.Connection"%>
<%@ page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>


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

<%
	PreparedStatement pr = null;
   ArrayList<Panier> listpanier = new ArrayList<Panier>();
	
   try{
		
	     Class.forName("com.mysql.jdbc.Driver");
	     Connection cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/jeegeti","root","");
		  pr =  (PreparedStatement) cnx.prepareStatement("select * from panier where idUser="+utilisateur.getId());
		  ResultSet rs = pr.executeQuery();
		  
		    while(rs.next()){
	      Panier panier  =  new Panier();
	      panier.setId(rs.getInt("id"));
	      panier.setIdProduit(rs.getInt("idProduit"));
	      panier.setIdUser(rs.getInt("idUser"));
	      panier.setQte(rs.getInt("qte"));
	      panier.setNom(rs.getString("nom"));
	      panier.setDescription(rs.getString("description"));
	      panier.setPrix(rs.getFloat("prix"));
	      panier.setImage(rs.getString("image"));
	      
	     
	     
	      listpanier.add(panier);
	  
		      }
		    
		}catch(Exception e){}
   
       float Tax=2,SubTotale=0,Totale = 0,Vat=0;
       int qte=0;
       String Commande="";
       
      for (Panier p : listpanier){
    	  qte= qte + p.getQte();
    	  SubTotale = SubTotale + (p.getPrix() * p.getQte());
    	  Commande = Commande+" \n Produit: "+p.getNom()+" || Qunatit�: "+p.getQte()+"\n";
    	  
      }
       
      System.out.println(Commande);
      Vat = (SubTotale/100) * (17 +  1/2);
      if(qte == 0)
          Totale = SubTotale  + Vat;
          else
          Totale = SubTotale + Tax  + Vat;
   
%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>BookShelf Panier</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- styles -->
<link href='http://fonts.googleapis.com/css?family=Droid+Serif'
	rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Ubuntu'
	rel='stylesheet' type='text/css' />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,800,700,300'
	rel='stylesheet' type='text/css'>
<link href="./assets/template1/assets/css/bootstrap.css" rel="stylesheet">
<link href="./assets/template1/assets/css/bootstrap-responsive.css" rel="stylesheet">
<link href="./assets/template1/assets/css/docs.css" rel="stylesheet">
<link href="./assets/template1/assets/js/google-code-prettify/prettify.css"
	rel="stylesheet">
<link href="./assets/template1/assets/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="./assets/template1/assets/css/flexslider.css" type="text/css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="./assets/template1/fancybox/jquery.fancybox-1.3.4.css" media="screen" />

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- fav and touch icons -->
<link rel="shortcut icon" href="assets/ico/favicon.html">
</head>
<body onload="setupZoom()">
	<!-- Header Start -->
	<header>
		<!-- Sticky Navbar Start -->
		<div class="navbar navbar-fixed-top" id="main-nav">
			<div class="container">
				<button data-target=".nav-collapse" data-toggle="collapse"
					class="btn btn-navbar" type="button">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				
				<ul class="nav pull-right left-tablet">
					
					<li class="dropdown hover topcart"><a class="dropdown-toggle"
						href="#"> <i class="carticon"></i> Panier <span
							class="label label-success font14"><%= qte %> item(s)</span> - $<%= Totale %><b
							class="caret"></b></a>
						<ul class="dropdown-menu topcartopen">
							<li>
								<table>
									<tbody>
									<% for(Panier p : listpanier) {%>
										<tr>
											<td class="image"><a href="<%= p.getImage() %>"><img
													title="product" alt="product"
													src="<%= p.getImage() %>" height="50" width="50"></a></td>
											<td class="name"><a href="product.html"><%= p.getNom() %></a></td>
											<td class="quantity">x&nbsp;<%= p.getQte() %></td>
											<td class="total">$<%= p.getPrix() %></td>
											<td class="remove"><i class="icon-remove"></i></td>
										</tr>
									<%} %>	
									</tbody>
								</table>
								<table>
									<tbody>
										<tr>
											<td class="textright"><b>Sub-Total:</b></td>
											<td class="textright">$<%= SubTotale %></td>
										</tr>
										<tr>
											<td class="textright"><b>Eco Tax (-2.00):</b></td>
											<td class="textright">$2.00</td>
										</tr>
										<tr>
											<td class="textright"><b>VAT (17.5%):</b></td>
											<td class="textright">$<%= Vat %></td>
										</tr>
										<tr>
											<td class="textright"><b>Total:</b></td>
											<td class="textright">$<%= Totale %></td>
										</tr>
									</tbody>
								</table>
								<div class="well pull-right">
									<a href="#" class="btn btn-success">View Cart</a> <a href="#"
										class="btn btn-success">Checkout</a>
								</div>
							</li>
						</ul></li>
				</ul>
			</div>
		</div>
		<!--Sticky Navbar End -->
		<div class="header-white">
			<div class="container">
				<div class="row">
					<div class="span4">
						<a class="logo" href="Home"><img
							src="./images/iii.png" alt="ShopSimple" title="ShopSimple"></a>
					</div>
					<div class="span8">
						<div class="row">
							<div class="pull-right logintext">
							<% if (!(utilisateur == null)){ %>  
							     <table>
                                          <tr>
                                                <td>
                                                  <span  class="frame">
                                                     <img width="50" height="50" alt="" src="<%= utilisateur.getPhoto() %>">
                                                  </span>   
                                                </td>
                                                
                                                <td>
                                                    Welcome,  
                                                    <%= utilisateur.getUsername() %>
                                                     
                                                     <br>
                                                     <a href="logout.jsp">Logout</a>
                                                </td>
                                          </tr>
                               
                               </table> 
                               
                             
							</div>
						</div>
						<form class="form-search marginnull topsearch pull-right">
							<input type="text"
								class="input-large search-query search-icon-top"
								value="Search here..."
								onFocus="if (this.value=='Search here...') this.value='';"
								onblur="if (this.value=='') this.value='Search here...';">
						</form>
					</div>
				</div>
			</div>
			<div >
				<div class="container">
        <nav class="subnav">
          <ul class="nav-pills categorymenu">
            <li><a href="index-2.html">Home</a>
            </li>
            <li><a  href="product.html">Books</a>
            </li>
              <li><a   class="active" href="panier.jsp">Panier</a>
            </li>
            <li><a href="inscription.jsp">Signup</a>
            </li>
            <li><a href="login.jsp">Login</a>
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
		<section id="checkout">
			<div class="container">
				<h1 class="headingmain">Your Panier
					<!-- <span>Your Panier</span> -->
				</h1>
				<div class="cart-info">
					
					
					 <form action="Panier" method="post"> 
        
        <table class="table table-striped table-bordered">
           <tr>
                
               
                <td>Nom </td>
                <td>Image </td>
                <td>Description</td>
                <td>Prix</td>
                <td>Quantit�</td>
                <td>Action</td>
                
                
           </tr>
           
           <% for(Panier u : listpanier) { %>
             <tr>
              
               
                <td><%= u.getNom()%></td>
                <td><a href="<%= u.getImage()%>" ><IMG SRC="<%= u.getImage()%>"  WIDTH="50" HEIGHT="50" /></a></td>
                <td><%= u.getDescription()%></td>
                <td><%= u.getPrix()%></td>
                <td><input type="text" name="qte" value="<%= u.getQte()%>"/>  </td>
                
                <input type="hidden" name="id" value="<%= u.getId()%>">
                
                
                <td> <input type="submit" value="Edit" /> <a href="Panier?id=<%= u.getId()%>&action=delete"><input type="button" value="Delete" /> </a> </td>
                
             </tr>
            <%} %>
        
      
      </table>
      
      </form>
					
					
				</div>
				<div class="row">
					<div class="pull-right">
						<div class="span4 pull-right">
							<table class="table table-striped table-bordered ">
								<tr>
									<td><span class="extra bold">Sub-Total :</span></td>
									<td><span class="bold">$<%= SubTotale %></span></td>
								</tr>
								<tr>
									<td><span class="extra bold">Eco Tax (-2.00) :</span></td>
									<td><span class="bold">$<%= Tax %></span></td>
								</tr>
								<tr>
									<td><span class="extra bold">VAT (17.5%) :</span></td>
									<td><span class="bold">$<%= Vat %></span></td>
								</tr>
								<tr>
									<td><span class="extra bold totalamout">Total :</span></td>
									<td><span class="bold totalamout">$ <%= Totale %></span></td>
								</tr>
							</table>
							<form action="Checkout">
							<input type="hidden" name="idUser" value="<%= utilisateur.getId()%>">
							<input type="hidden" name="commande" value="<%= Commande %>">
							<input type="hidden" name="totale" value="<%= Totale%>">
							<input type="submit" value="CheckOut"
								class="btn btn-success pull-right"> <input type="submit"
								value="Continue Shopping"
								class="btn btn-success pull-right mr10">
								
								</form>
						</div>
					</div>
				</div>
				
			
			</div>
		</section>
	</div>

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
	<script src="./assets/template1/assets/js/cloud-zoom.1.0.2.js"></script>
	<script src="./assets/template1/assets/jscloud-zoom.1.0.2.min.html"></script>
	<script type="text/javascript"
		src="./assets/template1/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<script type="text/javascript" src="./assets/template1/assets/js/jquery.validate.js"></script>
	<script defer src="./assets/template1/assets/js/custom.js"></script>
	
	<script src="./assets/FancyZoom/js-global/FancyZoom.js" type="text/javascript"></script>
   <script src="./assets/FancyZoom/js-global/FancyZoomHTML.js" type="text/javascript"></script>
	 <% } %>
</body>
</html>