import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["four", "radio", "submitbtn"];

  connect() {
    console.log("Working", this.element);
  }

  handlechange(event) {
    let el = event.target;
    let value = event.target.children[1].innerText;

    console.log(this.submitbtnTarget.children[0]);

    console.log(el.style);
    if (el.style.color == "rgb(255, 200, 0)") {
      console.log("first one");
      this.radioTargets.forEach((element, index) => {
        let input = element.children[0];
        if (input.checked != "") {
          console.log("found the true value");
          input.checked = "";
        }
        element.style = "color: #1E3050";
      });
    } else {
      for (let i = 0; i < this.radioTargets.length; i++) {
        let element = this.radioTargets[i];
        console.log("second one");
        let input = element.children[0];
        let label = element.children[1];

        if (value == label.innerText) {
          input.checked = "true";
          element.style = "color: #ffc800";
          break;
        } else {
          element.style = "color: #ffc800";
        }
      }
    }

    console.log("working somehting", value, this.radioTargets);
    this.submitbtnTarget.children[0].click();
  }
}
