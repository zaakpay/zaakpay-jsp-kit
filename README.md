Zaakpay Integration Kit for JSP

This is a ReadMe for the Zaakpay JSP kit.<br />
Zaakpay API is made up of 3 different APIs, which are described below.<br /><br />

<b>TRANSACT API :</b> This is the primary API used to perform a transaction.<br />
It makes use of the following files.<br />
<b><a href="test_merchant_input.html" style="color:#00D9FF; font:bold 15px/22px Arial, Helvetica, sans-serif;">test_merchant_input.html</a></b> : This is the HTML file which takes input from user & posts data.<br />

<b>posttozaakpay.jsp</b> : This is the file which accepts input, sanitizes it & posts it to the TRANSACT API.<br />
Please insert your secret key in this file.<br />

<b>response.jsp</b> : The TRANSACT API completes the transaction & redirects user to this file.<br />
Please insert your secret key in this file.<br />

<b>STATUS CHECK API :</b> Merchants can use this API to check the status of a prior transaction.<br />

It makes use of the following files.<br />

<b><a href="test_status_check_input.html" style="color:#00D9FF; font:bold 15px/22px Arial, Helvetica, sans-serif;">test_status_check_input.html</a></b> : This is the HTML file which takes input from user & posts data.<br />

<b>poststatuschecktozaakpay.jsp</b> : This is the file which accepts input, sanitizes it & posts it to the STATUS CHECK API.<br />
<b>Note : </b> We provide a checksum in the response xml. Please use it to verify the validity of the response.<br /><br />


<b>STATUS UPDATE API :</b> Merchants can use this API to update the status of a prior transaction.<br />

It makes use of the following files.<br />

<b><a href="test_mtx_update_input.html" style="color:#00D9FF; font:bold 15px/22px Arial, Helvetica, sans-serif;">test_mtx_update_input.html </a></b>: This is the HTML file which takes input from user & posts data.<br />

<b>postmtxupdatetozaakpay.jsp</b> : This is the file which accepts input, sanitizes it & posts it to the STATUS UPDATE API.<br />
<b>Note : </b> We provide a checksum in the response xml. Please use it to verify the validity of the response.