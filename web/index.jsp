<%-- 
    Document   : index
    Created on : 24 Jun, 2015, 9:06:30 AM
    Author     : Akach
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="javax.servlet.http.HttpSession" %>
<%
HttpSession sessionsa = request.getSession(false);
HttpSession sessions = request.getSession(false);
sessionsa.setAttribute("name", null);
sessionsa.setAttribute("email", null);
sessionsa.setAttribute("id", null);
sessionsa.setAttribute("date", null);
sessions.setAttribute("offset", 0);
%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>AVS | The Creative People</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="css/login.css" type="text/css">

    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" type="text/css">

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="css/animate.min.css" type="text/css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/creative.css" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->



</head>

<body id="page-top">

    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">AVS Technologies</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="page-scroll" href="#">Home</a>
                    </li>
                   	<li>
                        <a class="page-scroll" href="#services">Services</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#contact">Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <header>
        <div class="header-content">
            <div class="header-content-inner">
            <!--left-->
            <div class="col-lg-4"></div>
            <!--container-->
            <div class="col-lg-4">
            	<form class="form-horizontal" action="loginController" method="post">
            		<h2><img src="img/NCR-AVS-logo.png">Technologies</h2>
					<div class="form-group">
 			 			<input class="form-control-tr" type="text" autofocus="autofocus" placeholder="username" id="user" name="user" tabindex="1" required>
					</div>
					<div class="form-group">
  						<input class="form-control-tr" type="password" placeholder="password" id="pass" name="pass" tabindex="2"  required>
					</div>
					
                    <div class="form-group">
        				<select class="form-control-tr" name="select">
          					<option>Select User Type</option>
          					<option>Employee</option>
          					<option>Admin</option>
          					<option>Manager</option>
          					<option>Transporter</option>
        				</select>
                    </div>
            
            		<div class="form-group">
      					<div class="col-lg-10 col-lg-offset-2">
       						<button type="reset" class="btn btn-default">Reset</button>
        					<button type="submit" class="btn btn-primary">Login</button>
      					</div>
   					 </div>
            	</form>
				
				
            </div>
            <!--right-->
            <div class="col-lg-4"></div>
            </div>
        </div>
    </header>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>
    <script src="js/jquery.fittext.js"></script>
    <script src="js/wow.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/creative.js"></script>
	
	
	<script>
			// Homerolled.   We're not logged in and don't have access to cjt and yui.
	
						var MESSAGES = {
								"ajax_timeout" : "The connection timed out. Please try again.",
								"authenticating" : "Authenticating …",
								"changed_ip" : "Your IP address has changed. Please log in again.",
								"expired_session" : "Your session has expired. Please log in again.",
								"invalid_login" : "The login is invalid.",
								"invalid_session" : "Your session cookie is invalid. Please log in again.",
								"invalid_username" : "The submitted username is invalid.",
								"network_error" : "A network error occurred while sending your login request. Please try again. If this condition persists, contact your network service provider.",
								"no_username" : "You must specify a username to login.",
								"prevented_xfer" : "The session could not be transferred because you were not accessing this service over a secure connection. Please login now to continue.",
								"session_locale" : "The desired locale has been saved to your browser. To change the locale in this browser again, select another locale on this screen.",
								"success" : "Login successful. Redirecting …",
								"token_incorrect" : "The security token in your request is invalid.",
								"token_missing" : "The security token is missing from your request.",
								"": 0
			};
			delete MESSAGES[""];
	
			window.IS_LOGOUT = false;
	
		"use strict";

var FADE_DURATION = 0.45;
var FADE_DELAY = 20;
var AJAX_TIMEOUT = 30000;

var LOCALE_FADES = [];
var HAS_CSS_OPACITY = "opacity" in document.body.style;
var login_form = DOM.get("login_form");
var login_username_el = DOM.get('user');
var login_password_el = DOM.get('pass');
var login_submit_el   = DOM.get("login_submit");

// Set up the caches.
var div_cache = {        // An object we'll use to do quick lookups of commonly accessed elements.
    "login-page": DOM.get('login-page') || false,
    "locale-container": DOM.get('locale-container') || false,
    "login-container": DOM.get('login-container') || false,
    "locale-footer": DOM.get('locale-footer') || false,
    "content-cell": DOM.get('content-container') || false,
    "invalid": DOM.get('invalid') || false
};
var content_cell = div_cache['content-cell'];

