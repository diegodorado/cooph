$ ->

  #bind window resize and trigger it once    
  $(window).resize(->
    wh = $(this).height()
    $('#oc').height  wh
  ).trigger "resize"
