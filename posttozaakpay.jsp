<%@page import="com.zaakpay.api.lib.*"%>
<%@page import="java.util.Enumeration"%>
<%
			// Please insert your own secret key here
			String secretKey = "Here goes your Secret Key";
			String allParamValue = ChecksumCalculator.getAllNotEmptyParamValue(request).trim();
			System.out.println("allParamValue : " + allParamValue );
			System.out.println("secretKey : " + secretKey );
			String checksum = ChecksumCalculator.calculateChecksum(secretKey, allParamValue);
			request.setAttribute("checksum", checksum);
%>
			
			

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Zaakpay</title>
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
			<form action="https://api.zaakpay.com/transact" method="post">
			<%
				Enumeration paramNames = request.getParameterNames();
				while (paramNames.hasMoreElements()) {
					String param = (String)paramNames.nextElement();
					if ("returnUrl".equals(param)) {
			%>
						<input type="hidden" name="<%=param%>" value="<%=ParamSanitizer.SanitizeURLParam(request.getParameter(param))%>" />
			<%
					} else {
			%>
						<input type="hidden" name="<%=param%>" value="<%=ParamSanitizer.sanitizeParam(request.getParameter(param))%>" />
			<%
					}
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
			
