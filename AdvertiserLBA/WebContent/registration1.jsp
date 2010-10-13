</head>
	<script type="text/javascript" src="javascripts/jquery.js"></script>
	<script type="text/javascript" src="javascripts/jquery.validate.js"></script>
	<script type="text/javascript">
	//initiate validator on load
	$(function() {
		alert("qaz");
		// validate contact form on keyup and submit
		$("#contactForm").validate({
			//set the rules for the field names
			rules: {
				name: {
					required: true,
					minlength: 2
				},
				email: {
					required: true,
					email: true
				},
				message: {
					required: true,
					minlength: 2
				},
			},
			//set messages to appear inline
			messages: {
				name: "Please enter your name",
				email: "Please enter a valid email address",
				message: "Please enter your message"
			}
		});
	});
</script>
<style type="text/css">
.error {
	color: red;
	font: 12pt verdana;
	padding-left: 10px
}
</style>
	<body>
	<div id="container">
		<form id="contactForm" method="" action="">
			<p>
				<label for="name">Name </label>
				<input id="name" name="name" />
			</p>
			<p>
				<label for="email">E-Mail </label>
				<input id="email" name="email" />
			</p>	
			<p>	
				<label for="message">Your Message </label>
				<textarea id="message" name="message" rows="4" cols="30" ></textarea>
			</p>
			<p>
				<input class="submit" type="submit" value="submit"/>
			</p>
		</form>
		</div>
	</body>
</html>