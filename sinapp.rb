require 'rubygems'
require 'sinatra'
require 'haml'
require 'rest_client'

get '/' do
      haml :index
end

get '/help' do
      haml :help
end

get '/json/null' do
      status 200
      headers "Content-Type" => "application/json"
      body "{}"
end

# should send app to webhook at kynetx
# prob use rest_client for that!
get %r{/(a\d+x\d+)/?.*} do |app|
      #RestClient.get "http://webhooks.kynetxapps.net/h/a421x53/ktest?ruleset=#{app}"
<<EOF
<html>
<head>
<title>ktest.heroku.com #{app}</title>
</head>
<body>
<script type="text/javascript">
      var d = document;
      var s = d.createElement("script");
      s.text='KOBJ_configs=typeof(KOBJ_CONFIGS)=="undefined"?[]:KOBJ_configs;'+
      'KOBJ_configs.push({ "rids": ["#{app}"],"#{app}:kynetx_app_version": "dev","#{app}:site_tag": "true" });';
      d.body.appendChild(s);
      var l = d.createElement('script');
      l.src='http://init.kobj.net/js/shared/kobj-static.js';
      d.body.appendChild(l);
</script>
 <div id="container">
 <div id="header">
  <div>Running #{app}</div>
 </div>
 <div id="content">
  <div id="main"></div>
 </div>
 <div id="footer">ktest.heroku.com from Rando Media LLC</div>
 </div>
</body>
</html>
EOF
end


