// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require popper
//= require bootstrap
//= require summernote/summernote-bs4.min
//= require summernote-init
//= require activestorage
//= require turbolinks
//= require chartkick
//= require Chart.bundle
//= require_tree .


$(function() {
	$(document).on('turbolinks:load', function() {
		// 住所自動入力機能
    $('#user_postal_code').jpostal({
      postcode : [
      '#user_postal_code'
      ],

      address: {
        "#user_address": "%3%4%5%6%7"
      }
    });
    $('#company_postal_code').jpostal({
      postcode : [
      '#company_postal_code'
      ],

      address: {
        "#company_address": "%3%4%5%6%7"
      }
    });
	});
});

// TOPページフェードイン
$(function() {
  $('#box1').hide().fadeIn(2000);
});

$(function() {
  $('#box2').hide().fadeIn(2000);
});

// 画像プレビュー機能
$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('.image_preview').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#image-field").change(function(){
    readURL(this);
  });
});