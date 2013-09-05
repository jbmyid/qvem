#= require 'jquery.qtip2.min'
#= require 'jquery.validate'

@remove_errors = (form) ->
  $("span.error",form).remove()
  $(".error", form).removeClass("error")
  $("input").qtip("destroy")

@set_error_qtip = (elem) ->
  elem.qtip
    content:
      attr: "data-error"
    position:
      my: "bottom right"
      at: "top right"

$(window).bind "load", ->
  $("span[data-error]").each (v)->
    ths = $(this)
    error = ths.data('error')
    if ($.trim(error).length > 0)
      $("span.mceEditor", ths).addClass("error")
      $("input, textarea, select, span.mceEditor", ths).qtip({
        content:
          text: error
        position:
          my: "bottom right"
          at: "top right"
      })
$ ->
  $.validator.setDefaults({
    errorPlacement: (error, element) ->
      a = $.map error, (v) -> $(v).html()
      #$.each a, (i,v) ->
      #  a[i] = v + $(element).data("fieldname").split("_").join(" ") if v=="Please enter "
      $(element).attr("data-error",a.join())
      $(element).qtip({
        content:
          attr: 'data-error'
        position:
          my: "bottom right"
          at: "top right"
        style:
          width: 140
          padding: 2
          marginBottom: 5
          background: "#444"
          font: 10
          color: "#fff"
          textAlign: "center"
          tip: "bottomRight"
          border:
            radius: 5,
            color: "#222"
      })
  });