document.getElementById('language-selection').addEventListener('change', function () {
  // if we make a selection, we want to enable the code input
  var language = document.getElementById('language-selection').value;
  if (language) {
    var code_input = document.getElementsByClassName('code-input')[0];
    code_input.disabled = false;
    code_input.focus();
    // set the placeholder
    code_input.placeholder = "Please input your ORM code here.";
  } else {
    document.getElementsByClassName('code-input')[0].disabled = true;
    code_input.placeholder = "Please select a language first.";
  }
});

window.onload = function() {
  var code_input = document.getElementsByClassName('code-input')[0];
  code_input.disabled = true;
};