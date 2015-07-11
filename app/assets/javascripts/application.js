// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function addInfluenceAndRunSomeJavaScript() {
  $('#influence').focus(function(){
    (this).addEventListener('keypress', function (e) {
      var key = e.which || e.keyCode;
      if (key === 13) { // once ENTER key is presssed, do this:
        var influence_name = $('#influence').val();
        $('#influence').hide();
        $.ajax({
          url: "/add_influence/" + influence_name,
          type: "POST"
        })
      }} // close e function
    );
  });
}

function addInstrumentAndRunSomeJavaScript() {
  $("select#instrument").change(
    function() {
      var instrument_id = $("select#instrument option:selected")[0].value
      $.ajax({
        url: "/add_instrument/" + instrument_id,
        type: "PATCH",
      });
    }
  )
}

function addGenreAndRunSomeJavaScript() {
  $("select#genre").change(
    function() {
      var genre_id = $("select#genre option:selected")[0].value
      $.ajax({
        url: "/add_genre/" + genre_id,
        type: "PATCH",
      });
    }
  )
}

function addPartialToAddInfluence() {
  $("#add_partial_to_add_influence").click(
    function() {
      $(this).hide();
      $.ajax({
        url: "/add_influence_partial",
        type: "PATCH",
      });
    }
  )
}

function addPartialToAddInstrument() {
  $("#add_partial_to_add_instrument").click(
    function() {
      $(this).hide();
      $.ajax({
        url: "/add_instrument_partial",
        type: "PATCH",
      });
    }
  )
}

function addPartialToAddGenre() {
  $("#add_partial_to_add_genre").click(
    function() {
      $(this).hide();
      $.ajax({
        url: "/add_genre_partial",
        type: "PATCH",
      });
    }
  )
}

function rmInstrument() {
  $("div#instruments-container p a").click(function() {
    var instrument_id = $(this).attr('value');
    // var instrument_id = $($('#instruments-container a')[0]).attr('value'); // LOL DOUBLE DOLLAR SIGN WTF
    $.ajax({
      url: "/rm_instrument/" + instrument_id,
      type: "PATCH",
    });
  })
}

function rmGenre() {
  $("div#genres-container p a").click(function() {
    var genre_id = $(this).attr('value');
    // var genre_id = $($('#instruments-container a')[0]).attr('value'); // LOL DOUBLE DOLLAR SIGN WTF
    $.ajax({
      url: "/rm_genre/" + genre_id,
      type: "PATCH",
    });}
  )
}

function rmInfluence() {
  $("div#influences-container p a").click(function() {
    var influence_id = $(this).attr('value');
    // var influence_id = $($('#instruments-container a')[0]).attr('value'); // LOL DOUBLE DOLLAR SIGN WTF
    $.ajax({
      url: "/rm_influence/" + influence_id,
      type: "PATCH",
    });}
  )
}

function disableButton() {
  $('.submit-clip').click(function() {
    var button = $('.submit-clip')[0]
    var icon = $('center')
    $(button).hide();
    $(icon).show();
    button.closest("form").submit();
  })
};

// function doubleEnter() {
//   $(document).keypress(function(event){
//   	var keycode1 = (event.keyCode ? event.keyCode : event.which);
//   	if(keycode1 === 13 ){
//       $(document).keypress(function(event){
//         var keycode2 = (event.keyCode ? event.keyCode : event.which);
//         if(keycode2 === 13 ){
//     		  alert('You pressed a "enter" key twice!');
//         };
//   	  });
//     };
//     event.stopPropagation();
//   });
// };
//
//
// document.onkeydown = checkKey;
//
// function checkKey(e) {
//
//   e = e || window.event;
//
//   if (e.keyCode == '38') {
//     alert('You pressed the "up" key!');
//   }
//   else if (e.keyCode == '40') {
//     alert('You pressed the "down" key!');
//   }
//   else if (e.keyCode == '37') {
//     alert('You pressed the "left" key!');
//   }
//   else if (e.keyCode == '39') {
//     alert('You pressed the "right" key!');
//   }
//
// };
//
//
//______________________SECRET______________________SAUCE_______________________


$(function() {

  listener = new window.keypress.Listener();

  listener.sequence_combo("n o s t a l g i a", function() {
    $('.cheat-activated').delay(1000).fadeIn(90, function(){
      // $('.dashboard-button').addClass('fa fa-spin')
    }).delay(5000).fadeOut(90);
  });

  listener.sequence_combo("h i d e", function() {
    $('.dashboard-button').hide();
  }, true);

  listener.sequence_combo("s h o w", function() {
    $('.dashboard-button').show();
  }, true);

  listener.sequence_combo("s p i n", function() {
    $('.cheat-activated').delay(1000).fadeIn(100, function(){
      $('.dashboard-button').addClass('fa fa-spin')
    }).delay(5000).fadeOut(100);
  });

  listener.sequence_combo("s t o p", function() {
    $('.dashboard-button').removeClass('fa fa-spin')
  });

  listener.sequence_combo("s d a s h", function() {
    $('.dashboard.dashboard-wrapper').slideUp(2000);
  });

  listener.sequence_combo("s h e a d", function() {
    $('header').slideUp(2000);
  });

  listener.sequence_combo("r e t u r n", function() {
    $('header').show(2000);
    $('.dashboard.dashboard-wrapper').show(2000);
  });

  listener.sequence_combo("up up down down left right left right b a enter", function() {
    console.log("Cheat code");
  }, true);

});

var audio = new Audio('/assets/gta_san_andreas_theme.mp3');

document.onkeydown = function() {
  audio.play();
}


//______________________SECRET______________________SAUCE_______________________

$(addPartialToAddInstrument);
$(addPartialToAddGenre);
$(addPartialToAddInfluence);
$(rmInstrument);
$(rmGenre);
$(rmInfluence);
$(disableButton);
// $(doubleEnter);