if (div_cache['locale-footer']) div_cache['locale-footer'].style.display='block';  // Enable the locale footer for people with javascript.

var reset_form = DOM.get("reset_form");
var reset_username_el = DOM.get('reset_pass_username');
var RESET_FADES = [];
var show_reset = function () {
    if ( !reset_username_el.value ) reset_username_el.value = login_username_el.value;

    while ( RESET_FADES.length ) clearInterval( RESET_FADES.shift() );
    RESET_FADES.push( fade_in(reset_form) );
    RESET_FADES.push( fade_out(login_form) );

    reset_username_el.focus();
};

var hide_reset = function () {
    while ( RESET_FADES.length ) clearInterval( RESET_FADES.shift() );
    RESET_FADES.push( fade_in(login_form) );
    RESET_FADES.push( fade_out(reset_form) );

    login_username_el.focus();
};

function toggle_locales(show_locales) {
    while ( LOCALE_FADES.length ) clearInterval( LOCALE_FADES.shift() );

    var newly_shown = div_cache[ show_locales ? "locale-container" : "login-container" ];
    set_opacity( newly_shown, 0 );
    if (HAS_CSS_OPACITY) {
        content_cell.replaceChild( newly_shown, content_cell.children[0] );
    }
    else {
        var old = content_cell.children[0];
        content_cell.insertBefore( newly_shown, old );
        newly_shown.style.display = "";
        old.style.display = "none";
    }

    LOCALE_FADES.push( fade_in(newly_shown) );
    LOCALE_FADES.push( (show_locales ? fade_out : fade_in)('locale-footer') );
}

if (HAS_CSS_OPACITY) {
    var set_opacity = function set_opacity(el, opacity) {
        el.style.opacity = opacity;
    };
}
else {
    var filter_regex = /(DXImageTransform\.Microsoft\.Alpha\()[^)]*\)/;
    var set_opacity = function set_opacity(el, opacity) {
        var filter_text = el.currentStyle.filter;

        //Weird IE quirk: If you set an opacity in the element's style attribute, that will
        //override an opacity set via script. But, the only way to create a filter is to
        //do it in CSS. Yeah. :-p
        if (!filter_text) {
            el.style.filter = "progid:DXImageTransform.Microsoft.Alpha(enabled=true)";
        }
        else if ( !filter_regex.test(filter_text) ) {
            el.style.filter += " progid:DXImageTransform.Microsoft.Alpha(enabled=true)";
        }
        else {
            var new_filter = filter_text.replace(filter_regex,"$1enabled=true)");
            if (new_filter !== filter_text) el.style.filter = new_filter;
        }

        try {
            el.filters.item("DXImageTransform.Microsoft.Alpha").opacity = opacity*100;
        }
        catch(e) {
            try {
                el.filters.item("alpha").opacity = opacity*100;
            }
            catch(e) {
                //oops...This should't happen.
            }
        }
    };
}

function fade_in(el, duration, _fade_out_instead) {
    el = div_cache[el] || DOM.get(el) || el;
    var style_obj = el.style;
    var interval;

    var cur_style = window.getComputedStyle ? getComputedStyle(el,null) : el.currentStyle;
    var visibility = cur_style.visibility;

    var start_opacity;
    if (el.offsetWidth && visibility !== "hidden") {
        if ( window.getComputedStyle ) {
            start_opacity = Number(cur_style.opacity);
        }
        else {
            try {
                start_opacity = el.filters.item("DXImageTransform.Microsoft.Alpha").opacity;
            }
            catch(e) {
                try {
                    start_opacity = el.filters("alpha").opacity;
                }
                catch(e) {
                    start_opacity = 100;
                }
            }
            start_opacity /= 100;
        }
        if ( !start_opacity ) start_opacity = 0;
    }
    else {
        start_opacity = 0;
        set_opacity( el, 0 );
    }

    if ( _fade_out_instead && start_opacity < 0.01 ) {
        if (start_opacity) set_opacity( el, 0 );
        return;
    }

    if (!duration) duration = FADE_DURATION;
    var duration_ms = duration * 1000;
    var start = new Date();
    var end;
    if ( _fade_out_instead ) {
        end = duration_ms + start.getTime();
    }
    else {
        style_obj.visibility = "visible";
        style_obj.display = "block";
    }

    var fader = function () {
        var opacity;
        if ( _fade_out_instead ) {
            opacity = start_opacity * ( end - new Date() ) / duration_ms;
            if (opacity <= 0) {
                opacity = 0;
                clearInterval(interval);
                style_obj.visibility = "hidden";
								style_obj.display = "none";
            }
        }
        else {
            opacity = start_opacity + (1 - start_opacity) * ( new Date() - start ) / duration_ms;
            if (opacity >= 1) {
                opacity = 1;
                clearInterval(interval);
            }
        }

        set_opacity(el,opacity);
    };

    fader();
    interval = setInterval( fader, FADE_DELAY );

    return interval;
}

