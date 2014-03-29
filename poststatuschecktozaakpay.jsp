<%@page import="com.zaakpay.api.lib.ChecksumCalculator"%>
<%@page import="com.zaakpay.api.lib.ParamSanitizer"%>
<%@page import="java.util.Enumeration"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Zaakpay</title>
<%
			//	Please insert your own secret key here
			String secretKey = "Your secret key goes here";
			String allParamValue = ChecksumCalculator.getAllNotEmptyParamValue(request).trim();
			String checksum = ChecksumCalculator.calculateChecksum(secretKey, allParamValue);
			request.setAttribute("checksum", checksum);
%>
<script type="text/javascript">
function submitForm(){
			var form = document.forms[0];
			form.submit();
		}
</script>
</head>
<body onload="javascript:submitForm()">
<center>
<table width="500px;">
	<tr>
		<td align="center" valign="middle">Do Not Refresh or Press Back <br/> Redirecting to Zaakpay</td>
	</tr>
	<tr>
		<td align="center" valign="middle">
			<form action="https://api.zaakpay.com/checktransaction" method="post">
			<%
				Enumeration paramNames = request.getParameterNames();
                                while (paramNames.hasMoreElements()) {
                                        String param = (String)paramNames.nextElement();
                        %>
                        		<input type="hidden" name="<%=param%>" value="<%=ParamSanitizer.sanitizeParam(request.getParameter(param))%>" />
                        <%
				}
			%>
				<input type="hidden" name="checksum" value="<%=request.getAttribute("checksum")%>" />
			</form>
		</td>

	</tr>

</table>

</center>	
</body>
</html>
