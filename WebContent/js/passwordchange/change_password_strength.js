	var passwordPolicyFlag=false;
	
$(function(){
	//$('input[type=password]').keyup(function() {

	
	$('#newPassword').keyup(function() {
	    // keyup code here
		
		passwordPolicyFlag=false;
		var pswd = $(this).val();
		if ( pswd.length < 8 ) {
		    $('#length').removeClass('valid').addClass('invalid');
		    passwordPolicyFlag = true;
		} else {
		    $('#length').removeClass('invalid').addClass('valid');
		}
		//validate letter
		if ( pswd.match(/[A-z]/) ) {
		    $('#letter').removeClass('invalid').addClass('valid');
		} else {
		    $('#letter').removeClass('valid').addClass('invalid');
		    passwordPolicyFlag = true;
		}

		//validate capital letter
		if ( pswd.match(/[A-Z]/) ) {
		    $('#capital').removeClass('invalid').addClass('valid');
		} else {
		    $('#capital').removeClass('valid').addClass('invalid');
		    passwordPolicyFlag = true;
		}
		//validate special character
		if ( pswd.match(/[!,%,&,@,#,$,^,*,?,_,~]/) ) {
		    $('#special').removeClass('invalid').addClass('valid');
		} else {
		    $('#special').removeClass('valid').addClass('invalid');
		    passwordPolicyFlag = true;
		}
		//validate number
		if ( pswd.match(/\d/) ) {
		    $('#number').removeClass('invalid').addClass('valid');
		} else {
		    $('#number').removeClass('valid').addClass('invalid');
		    passwordPolicyFlag = true;
		}
		
	})
	.focus(function() 
	{
	    $('#pswd_info').show();
	})
	.blur(function()
	{
		if(passwordPolicyFlag==false)
		{
			$('#pswd_info').hide();
		}
	});
});
