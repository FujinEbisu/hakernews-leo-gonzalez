import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="upvote"
export default class extends Controller {
  static targets = ["upvote"]
  
  connect() {
    console.log("Upvote controller connected");
  }

  upvote() {
    console.log("Upvote button clicked");
  }
}
