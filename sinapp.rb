require 'rubygems'
require 'sinatra'
require 'haml'

get '/' do
      haml :index
end

get %r{/(a\d+x\d+)*} do |app|
<<EOF
<html>
<head>
<title>ktest.heroku.com #{app}</title>
<script type="text/javascript">
      var KOBJ_config ={
            "rids": ["#{app}"],
            "#{app}:kynetx_app_version": "dev"
      };
</script>
<script type="text/javascript" src="http://init.kobj.net/js/shared/kobj-static.js">
</script>
</head>
<body>
 <div id="header"></div>
 <div id="content">
  <div>Running #{app}</div>
 </div>
 <div id="footer">ktest.heroku.com from Rando Media LLC</div>
</body>
</html>
EOF
end

get '/help' do
      '<div>Some help would be nice.</div>'
end

