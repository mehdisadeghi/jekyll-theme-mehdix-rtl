var disqus_shortname = 'mehdix';

var load_disqus = function () {
  var nodes = document.getElementsByTagName('span');
  for (var i = 0, url; i < nodes.length; i++) {
    if (nodes[i].className.indexOf('dsq-postid') != -1) {
      nodes[i].parentNode.setAttribute('data-disqus-identifier', nodes[i].getAttribute('data-dsqidentifier'));
      url = nodes[i].parentNode.href.split('#', 1);
      if (url.length == 1) { url = url[0]; }
      else { url = url[1]; }
      nodes[i].parentNode.href = url + '#disqus_thread';
    }
  }
  var s = document.createElement('script'); 
  s.async = true;
  s.type = 'text/javascript';
  s.src = '//' + disqus_shortname + '.disqus.com/count.js';
  (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
};


if (typeof ds_loaded == "undefined") {
          var ds_loaded = false; //To track loading only once on a page.
        }
function loadDisqus() {
var disqus_div = document.getElementById("disqus_thread"); //The ID of the Disqus DIV tag
var top = disqus_div.offsetTop;
var disqus_data = disqus_div.dataset;
if ( !ds_loaded && ( window.scrollY || window.pageYOffset ) + window.innerHeight > top ) 
{
  ds_loaded = true;
  for (var key in disqus_data) 
  {
    if (key.substr(0,6) == "disqus") 
    {
      window["disqus_" + key.replace("disqus","").toLowerCase()] = disqus_data[key];
    }
  }
  var dsq = document.createElement("script");
  dsq.type = "text/javascript";
  dsq.async = true;
  dsq.src = "http://" + window.disqus_shortname + ".disqus.com/embed.js";
  if(document.getElementById("dcl-hidden-div")) {
    document.getElementById("dcl-hidden-div").innerHTML = "Loading...";
  }
  (document.getElementsByTagName("head")[0] || document.getElementsByTagName("body")[0]).appendChild(dsq);
}    
}

  var disqus_div_new = document.getElementById("disqus_thread");
  var divExists = disqus_div_new != null;
  if(document.body.scrollHeight < window.innerHeight){
    loadDisqus();
  } else if(divExists) {
    window.onscroll = function() { loadDisqus(); }
  }

// ***********************************
$(document).ready(function() {
  $('.show-comments').on('click', function(){
    var disqus_shortname = 'mehdix';

          // ajax request to load the disqus javascript
          $.ajax({
            type: "GET",
            url: "http://" + disqus_shortname + ".disqus.com/embed.js",
            dataType: "script",
            cache: true
          });
          // hide the button once comments load
          $(this).fadeOut();
        });
});
