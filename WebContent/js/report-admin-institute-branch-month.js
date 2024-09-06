
jQuery(function($)
		{	
	//alert("inside js 2:::;",true)
			$("#instituteCodeajax").on("change",function()
			{	
				//alert("inside js 2::piaId:::::::::;")

				institutecode = $(this).val();    
				//alert("inside js 2::piaId:::::::::;"+institutecode,true)
				
				$.ajax({
					url:'getInstituteCodeToBranch.html',
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
						
						$("#branchAjax").empty();
						var text ="<option value=''>Select</option> ";
						
						
							$("#branchAjax").append(text);
							
					        /*location.reload();*/
						$(data).each(function(key,val){
							var text ="<option value='"+val.courseName+"'>"+val.courseName+"</option> ";
							$("#branchAjax").append(text);
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
		
						$("#branchAjax").on("change",function()
						{	
							
							branch = $(this).val(); 
							var	institutecode= $('#instituteCodeajax').val(); 

							//alert("inside js 4::piaId:::::::::;"+branch,true)
							//alert("inside js 4::piaId:::::::::;"+institutecode,true)
							
							$.ajax({
								url:'getBranchToMonth.html',
								type:'GET',
								cache:false,
								dataType:'json',
								data: {branch:branch,institutecode:institutecode}, 
								beforeSend: function(xhr) {
							        xhr.setRequestHeader("Accept", "application/json");
							        xhr.setRequestHeader("Content-Type", "application/json");
								},
								success:function(data)
								{
									console.log(data);
									
									
									$("#monthAjax").empty();
									var text ="<option value=''>Select</option> ";
									
									
										$("#monthAjax").append(text);
										
								        /*location.reload();*/
									$(data).each(function(key,val){
										var text ="<option value='"+val.month+"'>"+val.month+"</option> ";
										$("#monthAjax").append(text);
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