function fade_out(el, timeout) {
    return fade_in(el, timeout, true);
}

function ajaxObject(url, callbackFunction) {
    this._url      = url;
    this._callback = callbackFunction || function () { };
}

ajaxObject.prototype.updating = false;
ajaxObject.prototype.abort = function() {
    if ( this.updating ) {
        this.AJAX.abort();
        delete this.AJAX;
    }
};
ajaxObject.prototype.update = function(passData,postMethod) {
    if (this.AJAX) return false;

    var ajax = null;

    if (window.XMLHttpRequest) {
        ajax = new XMLHttpRequest();
    }
    else if ( window.ActiveXObject ) {
        ajax = new ActiveXObject("Microsoft.XMLHTTP");
    }
    else {
        return false;
    }

    var timeout;

    var that = this;
    ajax.onreadystatechange = function() {
        if ( ajax.readyState == 4 ) {
            clearTimeout(timeout);
            that.updating = false;
            that._callback(ajax);
            delete that.AJAX;
        }
    };
    try {
        var uri;
        timeout = setTimeout( function() {
            that.abort();
            show_status( MESSAGES.ajax_timeout, "error" );
        }, AJAX_TIMEOUT );

        if (/post/i.test(postMethod)) {
            uri = this._url + "?login_only=1";
            ajax.open("POST", uri, true);
            ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            ajax.send(passData);
        } else {
            uri= this._url +'?'+passData+'&timestamp='+(new Date()).getTime();
            ajax.open("GET", uri, true);
            ajax.send(null);
        }

        this.AJAX = ajax;
        this.updating = true;
    } catch (e) {
        login_form.submit();
    }

    return true;
};

var _text_content = ("textContent" in document.body) ? "textContent" : "innerText";

function login_results(ajax_obj) {
    var result;
    try {
        result = JSON.parse(ajax_obj && ajax_obj.responseText);
    }
    catch(e) {
        result = null;
    }

    var response_status = ajax_obj.status;
    if ( response_status === 200 ) {
        show_status( MESSAGES.success, "success" );
        fade_out( 'content-container', FADE_DURATION/2 );
        if (result) {
            var dest_uri = DOM.get("dest_uri").value;
            var final_uri;
            if ( dest_uri && !dest_uri.match(/^\/login\/?/) ) {
                final_uri = result.security_token + dest_uri;
            }
            else {
                final_uri = result.redirect;
            }

            if ( /^(?:\/cpsess[^\/]+)\/$/.test(final_uri) ) {
                top.location.href = final_uri;
            }
            else {
                if (result.security_token && (top !== window)) {
                    for (var f=0; f<top.frames.length; f++) {
                        if (top.frames[f] !== window) {
                            var href = top.frames[f].location.href.replace(/\/cpsess[.\d]+/, result.security_token);
                            top.frames[f].location.href = href;
                        }
                    }
                }

                location.href = final_uri;
            }
        }
        else {
            login_form.submit();
        }
        return;
    }
    else {
        if ( parseInt(response_status / 100, 10) === 4 ) {
            var msg_code = result && result.message;
            show_status( MESSAGES[msg_code || "invalid_login"] || MESSAGES.invalid_login, "error");
            set_status_timeout();
        }
        else {
            show_status( MESSAGES.network_error, "error" );
        }

        show_links(document.body);
        login_button.release();
        return;
    }
}

