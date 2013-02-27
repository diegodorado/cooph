---
title: Floats and Container Height
tags: wiki
---

CSS Floats and Container Height
-------------------------------

As pointed out by rborn in the comments below a better way is to simple
set the container overflow css property to “auto”. This does the job for
you and is a bit tidied that the following solution. However, it might
still be use to some of you anyway as it describes the clear property in
CSS.

It’s been a while since I think I’ve learned something new in the CSS
world. So I’m glad to have been recently taught something by a friend.
The problem

For simplicities sake, I’ll just discuss DIV’s. When you make a DIV
float (DivB) and its inside another DIV (DivA) if DivB has a fixed
height and the container, DivA doesn’t it will overflow and DivA will
not expand to the height of DivB. Ok, that that was confusing to write,
so I can’t imagine what it’s like to read.

Here is an example
------------------

``

    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Float Problem</title>
      </head>

      <body>
        <style type="text/css">
          #container{
            width: 400px;
            border: 1px solid red;
          }
          .float{
            float: left;
            width: 360px;
            height: 360px;
            margin: 10px;
            padding: 10px;
            border: 1px solid black;
          }
        </style>

        <div id="container">
          <div class="float"></div>
        </div>

      </body>
    </html>

The solution
------------

The “clear” property… So what is it?

“This property specifies if an element allows floating elements on its
sides. More specifically, the value of this property lists the sides
where floating elements are not accepted. With ‘clear’ set to ‘left’, an
element will be moved below any floating element on the left side. With
‘clear’ set to ‘none’, floating elements are allowed on all sides.”
([http://www.w3.org/TR/CSS1/\#clear](http://www.w3.org/TR/CSS1/#clear))

So, here is the fix… Basically, add another DIV inside DivA (the
container) and below DivB in the HTML, set the clear property to “both”
and it will push the div height down.

Here is the implementation… Firstly add this to the CSS

``

    .floatfix{
      clear: both;
    }

And finally change the HTML to this ``

    <div id="container">
    <div class="float"></div>
    <div class="floatfix"></div>
    </div>

