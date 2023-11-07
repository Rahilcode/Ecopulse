import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["name", "post", "location"];
  static value = { posts: Array };
  connect() {
    console.log("Working", this.element);
    this.postsValue = this.postTargets;
  }

  filter(event) {
    let value = event.target.value.trim();
    // console.log(this.postTargets);
    this.postsValue.forEach((element, index) => {
      value = value.toLowerCase();
      let name = this.nameTargets[index].innerText.toLowerCase();
      if (name.includes(value)) {
        element.classList.remove("d-none");
      } else {
        element.classList.add("d-none");
      }
      console.log(this.nameTargets[index].innerText);
    });
  }

  selectFilter(event) {
    console.log(event.target.value);
    let val = event.target.value.toLowerCase().trim();

    let c = 0;
    let tempArray = [];
    this.postTargets.forEach((element, index) => {
      let cities = this.locationTargets[index].children;

      let flag = false;

      let city = cities[0].innerText.toLowerCase().trim();
      console.log(city);
      if (city == val) {
        console.log(city, val);
        console.log("true");
        flag = true;
      } else {
        flag = false;
        console.log("false");
      }

      // If there are more than one city
      // for (let i = 0; i < cities.length; i++) {
      //   let city = cities[i].innerText.toLowerCase();

      //   if (city == val) {
      //     console.log(city, val);
      //     flag = true;
      //     c++;
      //     break;
      //   } else {
      //     console.log("false");
      //     flag = false;
      //   }
      // }

      if (flag) {
        element.classList.remove("d-none");
        tempArray.push(element);
      } else {
        element.classList.add("d-none");
      }

      console.log(cities);
    });

    if (c == 0 && val == "all") {
      this.postsValue = this.postTargets;
      this.postTargets.forEach((ele) => {
        ele.classList.remove("d-none");
      });
    } else {
      this.postsValue = tempArray;
    }
  }
}
