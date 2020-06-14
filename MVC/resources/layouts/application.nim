import basolato/view
import head

proc applicationHtml*(this:View, title:string, body:string):string = tmpli html"""
<!DOCTYPE html>
<html lang="en">
<head>
  <title>$title</title>
  $(headHtml())
</head>
<body>
  $body
</body>
</html>
"""
