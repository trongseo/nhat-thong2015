Emotions plugin for TinyMCE improved version by ralf57
Published at 12/12/2004
This plugin uses emoticons from Invision Board
Credits for the pics go to them
------------------------------

Installation instructions:
  * Copy the emotions directory to the plugins directory of TinyMCE (/jscripts/tiny_mce/plugins).
  * Add plugin to TinyMCE plugin option list example: plugins : "emotions".
  * Add the emotions button name to button list, example: theme_advanced_buttons3_add : "emotions".

Initialization example:
  tinyMCE.init({
    theme : "advanced",
    mode : "textareas",
    plugins : "emotions",
    theme_advanced_buttons3_add : "emotions"
  });
