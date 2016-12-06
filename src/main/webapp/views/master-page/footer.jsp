<%--
 * footer.jsp
 *
 * Copyright (C) 2013 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<jsp:useBean id="date" class="java.util.Date" />

<hr />
<H5> Ayudamos a mejorar. Agora@us es un sistema de votaciones gratuito.</H5>
<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_donations">
<%--
 A este correo se redirigen las donaciones, que son de un importe fijo de 5 euros. Se pouede moficiar en cualquier momento. 
 --%>
<input type="hidden" name="business" value="suzfsr@gmail.com">
<input type="hidden" name="lc" value="ES">
<input type="hidden" name="item_name" value="Agora@US">
<input type="hidden" name="amount" value="5.00">
<input type="hidden" name="currency_code" value="EUR">
<input type="hidden" name="no_note" value="0">
<input type="hidden" name="bn" value="PP-DonationsBF:btn_donateCC_LG.gif:NonHostedGuest">
<input type="image" src="https://www.paypalobjects.com/es_ES/ES/i/btn/btn_donateCC_LG.gif" border="0" name="submit" alt="PayPal. La forma r�pida y segura de pagar en Internet.">
<img alt="" border="0" src="https://www.paypalobjects.com/es_ES/i/scr/pixel.gif" width="1" height="1">
</form>


<b>Copyright &copy; <fmt:formatDate value="${date}" pattern="yyyy" />AgoraUS</b> <div>
		<a href="?language=en"><img src="images/en.png"></a> | <a href="?language=es"><img src="images/es.png"></a>
</div><div></div>