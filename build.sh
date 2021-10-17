rm -rf dist
imba build --baseurl "." server.imba
cp -a public/. dist/public
