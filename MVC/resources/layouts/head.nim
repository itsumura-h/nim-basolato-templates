import basolato/view

proc headView*():string = tmpli html"""
$(csrf_token())
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
"""
