var disqus_shortname = '';

if (typeof ds_loaded == "undefined") {
    var ds_loaded = false; //To track loading only once on a page.
}

function loadDisqus() {
    var disqus_div = document.getElementById("disqus_thread"); //The ID of the Disqus DIV tag
    var top = disqus_div.offsetTop;
    var disqus_data = disqus_div.dataset;
    if (!ds_loaded && (window.scrollY || window.pageYOffset) + window.innerHeight > top) {
        ds_loaded = true;
        for (var key in disqus_data) {
            if (key.substr(0, 6) == "disqus") {
                window["disqus_" + key.replace("disqus", "").toLowerCase()] = disqus_data[key];
            }
        }
        var dsq = document.createElement("script");
        dsq.type = "text/javascript";
        dsq.async = true;
        dsq.src = "https://" + window.disqus_shortname + ".disqus.com/embed.js";
        if (document.getElementById("dcl-hidden-div")) {
            document.getElementById("dcl-hidden-div").innerHTML = "Loading...";
        }
        (document.getElementsByTagName("head")[0] || document.getElementsByTagName("body")[0]).appendChild(dsq);
    }
}

var disqus_div_new = document.getElementById("disqus_thread");
var divExists = disqus_div_new != null;

if (document.body.scrollHeight < window.innerHeight) {
    loadDisqus();
} else if (divExists) {
    window.onscroll = function() {
        loadDisqus();
    }
}
