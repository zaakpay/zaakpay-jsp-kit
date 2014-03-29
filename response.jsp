<%@page import="com.zaakpay.api.lib.ChecksumCalculator"%>
<%@page contentType="text/html" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Zaakpay</title>
</head>
<body>
	<% 
	
		String orderId = request.getParameter("orderId");
		String responseCode = request.getParameter("responseCode");
		String responseDescription = request.getParameter("responseDescription");
		String transactionId = request.getParameter("transactionId");
		String amount = request.getParameter("amount");
		String checksum = request.getParameter("checksum");	
		boolean isChecksumValid = false;
		
		// Please insert your own secret key here
		String secretKey = "Here goes your Secret Key";
		
		String allParamValue = ("'"+orderId+"''"+responseCode+"''"+responseDescription+"'").trim();
		System.out.println("Response allParamValue : " + allParamValue );
		System.out.println("secretKey : " + secretKey );
		if(checksum != null){
			isChecksumValid = ChecksumCalculator.verifyChecksum(secretKey, allParamValue,checksum);
		}
	%>

	<center>
		<table width="800px;">
			<tr>
				<td colspan="2" align="center" valign="middle">This Page is for Testing purpose later on will be on merchant Site</td>
			</tr>
			<tr>
				<td width="30%" align="center" valign="middle">Order Id</td>
				<td width="70%" align="center" valign="middle"><%=orderId %> </td>
			</tr>
			
			<tr>
				<td  align="center" valign="middle">Response Code</td>
				<% if(isChecksumValid){ %>
					<td  align="center" valign="middle"><%=responseCode%></td>
				<% } else{ %>
					<td  align="center" valign="middle"><font color=Red>***</font></td>
				<% } %>
			</tr>
			
			<tr>
				<td  align="center" valign="middle">Response Description</td>
				<% if(isChecksumValid){ %>
					<td  align="center" valign="middle"><%=responseDescription%></td>
				<% } else{ %>
					<td  align="center" valign="middle"><font color=Red>This response is compromised.</font></td>
				<% } %>
			</tr>

			<tr>
				<td width="100%" align="center" valign="middle">Checksum verified?</td>
				<% if(isChecksumValid){ %>
					<td width="100%" align="center" valign="middle">Yes</td>
				<% } else{ %>
					<td width="100%" align="center" valign="middle"><font color=Red>No</font></td>
				<% } %>
			</tr>
		</table>
	
	
	</center>		
</body>
</html>
