
jQuery(function($)
		{	
	//alert("inside js 2:::;",true)
			$("#institutecodeajax").on("change",function()
			{	
				//alert("inside js 2::piaId:::::::::;")

				institutecode = $(this).val();    
				//alert("inside js 2::piaId:::::::::;"+institutecode,true)
				
				$.ajax({
					url:'getInstituteCode.html',
					type:'GET',
					cache:false,
					dataType:'json',
					data: {institutecode:institutecode}, 
					beforeSend: function(xhr) {
				        xhr.setRequestHeader("Accept", "application/json");
				        xhr.setRequestHeader("Content-Type", "application/json");
					},
					success:function(data)
					{
						console.log(data);
						
						$("#semesterAjax").empty();
						var text ="<option value=''>Select</option> ";
						
						
							$("#semesterAjax").append(text);
							
					        /*location.reload();*/
						$(data).each(function(key,val){
							var text ="<option value='"+val.semestar+"'>"+val.semestar+"</option> ";
							$("#semesterAjax").append(text);
						});			 
						
						
						
					},
					error:function(xhr,status,error)
					{
						console.log("ERROR");
						console.log(error);
						console.log(xhr);
					}
					
				});
			});
			
			
					
			
		});
