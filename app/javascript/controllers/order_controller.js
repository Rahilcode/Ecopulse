import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["payment", "orderform", "cardform", "upiform"];

  connect() {
    console.log("Working", this.element);
  }

  handlechange() {
    this.orderformTarget.classList.add("d-none");
    this.paymentTarget.classList.remove("d-none");
  }

  handlecancel() {
    this.orderformTarget.classList.remove("d-none");
    this.paymentTarget.classList.add("d-none");
  }

  handleradio(event) {
    let value = event.target.value.toLowerCase();

    if (value == "card") {
      this.cardformTarget.classList.remove("d-none");
      this.upiformTarget.classList.add("d-none");
    } else if (value == "upi") {
      this.cardformTarget.classList.add("d-none");
      this.upiformTarget.classList.remove("d-none");
    } else {
      this.cardformTarget.classList.add("d-none");
      this.upiformTarget.classList.add("d-none");
    }
  }
}