var level_classes = {
    info:  "alert-info",
    error: "alert-error",
    success: "alert-success",
    warn:  "alert-warning"
};
var levels_regex = "";
for (var lv in level_classes) levels_regex += "|"+level_classes[lv];
levels_regex = new RegExp("\\b(?:" + levels_regex.slice(1) + ")\\b");

function show_status( message, level ) {
    DOM.get("login-status-message")[_text_content] = message;

    var container = DOM.get("login-status");
    var this_class = level && level_classes[level] || level_classes.info;
    var el_class = container.className.replace(levels_regex, this_class);
    container.className = el_class;

    fade_in(container);
    reset_status_timeout();
}

var STATUS_TIMEOUT = null;
function reset_status_timeout() {
    clearTimeout( STATUS_TIMEOUT );
    STATUS_TIMEOUT = null;
}
function set_status_timeout( delay ) {
    STATUS_TIMEOUT = setTimeout( function() { fade_out("login-status"); }, delay || 8000 );
}

//LOGIN_SUBMIT_OK prevents rapid-fire login requests from holding ENTER.
var LOGIN_SUBMIT_OK = true;
document.body.onkeyup = function() {
    LOGIN_SUBMIT_OK = true;
};
document.body.onmousedown = function() {
    LOGIN_SUBMIT_OK = true;
};
function do_login() {
    if (LOGIN_SUBMIT_OK) {
        LOGIN_SUBMIT_OK = false;
        hide_links(document.body);
        login_button.suppress();
        show_status( MESSAGES.authenticating, "info" );
        var ajax_login = new ajaxObject(login_form.action, login_results);
        ajax_login.update(
            'user=' + encodeURIComponent(login_username_el.value) +
            '&pass=' + encodeURIComponent(login_password_el.value),
            'POST'
        );
    }
    return false;
}

function _set_links_style(el, prop, val) {
    var links = el.getElementsByTagName("a");
    for (var lk=links.length-1; lk>=0; lk--) {
        links[lk].style[prop] = val;
    }
}
function hide_links(el) {
    _set_links_style(el,"visibility","hidden");
}

function show_links(el) {
    _set_links_style(el,"visibility","");
}

var login_button = {
    button: login_submit_el,
    _suppressed_disabled: null,
    suppress: function() {
        if ( this._suppressed_disabled === null ) {
            this._suppressed_disabled = this.button.disabled;
            this.button.disabled = true;
        }
    },
    release: function() {
        if ( this._suppressed_disabled !== null ) {
            this.button.disabled = this._suppressed_disabled;
            this._suppressed_disabled = null;
        }
    },
    queue_disabled: function(state) {
        if ( this._suppressed_disabled === null ) {
            this.button.disabled = state;
        }
        else {
            this._suppressed_disabled = state;
        }
    }
};

if ( !window.JSON ) {
    login_button.suppress();
    var new_script = document.createElement("script");
    new_script.onreadystatechange = function() {
        if ( this.readyState === "loaded" || this.readyState === "complete" ) {
            this.onreadystatechange = null;
            window.JSON = { parse: window.jsonParse };
            window.jsonParse = undefined;  //IE can't delete window.*

            login_button.release();
        }
    };
    new_script.src = "/unprotected/json-minified.js";
    document.getElementsByTagName("head")[0].appendChild(new_script);
}

try {
    login_form.onsubmit = do_login;
    set_opacity( DOM.get("login-wrapper"), 0 );
    LOCALE_FADES.push( fade_in("login-wrapper") );

    var preload = document.createElement("div");
    preload.id = "preload_images";
    document.body.insertBefore(preload, document.body.firstChild);

    if ( window.IS_LOGOUT ) {
        set_status_timeout( 10000 );
    }
    else if (/(?:\?|&)locale=[^&]/.test(location.search)) {
        show_status( MESSAGES.session_locale );
    }

    //WebKit browsers sometimes need this delay.
    setTimeout( function() {
        login_username_el.focus();
    }, 100 );
}
catch(e) {
    if (window.console) console.warn(e);
}
	</script>
</body>

</html>
