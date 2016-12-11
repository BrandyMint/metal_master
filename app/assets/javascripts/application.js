//= require jquery
//= require jquery_ujs
//= require jquery.minicolors
//= require jquery.minicolors.simple_form
//= require nprogress
//= require nprogress-turbolinks
//= require tether
//= require cocoon
//= require better-dom
//= require better-i18n-plugin
//= require better-popover-plugin
//= require better-form-validation
//= require better-form-validation/i18n/better-form-validation.ru
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .


var bootstrapColorpicker = function() {
  console.log('bootstrap colorpicker');
  $('[data-minicolors]').each(function(i, elem) {
    var input = $(this);
    input.minicolors(input.data('minicolors'));
  });
};

$(bootstrapColorpicker);
document.addEventListener("turbolinks:load", bootstrapColorpicker);
