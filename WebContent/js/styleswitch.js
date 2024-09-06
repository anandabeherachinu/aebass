/**
* Styleswitch stylesheet switcher built on jQuery
* Under an Attribution, Share Alike License
* By Kelvin Luck ( http://www.kelvinluck.com/ )
**/

(function($)
{
	$(document).ready(function() {
	 
		$('.styleswitch').click(function()
		{
				 
			this.blur();
				 
			var overlay=buildOverlay();
				 
			var rel=this.getAttribute("rel");
				 
			overlay.fadeIn('slow', function() {
			 
			switchStylestyle(rel);
				 
			overlay.fadeOut('slow', killOverlay());
				
			}); 
			return false;
		});
		var c = readCookie('style');
		if (c) switchStylestyle(c);
		
		
	});

	function switchStylestyle(styleName)
	{
		$('link[rel*=style][title]').each(function(i) 
		{
			this.disabled = true;
			if (this.getAttribute('title') == styleName) this.disabled = false;			
		});		
		createCookie('style', styleName, 365);
	}
	
})(jQuery);

function createCookie(name,value,days)
{
	if (days)
	{
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = "; expires="+date.toGMTString();
	}
	else var expires = "";
	document.cookie = name+"="+value+expires+"; path=/";
}
function readCookie(name)
{
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for(var i=0;i < ca.length;i++)
	{
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1,c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	}
	return null;
}
function eraseCookie(name)
{
	createCookie(name,"",-1);
}
///cookie functions
function buildOverlay() {
	
    var overlay = $('<div>')
      .attr('id', 'style-switcher-overlay')
      .appendTo($('body'))
      .hide()
      .css(
        {
        	 
          height:     '100%',
          width:      '100%',
          background: '#000000',
          position:   'absolute',
          top:        $(window).scrollTop(),
          left:       $(window).scrollLeft(),
          zIndex:     9999
        }
      );
    return overlay;
  }

 function killOverlay() {
    $('#style-switcher-overlay').remove();
  }
