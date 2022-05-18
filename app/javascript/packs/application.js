// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

// Use bootstrap5
import "bootstrap"
import "../stylesheets/application"
import "../js/shared";

// Use font-awesome
import '@fortawesome/fontawesome-free/js/all';

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// Used for Semantic UI
require('jquery')