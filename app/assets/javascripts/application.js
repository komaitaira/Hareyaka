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
//= require_tree .


$(function() {
	$(document).on('turbolinks:load', () => {
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